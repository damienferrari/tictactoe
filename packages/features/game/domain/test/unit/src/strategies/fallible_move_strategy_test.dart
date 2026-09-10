import 'dart:math';

import 'package:game_domain/game_domain.dart';
import 'package:game_domain/src/strategies/fallible_move_strategy.dart';
import 'package:game_domain/src/strategies/move_strategy.dart';
import 'package:test/test.dart';

class _AlwaysPlays implements MoveStrategy {
  const _AlwaysPlays(this.index);

  final int index;

  @override
  int chooseMove(Board board, Mark mark) => index;
}

/// Returns the queued doubles in order, so a test states the draws it wants instead of
/// hoping a seed produces them.
class _QueuedDoubles implements Random {
  _QueuedDoubles(this._values);

  final List<double> _values;
  int _cursor = 0;

  @override
  double nextDouble() => _values[_cursor++ % _values.length];

  @override
  bool nextBool() => false;

  @override
  int nextInt(int max) => 0;
}

void main() {
  const perfect = _AlwaysPlays(4);
  const fallback = _AlwaysPlays(0);

  test('plays the perfect move when the draw lands above the blunder rate', () {
    final strategy = FallibleMoveStrategy(
      blunderRate: 0.2,
      fallback: fallback,
      perfect: perfect,
      random: _QueuedDoubles([0.9]),
    );

    expect(strategy.chooseMove(Board.empty, Mark.o), 4);
  });

  test('blunders when the draw lands below the blunder rate', () {
    final strategy = FallibleMoveStrategy(
      blunderRate: 0.2,
      fallback: fallback,
      perfect: perfect,
      random: _QueuedDoubles([0.05]),
    );

    expect(strategy.chooseMove(Board.empty, Mark.o), 0);
  });

  test('a zero blunder rate never falls back', () {
    final strategy = FallibleMoveStrategy(
      blunderRate: 0,
      fallback: fallback,
      perfect: perfect,
      random: _QueuedDoubles([0]),
    );

    expect(strategy.chooseMove(Board.empty, Mark.o), 4);
  });
}
