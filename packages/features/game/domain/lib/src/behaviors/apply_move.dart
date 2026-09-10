import 'package:game_domain/src/behaviors/evaluate_outcome.dart';
import 'package:game_domain/src/entities/board.br.dart';
import 'package:game_domain/src/entities/game.br.dart';
import 'package:game_domain/src/entities/game_outcome.br.dart';
import 'package:game_domain/src/entities/mark.dart';
import 'package:game_domain/src/entities/move_outcome.br.dart';

/// The only place that decides whether a move is legal.
///
/// Takes `by` so turn order is enforced here rather than trusted from the caller: a
/// buggy screen cannot make the human play on the opponent's turn.
class ApplyMove {
  const ApplyMove({this.evaluateOutcome = const EvaluateOutcome()});

  final EvaluateOutcome evaluateOutcome;

  MoveOutcome call(Game game, {required Mark by, required int index}) {
    if (game.isOver) return const MoveOutcome.rejected(MoveRejection.gameOver);
    if (by != game.turn) return const MoveOutcome.rejected(MoveRejection.notYourTurn);
    if (index < 0 || index >= Board.cellCount) {
      return const MoveOutcome.rejected(MoveRejection.outOfBounds);
    }
    if (!game.board.isFree(index)) return const MoveOutcome.rejected(MoveRejection.cellTaken);

    final board = game.board.withMark(index, by);
    final outcome = evaluateOutcome(board);

    return MoveOutcome.accepted(
      game.copyWith(
        board: board,
        outcome: outcome,
        turn: outcome is GameInProgress ? by.opponent : by,
      ),
    );
  }
}
