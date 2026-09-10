import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_domain/game_domain.dart';
import 'package:game_presentation/src/notifiers/game_ui_state_notifier.br.dart';

import '../../../support/harness.dart';

/// Pins the claim the cell widget rests on: a cell subscribes to its own square, so a
/// move elsewhere must not notify it. Asserted on the selector rather than on a rendered
/// widget because the selector *is* the mechanism — if it fires, the widget rebuilds.
void main() {
  test('a move notifies the cells that changed, and only those', () async {
    final container = ProviderContainer(overrides: testOverrides(results: RecordedResults()));
    addTearDown(container.dispose);

    final notifications = <int, int>{
      for (var index = 0; index < Board.cellCount; index++) index: 0,
    };

    for (var index = 0; index < Board.cellCount; index++) {
      final cell = index;
      addTearDown(
        container
            .listen(
              gameUiStateProvider.select((state) => state.markAt(cell)),
              (_, _) => notifications[cell] = notifications[cell]! + 1,
            )
            .close,
      );
    }

    container.read(gameUiStateProvider.notifier).play(4);
    await pumpEventQueue();

    // Two cells hold a mark now: the player's and the opponent's reply. Which one the
    // opponent picked is its business — the test only cares that the other seven were
    // left alone.
    final board = container.read(gameUiStateProvider).game.board;
    final changed = {
      for (var index = 0; index < Board.cellCount; index++)
        if (board.markAt(index) != null) index,
    };

    expect(changed, hasLength(2));

    for (var index = 0; index < Board.cellCount; index++) {
      expect(
        notifications[index],
        changed.contains(index) ? 1 : 0,
        reason: 'cell $index was notified ${notifications[index]} times',
      );
    }
  });
}
