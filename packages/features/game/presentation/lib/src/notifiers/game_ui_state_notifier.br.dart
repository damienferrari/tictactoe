import 'package:game_domain/game_domain.dart';
import 'package:game_presentation/src/providers_di.br.dart';
import 'package:game_presentation/src/state/game_ui_state.br.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_ui_state_notifier.br.g.dart';

@riverpod
class GameUiStateNotifier extends _$GameUiStateNotifier {
  @override
  GameUiState build() {
    final game = Game.fresh(difficulty: Difficulty.hard, humanMark: Mark.x);
    return GameUiState(game: game);
  }

  void newGame({required Difficulty difficulty, required Mark humanMark}) {
    state = GameUiState(
      game: Game.fresh(difficulty: difficulty, humanMark: humanMark),
    );

    // Picking `o` hands the opening move over, so the opponent has to move now.
    if (!state.game.isHumanTurn) _playCpuMove();
  }

  void play(int index) {
    if (!state.acceptsMoves) return;

    final outcome = ref.read(applyMoveProvider)(state.game, by: state.game.humanMark, index: index);
    if (outcome case MoveAccepted(:final game)) {
      state = state.copyWith(game: game);
      _announceIfFinished();

      if (!game.isOver) _playCpuMove();
    }
  }

  Future<void> _playCpuMove() async {
    state = state.copyWith(isCpuThinking: true);

    await Future<void>.delayed(ref.read(cpuMoveDelayProvider));

    // The notifier may have been disposed, or a new game started, while we waited.
    if (!ref.mounted || !state.isCpuThinking) return;

    final game = state.game;
    final index = ref.read(chooseCpuMoveProvider)(game);
    final outcome = ref.read(applyMoveProvider)(game, by: game.cpuMark, index: index);

    state = switch (outcome) {
      MoveAccepted(:final game) => state.copyWith(game: game, isCpuThinking: false),
      MoveRejected() => state.copyWith(isCpuThinking: false),
    };

    _announceIfFinished();
  }

  void _announceIfFinished() {
    if (!state.game.isOver) return;

    ref.read(onGameFinishedProvider)(humanMark: state.game.humanMark, outcome: state.game.outcome);
  }
}
