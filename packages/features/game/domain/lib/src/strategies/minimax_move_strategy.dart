import 'dart:math';

import 'package:game_domain/src/behaviors/evaluate_outcome.dart';
import 'package:game_domain/src/entities/board.br.dart';
import 'package:game_domain/src/entities/game_outcome.br.dart';
import 'package:game_domain/src/entities/mark.dart';
import 'package:game_domain/src/strategies/move_strategy.dart';

/// Perfect play: full minimax with alpha-beta pruning. Tic-tac-toe is solved, so this
/// never loses.
///
/// Ties are broken at random rather than by lowest index, otherwise the opponent replays
/// the same game every time.
class MinimaxMoveStrategy implements MoveStrategy {
  const MinimaxMoveStrategy({required this.random, this.evaluateOutcome = const EvaluateOutcome()});

  static const int _win = 10;
  static const int _bound = 1000;

  final EvaluateOutcome evaluateOutcome;
  final Random random;

  @override
  int chooseMove(Board board, Mark mark) {
    var bestScore = -_bound;
    final bestMoves = <int>[];

    for (final index in board.freeIndexes) {
      final score = _scoreOf(board.withMark(index, mark), mark, mark.opponent, 1, -_bound, _bound);

      if (score > bestScore) {
        bestScore = score;
        bestMoves
          ..clear()
          ..add(index);
      } else if (score == bestScore) {
        bestMoves.add(index);
      }
    }

    if (bestMoves.isEmpty) throw StateError('chooseMove called on a full board');

    return bestMoves[random.nextInt(bestMoves.length)];
  }

  int _scoreOf(Board board, Mark forMark, Mark turn, int depth, int alpha, int beta) {
    final outcome = evaluateOutcome(board);
    if (outcome is! GameInProgress) return _leafScore(outcome, forMark, depth);

    final maximizing = turn == forMark;
    var best = maximizing ? -_bound : _bound;
    var low = alpha;
    var high = beta;

    for (final index in board.freeIndexes) {
      final score = _scoreOf(
        board.withMark(index, turn),
        forMark,
        turn.opponent,
        depth + 1,
        low,
        high,
      );

      if (maximizing) {
        best = max(best, score);
        low = max(low, best);
      } else {
        best = min(best, score);
        high = min(high, best);
      }

      if (high <= low) break;
    }

    return best;
  }

  /// Depth enters the score so a near win beats a distant one, and a distant loss beats
  /// a near one. Without it a winning opponent stalls instead of closing, which reads as
  /// a bug on screen.
  int _leafScore(GameOutcome outcome, Mark forMark, int depth) => switch (outcome) {
    GameWin(:final mark) when mark == forMark => _win - depth,
    GameWin() => depth - _win,
    _ => 0,
  };
}
