import 'package:scoreboard_domain/scoreboard_domain.dart';
import 'package:scoreboard_domain/src/behaviors/record_match.dart';
import 'package:test/test.dart';

class _InMemoryRepository implements ScoreboardRepository {
  _InMemoryRepository([this.stored = Scoreboard.empty]);

  Scoreboard stored;
  int writes = 0;

  @override
  Future<Scoreboard> read() async => stored;

  @override
  Future<void> write(Scoreboard scoreboard) async {
    stored = scoreboard;
    writes++;
  }
}

void main() {
  test('a recorded win is added to what was already stored', () async {
    final repository = _InMemoryRepository(const Scoreboard(wins: 2));
    final recordMatch = RecordMatch(repository: repository);

    final updated = await recordMatch(MatchResult.win);

    expect(updated.wins, 3);
    expect(repository.stored.wins, 3);
  });

  test('the new tally is persisted, not just returned', () async {
    final repository = _InMemoryRepository();

    await RecordMatch(repository: repository)(MatchResult.draw);

    expect(repository.writes, 1);
    expect(repository.stored, const Scoreboard(draws: 1));
  });
}
