import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_domain/src/entities/mark.dart';
import 'package:game_domain/src/entities/winning_line.dart';

part 'board.br.freezed.dart';

/// Cells are indexed 0..8, reading order. A single int addresses a move, which keeps
/// row/column pairs out of every signature.
///
/// `IList` rather than `List`: this sits in watched state, and a `List` compares by
/// identity — every rebuilt board would look different and redraw the whole screen.
@freezed
abstract class Board with _$Board {
  const factory Board(IList<Mark?> cells) = _Board;

  const Board._();

  static const int side = 3;
  static const int cellCount = side * side;

  static const Board empty = Board(
    IListConst<Mark?>([null, null, null, null, null, null, null, null, null]),
  );

  static const List<WinningLine> lines = [
    WinningLine(0, 1, 2),
    WinningLine(3, 4, 5),
    WinningLine(6, 7, 8),
    WinningLine(0, 3, 6),
    WinningLine(1, 4, 7),
    WinningLine(2, 5, 8),
    WinningLine(0, 4, 8),
    WinningLine(2, 4, 6),
  ];

  Mark? markAt(int index) => cells[index];

  bool isFree(int index) => cells[index] == null;

  bool get isFull => cells.every((cell) => cell != null);

  List<int> get freeIndexes => [
    for (var index = 0; index < cellCount; index++)
      if (cells[index] == null) index,
  ];

  Board withMark(int index, Mark mark) => Board(cells.put(index, mark));
}
