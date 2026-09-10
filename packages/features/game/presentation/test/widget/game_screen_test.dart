import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_domain/game_domain.dart';
import 'package:game_presentation/game_presentation.dart';
import 'package:game_presentation/src/widgets/cell_widget.dart';

import '../support/harness.dart';

Widget _app(RecordedResults results, {RecordedRouting? routing}) => ProviderScope(
  overrides: testOverrides(results: results, routing: routing),
  child: const MaterialApp(
    home: Scaffold(
      // Mounted the way a host does: the board in the body, the level picker in the bar.
      body: Column(children: [DifficultyMenuButton(), GameScreen()]),
    ),
  ),
);

/// The picker is a menu now, so choosing a level takes two taps.
Future<void> _chooseLevel(WidgetTester tester, String label) async {
  await tester.tap(find.byType(DifficultyMenuButton));
  await tester.pumpAndSettle();
  await tester.tap(find.text(label).last);
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('an empty board shows nine cells and no marks', (tester) async {
    await tester.pumpWidget(_app(RecordedResults()));

    expect(find.byType(CellWidget), findsNWidgets(Board.cellCount));
    expect(find.text(Mark.x.label), findsNothing);
  });

  testWidgets('tapping a cell draws the mark and the machine answers', (tester) async {
    await tester.pumpWidget(_app(RecordedResults()));

    await tester.tap(find.byType(CellWidget).at(4));
    await tester.pumpAndSettle();

    expect(find.text(Mark.x.label), findsOneWidget);
    expect(find.text(Mark.o.label), findsOneWidget);
  });

  testWidgets('the status line tells the player whose turn it is', (tester) async {
    await tester.pumpWidget(_app(RecordedResults()));

    expect(find.text('Your turn.'), findsOneWidget);
  });

  testWidgets('changing the difficulty starts a fresh game', (tester) async {
    await tester.pumpWidget(_app(RecordedResults()));

    await tester.tap(find.byType(CellWidget).at(0));
    await tester.pumpAndSettle();
    expect(find.text(Mark.x.label), findsOneWidget);

    await _chooseLevel(tester, 'Easy');

    expect(find.text(Mark.x.label), findsNothing);
    expect(find.text(Mark.o.label), findsNothing);
  });

  group('restarting through the navigation port', () {
    testWidgets('a game in progress is not thrown away without asking', (tester) async {
      final routing = RecordedRouting(answer: false);
      await tester.pumpWidget(_app(RecordedResults(), routing: routing));

      await tester.tap(find.byType(CellWidget).at(4));
      await tester.pumpAndSettle();
      await tester.tap(find.text('New game'));
      await tester.pumpAndSettle();

      expect(routing.askedCount, 1);
      expect(find.text(Mark.x.label), findsOneWidget, reason: 'declined, so nothing moved');
    });

    testWidgets('an untouched board restarts without asking', (tester) async {
      final routing = RecordedRouting();
      await tester.pumpWidget(_app(RecordedResults(), routing: routing));

      await tester.tap(find.text('New game'));
      await tester.pumpAndSettle();

      expect(routing.askedCount, 0);
    });

    testWidgets('changing difficulty mid-game asks the same question', (tester) async {
      final routing = RecordedRouting(answer: false);
      await tester.pumpWidget(_app(RecordedResults(), routing: routing));

      await tester.tap(find.byType(CellWidget).at(4));
      await tester.pumpAndSettle();
      await _chooseLevel(tester, 'Easy');

      expect(routing.askedCount, 1);
      expect(find.text('Unbeatable'), findsOneWidget, reason: 'declined, so the level held');
    });
  });
}
