import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_domain/game_domain.dart';
import 'package:game_presentation/src/notifiers/game_ui_state_notifier.br.dart';
import 'package:game_presentation/src/state/game_ui_state.br.dart';

import '../../../support/harness.dart';

void main() {
  late RecordedResults results;
  late ProviderContainer container;

  GameUiStateNotifier notifier() => container.read(gameUiStateProvider.notifier);
  GameUiState currentState() => container.read(gameUiStateProvider);

  /// Plays the first free cell until the game ends, so a test can reach an outcome
  /// without hard-coding the opponent's replies.
  Future<void> playToTheEnd() async {
    var guard = 0;
    while (!currentState().game.isOver && guard++ <= 9) {
      final free = currentState().game.board.freeIndexes;
      if (free.isEmpty) break;
      notifier().play(free.first);
      await pumpEventQueue();
    }
  }

  setUp(() {
    results = RecordedResults();
    container = ProviderContainer(overrides: testOverrides(results: results));
    addTearDown(container.dispose);
    // Keeps the notifier alive across the awaits the opponent's turn introduces.
    addTearDown(container.listen(gameUiStateProvider, (_, _) {}).close);
  });

  group('starting a game', () {
    test('the board is empty and the player moves first', () {
      expect(currentState().game.board, Board.empty);
      expect(currentState().acceptsMoves, isTrue);
    });

    test('choosing noughts hands the opening move to the machine', () async {
      notifier().newGame(difficulty: Difficulty.easy, humanMark: Mark.o);
      await pumpEventQueue();

      expect(currentState().game.board.freeIndexes, hasLength(8));
      expect(currentState().game.turn, Mark.o);
    });
  });

  group('playing', () {
    test('a tap places the mark and the machine answers', () async {
      notifier().play(4);
      await pumpEventQueue();

      expect(currentState().game.board.markAt(4), Mark.x);
      expect(currentState().game.board.freeIndexes, hasLength(7));
      expect(currentState().acceptsMoves, isTrue);
    });

    test('tapping an occupied cell changes nothing', () async {
      notifier().play(4);
      await pumpEventQueue();
      final before = currentState().game;

      notifier().play(4);
      await pumpEventQueue();

      expect(currentState().game, before);
    });

    test('taps are ignored while the machine is deciding', () {
      notifier().play(0);

      // No pump on purpose: the opponent's turn is still in flight.
      expect(currentState().isCpuThinking, isTrue);
      notifier().play(1);

      expect(currentState().game.board.markAt(1), isNull);
    });
  });

  group('finishing', () {
    test('the outcome is published exactly once', () async {
      notifier().newGame(difficulty: Difficulty.easy, humanMark: Mark.x);
      await playToTheEnd();

      expect(currentState().game.isOver, isTrue);
      expect(results.published, hasLength(1));
      expect(results.published.single.humanMark, Mark.x);
    });

    test('nothing is published while the game is running', () async {
      notifier().play(0);
      await pumpEventQueue();

      expect(results.published, isEmpty);
    });

    test('the unbeatable opponent never lets the player win', () async {
      notifier().newGame(difficulty: Difficulty.hard, humanMark: Mark.x);
      await playToTheEnd();

      final outcome = currentState().game.outcome;

      expect(outcome, isNot(isA<GameWin>().having((win) => win.mark, 'winner', Mark.x)));
    });
  });
}
