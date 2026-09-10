import 'dart:math';

import 'package:game_domain/src/entities/board.br.dart';
import 'package:game_domain/src/entities/mark.dart';
import 'package:game_domain/src/strategies/move_strategy.dart';

/// Perfect play that blunders on purpose, at a given rate.
///
/// A player improves against an opponent that makes mistakes, not against one that plays
/// shallow — a depth-limited minimax is predictably weak in the same positions every
/// time, whereas this one is beatable without being exploitable.
class FallibleMoveStrategy implements MoveStrategy {
  const FallibleMoveStrategy({
    required this.blunderRate,
    required this.fallback,
    required this.perfect,
    required this.random,
  });

  final double blunderRate;
  final MoveStrategy fallback;
  final MoveStrategy perfect;
  final Random random;

  @override
  int chooseMove(Board board, Mark mark) => random.nextDouble() < blunderRate
      ? fallback.chooseMove(board, mark)
      : perfect.chooseMove(board, mark);
}
