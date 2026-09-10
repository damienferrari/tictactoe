import 'package:scoreboard_domain/scoreboard_domain.dart';
import 'package:test/test.dart';

void main() {
  group('a fresh scoreboard', () {
    test('counts nothing', () {
      expect(Scoreboard.empty.played, 0);

      for (final result in MatchResult.values) {
        expect(Scoreboard.empty.countOf(result), 0);
      }
    });
  });

  group('recording a result', () {
    for (final result in MatchResult.values) {
      test('a ${result.name} moves only its own counter', () {
        final updated = Scoreboard.empty.incremented(result);

        expect(updated.countOf(result), 1);
        expect(updated.played, 1);

        for (final other in MatchResult.values.where((value) => value != result)) {
          expect(updated.countOf(other), 0);
        }
      });
    }

    test('the totals add up over a run of games', () {
      final scoreboard = Scoreboard.empty
          .incremented(MatchResult.win)
          .incremented(MatchResult.win)
          .incremented(MatchResult.draw)
          .incremented(MatchResult.loss);

      expect(scoreboard, const Scoreboard(draws: 1, losses: 1, wins: 2));
      expect(scoreboard.played, 4);
    });
  });
}
