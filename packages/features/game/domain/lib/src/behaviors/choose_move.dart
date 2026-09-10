import 'package:game_domain/src/entities/difficulty.dart';
import 'package:game_domain/src/entities/game.br.dart';
import 'package:game_domain/src/strategies/move_strategy.dart';

/// Maps a difficulty to a strategy. Holds no algorithm of its own.
class ChooseMove {
  const ChooseMove({required this.easy, required this.hard, required this.medium});

  final MoveStrategy easy;
  final MoveStrategy hard;
  final MoveStrategy medium;

  int call(Game game) => switch (game.difficulty) {
    Difficulty.easy => easy,
    Difficulty.hard => hard,
    Difficulty.medium => medium,
  }.chooseMove(game.board, game.turn);
}
