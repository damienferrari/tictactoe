import 'package:game_domain/src/entities/board.br.dart';
import 'package:game_domain/src/entities/mark.dart';

abstract interface class MoveStrategy {
  /// The board must have at least one free cell.
  int chooseMove(Board board, Mark mark);
}
