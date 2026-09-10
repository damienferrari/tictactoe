import 'package:game_domain/game_domain.dart';
import 'package:test/test.dart';

void main() {
  group('an empty board', () {
    test('has nine free cells', () {
      expect(Board.empty.freeIndexes, hasLength(Board.cellCount));
      expect(Board.empty.isFull, isFalse);
    });
  });

  group('placing a mark', () {
    test('leaves the original board untouched', () {
      final played = Board.empty.withMark(4, Mark.x);

      expect(played.markAt(4), Mark.x);
      expect(Board.empty.markAt(4), isNull);
    });

    test('removes the cell from the free ones', () {
      expect(Board.empty.withMark(4, Mark.x).freeIndexes, isNot(contains(4)));
    });
  });

  group('equality', () {
    // The reason cells are an IList: two boards holding the same marks must compare
    // equal, or every rebuild looks like a change and redraws the screen.
    test('two boards with the same marks are equal', () {
      expect(Board.empty.withMark(0, Mark.x), Board.empty.withMark(0, Mark.x));
    });
  });

  group('the winning lines', () {
    test('there are eight of them, and each names three distinct cells', () {
      expect(Board.lines, hasLength(8));

      for (final line in Board.lines) {
        expect(line.indexes.toSet(), hasLength(3));
        expect(line.indexes, everyElement(inInclusiveRange(0, Board.cellCount - 1)));
      }
    });
  });
}
