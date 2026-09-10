import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_domain/game_domain.dart' as game_domain;
import 'package:game_domain/game_domain.dart';
import 'package:game_presentation/game_presentation.dart' as game_presentation;
import 'package:game_presentation/src/widgets/cell_widget.dart';
import 'package:scoreboard_data/scoreboard_data.dart' as scoreboard_data;
import 'package:scoreboard_domain/scoreboard_domain.dart' as scoreboard_domain;
import 'package:tictactoe/src/composition/game_result_recorder.dart';
import 'package:tictactoe/src/home_screen.dart';
import 'package:tictactoe/src/routing/app_game_routing.dart';

class _InMemoryStore implements scoreboard_data.KeyValueStore {
  final Map<String, String> values = {};

  @override
  Future<String?> read(String key) async => values[key];

  @override
  Future<void> write(String key, String value) async => values[key] = value;
}

/// Assembles the app the way `main` does, swapping only the two things a test has to
/// control: the storage, and the pause the opponent takes before answering. Building it
/// here rather than importing the production list is deliberate — a binding that goes
/// missing shows up as a failure in this test.
List<Override> _overrides(_InMemoryStore store) => [
  ...game_domain.bindProviders(random: Provider((_) => Random(1))),
  ...scoreboard_data.bindProviders(store: Provider<scoreboard_data.KeyValueStore>((_) => store)),
  ...scoreboard_domain.bindProviders(repository: scoreboard_data.scoreboardRepositoryImplProvider),
  ...game_presentation.bindRoutingProvider(
    routing: Provider<game_presentation.GameRouting>((_) => const AppGameRouting()),
  ),
  ...game_presentation.bindProviders(
    cpuMoveDelay: Provider((_) => Duration.zero),
    onGameFinished: recordGameResultProvider,
  ),
];

void main() {
  testWidgets('a finished game lands in the scoreboard', (tester) async {
    final store = _InMemoryStore();

    await tester.pumpWidget(
      ProviderScope(
        overrides: _overrides(store),
        child: const MaterialApp(home: HomeScreen()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('0'), findsNWidgets(3), reason: 'a first launch starts from nothing');

    // Take the first free cell each time. Which result comes out is the opponent's
    // business; that exactly one counter moves is not.
    for (var move = 0; move < Board.cellCount; move++) {
      final free = find.byWidgetPredicate((widget) => widget is CellWidget && widget.index == move);
      if (free.evaluate().isEmpty) break;

      await tester.tap(free, warnIfMissed: false);
      await tester.pumpAndSettle();

      if (find.text('Your turn.').evaluate().isEmpty &&
          find.text('The machine is thinking…').evaluate().isEmpty) {
        break;
      }
    }
    await tester.pumpAndSettle();

    expect(find.text('0'), findsNWidgets(2), reason: 'one counter moved, the others did not');
    expect(find.text('1'), findsOneWidget);
    expect(store.values, isNotEmpty, reason: 'the tally was persisted, not only displayed');
  });

  testWidgets('the persisted tally is shown again on the next launch', (tester) async {
    final store = _InMemoryStore();

    // Seeded through the repository rather than by writing the storage key directly: the
    // key belongs to the data layer, and a test has no business knowing it.
    final previousLaunch = ProviderContainer(overrides: _overrides(store));
    await previousLaunch
        .read(scoreboard_data.scoreboardRepositoryImplProvider)
        .write(const scoreboard_domain.Scoreboard(losses: 2, wins: 5));
    previousLaunch.dispose();

    await tester.pumpWidget(
      ProviderScope(
        overrides: _overrides(store),
        child: const MaterialApp(home: HomeScreen()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('5'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
  });
}
