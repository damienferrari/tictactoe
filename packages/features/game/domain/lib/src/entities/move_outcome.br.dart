import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_domain/src/entities/game.br.dart';

part 'move_outcome.br.freezed.dart';

enum MoveRejection { cellTaken, gameOver, notYourTurn, outOfBounds }

/// An illegal move is a value to handle, not an exception to catch.
@freezed
sealed class MoveOutcome with _$MoveOutcome {
  const factory MoveOutcome.accepted(Game game) = MoveAccepted;

  const factory MoveOutcome.rejected(MoveRejection reason) = MoveRejected;
}
