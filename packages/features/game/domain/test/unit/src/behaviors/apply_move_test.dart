import 'package:game_domain/game_domain.dart';
import 'package:game_domain/src/behaviors/apply_move.dart';
import 'package:test/test.dart';

void main() {
  const applyMove = ApplyMove();

  final game = Game.fresh(difficulty: Difficulty.hard, humanMark: Mark.x);

  group('a legal move', () {
    test('places the mark and hands the turn over', () {
      final outcome = applyMove(game, by: Mark.x, index: 4);

      expect(
        outcome,
        isA<MoveAccepted>()
            .having((accepted) => accepted.game.board.markAt(4), 'mark at 4', Mark.x)
            .having((accepted) => accepted.game.turn, 'turn', Mark.o),
      );
    });

    test('a winning move keeps the turn on the winner', () {
      final won = game.copyWith(board: Board.empty.withMark(0, Mark.x).withMark(1, Mark.x));

      final outcome = applyMove(won, by: Mark.x, index: 2);

      expect(
        outcome,
        isA<MoveAccepted>()
            .having((accepted) => accepted.game.outcome, 'outcome', isA<GameWin>())
            .having((accepted) => accepted.game.turn, 'turn', Mark.x),
      );
    });
  });

  group('a rejected move', () {
    test('playing an occupied cell changes nothing', () {
      final played = applyMove(game, by: Mark.x, index: 4);
      final board = (played as MoveAccepted).game;

      expect(
        applyMove(board, by: Mark.o, index: 4),
        const MoveOutcome.rejected(MoveRejection.cellTaken),
      );
    });

    test('playing out of turn is refused even if the cell is free', () {
      expect(
        applyMove(game, by: Mark.o, index: 0),
        const MoveOutcome.rejected(MoveRejection.notYourTurn),
      );
    });

    test('playing off the board is refused', () {
      expect(
        applyMove(game, by: Mark.x, index: Board.cellCount),
        const MoveOutcome.rejected(MoveRejection.outOfBounds),
      );
      expect(
        applyMove(game, by: Mark.x, index: -1),
        const MoveOutcome.rejected(MoveRejection.outOfBounds),
      );
    });

    test('playing after the game ended is refused', () {
      final finished = game.copyWith(
        outcome: const GameOutcome.win(line: WinningLine(0, 1, 2), mark: Mark.x),
      );

      expect(
        applyMove(finished, by: Mark.o, index: 8),
        const MoveOutcome.rejected(MoveRejection.gameOver),
      );
    });
  });
}
