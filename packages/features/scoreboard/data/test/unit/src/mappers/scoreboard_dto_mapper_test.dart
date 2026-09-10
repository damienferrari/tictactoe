import 'package:scoreboard_data/src/dtos/scoreboard_dto.br.dart';
import 'package:scoreboard_data/src/mappers/scoreboard_dto_mapper.dart';
import 'package:scoreboard_domain/scoreboard_domain.dart';
import 'package:test/test.dart';

void main() {
  test('an entity survives a round trip through the stored shape', () {
    const scoreboard = Scoreboard(draws: 3, losses: 7, wins: 5);

    expect(scoreboard.toDto().toEntity(), scoreboard);
  });

  test('a payload missing a field reads as zero rather than failing', () {
    final dto = ScoreboardDto.fromJson({'wins': 2});

    expect(dto.toEntity(), const Scoreboard(wins: 2));
  });
}
