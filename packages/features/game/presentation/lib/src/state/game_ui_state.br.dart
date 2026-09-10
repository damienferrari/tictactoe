import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_domain/game_domain.dart';

part 'game_ui_state.br.freezed.dart';

@freezed
abstract class GameUiState with _$GameUiState {
  const factory GameUiState({required Game game, @Default(false) bool isCpuThinking}) =
      _GameUiState;

  const GameUiState._();

  Mark? markAt(int index) => game.board.markAt(index);

  bool isWinning(int index) => switch (game.outcome) {
    GameWin(:final line) => line.contains(index),
    _ => false,
  };

  /// Taps are refused while the opponent is deciding, so a fast player cannot slip a
  /// second move in before the reply lands.
  bool get acceptsMoves => !game.isOver && game.isHumanTurn && !isCpuThinking;

  /// A started, unfinished game — restarting it would throw progress away, so the player
  /// is asked first.
  bool get isInterruptible => !game.isOver && game.board != Board.empty;
}
