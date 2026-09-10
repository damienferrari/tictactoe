import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_domain/src/entities/board.br.dart';
import 'package:game_domain/src/entities/difficulty.dart';
import 'package:game_domain/src/entities/game_outcome.br.dart';
import 'package:game_domain/src/entities/mark.dart';

part 'game.br.freezed.dart';

@freezed
abstract class Game with _$Game {
  const factory Game({
    required Board board,
    required Difficulty difficulty,
    required Mark humanMark,
    required GameOutcome outcome,
    required Mark turn,
  }) = _Game;

  const Game._();

  /// `x` opens, always — so picking `o` hands the first move to the opponent.
  factory Game.fresh({required Difficulty difficulty, required Mark humanMark}) => Game(
    board: Board.empty,
    difficulty: difficulty,
    humanMark: humanMark,
    outcome: const GameOutcome.inProgress(),
    turn: Mark.x,
  );

  Mark get cpuMark => humanMark.opponent;

  bool get isHumanTurn => turn == humanMark;

  bool get isOver => outcome is! GameInProgress;
}
