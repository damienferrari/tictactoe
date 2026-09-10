import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scoreboard_domain/scoreboard_domain.dart' as scoreboard_domain;
import 'package:scoreboard_domain/scoreboard_domain.dart';
import 'package:scoreboard_presentation/scoreboard_presentation.dart';
import 'package:scoreboard_presentation/src/widgets/score_tile.dart';

class _FakeRepository implements ScoreboardRepository {
  _FakeRepository(this.stored);

  Scoreboard stored;

  @override
  Future<Scoreboard> read() async => stored;

  @override
  Future<void> write(Scoreboard scoreboard) async => stored = scoreboard;
}

List<Override> _overrides(Scoreboard stored) => scoreboard_domain.bindProviders(
  repository: Provider<ScoreboardRepository>((_) => _FakeRepository(stored)),
);

Widget _app(Scoreboard stored) => ProviderScope(
  overrides: _overrides(stored),
  child: const MaterialApp(home: Scaffold(body: ScoreboardWidget())),
);

void main() {
  testWidgets('the three counters are shown', (tester) async {
    await tester.pumpWidget(_app(Scoreboard.empty));
    await tester.pumpAndSettle();

    expect(find.byType(ScoreTile), findsNWidgets(MatchResult.values.length));
    for (final label in ['DRAWS', 'LOSSES', 'WINS']) {
      expect(find.text(label), findsOneWidget);
    }
  });

  testWidgets('the persisted tally is what the player sees', (tester) async {
    await tester.pumpWidget(_app(const Scoreboard(draws: 1, losses: 2, wins: 3)));
    await tester.pumpAndSettle();

    expect(find.text('1'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
  });

  testWidgets('before the store answers, the counters read zero rather than blank', (tester) async {
    await tester.pumpWidget(_app(const Scoreboard(wins: 5)));
    // Deliberately not settled: this is the first frame.

    expect(find.text('0'), findsNWidgets(MatchResult.values.length));
  });
}
