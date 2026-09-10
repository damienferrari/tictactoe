import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scoreboard_domain/src/entities/match_result.dart';

part 'scoreboard.br.freezed.dart';

@freezed
abstract class Scoreboard with _$Scoreboard {
  const factory Scoreboard({@Default(0) int draws, @Default(0) int losses, @Default(0) int wins}) =
      _Scoreboard;

  const Scoreboard._();

  static const Scoreboard empty = Scoreboard();

  int get played => draws + losses + wins;

  int countOf(MatchResult result) => switch (result) {
    MatchResult.draw => draws,
    MatchResult.loss => losses,
    MatchResult.win => wins,
  };

  Scoreboard incremented(MatchResult result) => switch (result) {
    MatchResult.draw => copyWith(draws: draws + 1),
    MatchResult.loss => copyWith(losses: losses + 1),
    MatchResult.win => copyWith(wins: wins + 1),
  };
}
