import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_domain/game_domain.dart' as game_domain;
import 'package:game_domain/game_domain.dart';
import 'package:game_presentation/game_presentation.dart' as game_presentation;
import 'package:game_presentation/src/widgets/cell_widget.dart';
import 'package:tictactoe/src/routing/app_game_routing.dart';

/// Exercises the real routing implementation — the feature's own tests use a double, so
/// nothing else would catch a broken `showDialog`.
List<Override> _overrides() => [
  ...game_domain.bindProviders(random: Provider((_) => Random(1))),
  ...game_presentation.bindRoutingProvider(
    routing: Provider<game_presentation.GameRouting>((_) => const AppGameRouting()),
  ),
  ...game_presentation.bindProviders(
    cpuMoveDelay: Provider((_) => Duration.zero),
    onGameFinished: Provider((_) => ({required humanMark, required outcome}) {}),
  ),
];

void main() {
  testWidgets('the confirmation dialog really appears mid-game', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: _overrides(),
        child: const MaterialApp(home: Scaffold(body: game_presentation.GameScreen())),
      ),
    );

    await tester.tap(find.byType(CellWidget).at(4));
    await tester.pumpAndSettle();

    await tester.tap(find.text('New game'));
    await tester.pumpAndSettle();

    expect(find.text('Start a new game?'), findsOneWidget);
    expect(find.text('Keep playing'), findsOneWidget);
  });

  testWidgets('declining leaves the board alone', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: _overrides(),
        child: const MaterialApp(home: Scaffold(body: game_presentation.GameScreen())),
      ),
    );

    await tester.tap(find.byType(CellWidget).at(4));
    await tester.pumpAndSettle();
    await tester.tap(find.text('New game'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Keep playing'));
    await tester.pumpAndSettle();

    expect(find.text(Mark.x.label), findsOneWidget);
  });

  testWidgets('a finished game restarts with no question', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: _overrides(),
        child: const MaterialApp(home: Scaffold(body: game_presentation.GameScreen())),
      ),
    );

    // Play to the end against the unbeatable opponent: it ends in a draw or a loss.
    for (var index = 0; index < Board.cellCount; index++) {
      final cell = find.byWidgetPredicate((w) => w is CellWidget && w.index == index);
      await tester.tap(cell, warnIfMissed: false);
      await tester.pumpAndSettle();
    }

    await tester.tap(find.text('New game'));
    await tester.pumpAndSettle();

    expect(find.text('Start a new game?'), findsNothing, reason: 'nothing to lose, so no question');
  });
}
