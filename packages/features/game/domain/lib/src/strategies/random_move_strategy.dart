import 'dart:math';

import 'package:game_domain/src/entities/board.br.dart';
import 'package:game_domain/src/entities/mark.dart';
import 'package:game_domain/src/strategies/move_strategy.dart';

class RandomMoveStrategy implements MoveStrategy {
  const RandomMoveStrategy({required this.random});

  final Random random;

  @override
  int chooseMove(Board board, Mark mark) {
    final free = board.freeIndexes;
    if (free.isEmpty) throw StateError('chooseMove called on a full board');

    return free[random.nextInt(free.length)];
  }
}
