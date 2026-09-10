import 'package:game_domain/game_domain.dart';
import 'package:game_domain/src/behaviors/evaluate_outcome.dart';
import 'package:test/test.dart';

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

  group('a game in progress', () {
    test('an empty board has no outcome yet', () {
      expect(evaluateOutcome(Board.empty), const GameOutcome.inProgress());
    });

    test('two aligned marks are not a win', () {
      expect(evaluateOutcome(_boardOf('XX.......')), const GameOutcome.inProgress());
    });
  });

  group('a won game', () {
    for (final line in Board.lines) {
      for (final mark in Mark.values) {
        test('${mark.label} wins on $line', () {
          var board = Board.empty;
          for (final index in line.indexes) {
            board = board.withMark(index, mark);
          }

          expect(evaluateOutcome(board), GameOutcome.win(line: line, mark: mark));
        });
      }
    }

    test('the outcome carries the line that won, so the UI can stroke it', () {
      final outcome = evaluateOutcome(_boardOf('XXXOO....'));

      expect(outcome, isA<GameWin>().having((win) => win.line, 'line', const WinningLine(0, 1, 2)));
    });
  });

  group('a drawn game', () {
    test('a full board with no alignment is a draw', () {
      expect(evaluateOutcome(_boardOf('XXOOOXXOX')), const GameOutcome.draw());
    });
  });
}
