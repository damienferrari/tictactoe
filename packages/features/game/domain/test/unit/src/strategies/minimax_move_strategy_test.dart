import 'dart:math';

import 'package:game_domain/game_domain.dart';
import 'package:game_domain/src/behaviors/evaluate_outcome.dart';
import 'package:game_domain/src/strategies/minimax_move_strategy.dart';
import 'package:test/test.dart';

/// Drives tie-breaking instead of leaving it to chance: the strategy calls `nextInt`
/// once, over the list of equally-best moves, so forcing that index lets a test walk
/// every optimal reply rather than one sample of them.
class _NthBestMove implements Random {
  const _NthBestMove(this.nth);

  final int nth;

  @override
  int nextInt(int max) => nth < max ? nth : max - 1;

  @override
  bool nextBool() => false;

  @override
  double nextDouble() => 0;
}

Board _boardOf(String cells) => Board(
  IList([
    for (final char in cells.split(''))
      switch (char) {
        'X' => Mark.x,
        'O' => Mark.o,
        _ => null,
      },
  ]),
);

void main() {
  const evaluateOutcome = EvaluateOutcome();

  group('immediate tactics', () {
    test('takes the win rather than prolonging the game', () {
      const strategy = MinimaxMoveStrategy(random: _NthBestMove(0));

      expect(strategy.chooseMove(_boardOf('OO.XX....'), Mark.o), 2);
    });

    test('blocks the opponent when there is nothing better', () {
      const strategy = MinimaxMoveStrategy(random: _NthBestMove(0));

      expect(strategy.chooseMove(_boardOf('XX...O...'), Mark.o), 2);
    });

    test('prefers the shorter win: depth is part of the score', () {
      // O can win at once on 2, or set up a fork. A strategy ignoring depth may wander.
      const strategy = MinimaxMoveStrategy(random: _NthBestMove(0));

      expect(strategy.chooseMove(_boardOf('OO.XX..X.'), Mark.o), 2);
    });
  });

  group('perfect play', () {
    // The whole point of minimax: not "usually wins" but "cannot lose". Sampling a few
    // games would prove nothing, so this walks the entire tree — every human move at
    // every human turn, against every optimal reply the opponent could pick.
    for (final humanMark in Mark.values) {
      test('never loses when the player holds ${humanMark.label}', () {
        final cpuMark = humanMark.opponent;

        for (var nth = 0; nth < Board.cellCount; nth++) {
          final strategy = MinimaxMoveStrategy(random: _NthBestMove(nth));

          void explore(Board board, Mark turn) {
            final outcome = evaluateOutcome(board);

            if (outcome case GameWin(:final mark)) {
              expect(
                mark,
                isNot(humanMark),
                reason: 'the opponent lost on $board with tie-break $nth',
              );
              return;
            }
            if (board.isFull) return;

            if (turn == humanMark) {
              for (final index in board.freeIndexes) {
                explore(board.withMark(index, humanMark), cpuMark);
              }
            } else {
              explore(board.withMark(strategy.chooseMove(board, cpuMark), cpuMark), humanMark);
            }
          }

          explore(Board.empty, Mark.x);
        }
      });
    }

    test('two perfect players always draw', () {
      for (var nth = 0; nth < Board.cellCount; nth++) {
        final strategy = MinimaxMoveStrategy(random: _NthBestMove(nth));

        var board = Board.empty;
        var turn = Mark.x;

        while (evaluateOutcome(board) is GameInProgress) {
          board = board.withMark(strategy.chooseMove(board, turn), turn);
          turn = turn.opponent;
        }

        expect(evaluateOutcome(board), const GameOutcome.draw());
      }
    });
  });

  group('preconditions', () {
    test('asking for a move on a full board fails loudly', () {
      const strategy = MinimaxMoveStrategy(random: _NthBestMove(0));

      expect(() => strategy.chooseMove(_boardOf('XXOOOXXOX'), Mark.x), throwsStateError);
    });
  });
}
