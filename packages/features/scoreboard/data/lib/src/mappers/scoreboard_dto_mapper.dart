import 'package:scoreboard_data/src/dtos/scoreboard_dto.br.dart';
import 'package:scoreboard_domain/scoreboard_domain.dart';

extension ScoreboardDtoMapper on ScoreboardDto {
  Scoreboard toEntity() => Scoreboard(draws: draws, losses: losses, wins: wins);
}

extension ScoreboardEntityMapper on Scoreboard {
  ScoreboardDto toDto() => ScoreboardDto(draws: draws, losses: losses, wins: wins);
}
