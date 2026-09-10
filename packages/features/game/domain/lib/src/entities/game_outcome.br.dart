import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_domain/src/entities/mark.dart';
import 'package:game_domain/src/entities/winning_line.dart';

part 'game_outcome.br.freezed.dart';

/// A win carries its line, not just its winner: the alignment is computed once, where
/// it is already known.
@freezed
sealed class GameOutcome with _$GameOutcome {
  const factory GameOutcome.draw() = GameDraw;

  const factory GameOutcome.inProgress() = GameInProgress;

  const factory GameOutcome.win({required WinningLine line, required Mark mark}) = GameWin;
}
