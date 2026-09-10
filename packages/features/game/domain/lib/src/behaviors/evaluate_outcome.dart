import 'package:game_domain/src/entities/board.br.dart';
import 'package:game_domain/src/entities/game_outcome.br.dart';

class EvaluateOutcome {
  const EvaluateOutcome();

  GameOutcome call(Board board) {
    for (final line in Board.lines) {
      final mark = board.markAt(line.first);
      if (mark == null) continue;

      if (board.markAt(line.second) == mark && board.markAt(line.third) == mark) {
        return GameOutcome.win(line: line, mark: mark);
      }
    }

    return board.isFull ? const GameOutcome.draw() : const GameOutcome.inProgress();
  }
}
