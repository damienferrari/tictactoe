import 'dart:math';

import 'package:game_domain/game_domain.dart';
// The contract is not exported — a test inside the package reads it directly.
import 'package:game_domain/src/providers_di.br.dart';
import 'package:riverpod/misc.dart';
import 'package:riverpod/riverpod.dart';
import 'package:test/test.dart';

/// Riverpod wraps whatever a provider throws in a `ProviderException`, once per level of
/// the dependency chain — so the cause has to be unwrapped to be asserted on.
Object _rootCause(Object error) => error is ProviderException ? _rootCause(error.exception) : error;

void main() {
  group('the randomness contract', () {
    test('an unbound contract names itself instead of returning a default', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      expect(
        () => container.read(randomProvider),
        throwsA(
          isA<ProviderException>().having(
            (error) => _rootCause(error).toString(),
            'cause',
            contains('randomProvider was never bound'),
          ),
        ),
      );
    });

    test('the failure surfaces through the public API too, not only at the contract', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      expect(
        () => container.read(chooseCpuMoveProvider),
        throwsA(
          isA<ProviderException>().having(
            (error) => _rootCause(error).toString(),
            'cause',
            contains('randomProvider was never bound'),
          ),
        ),
      );
    });

    test('binding it makes the opponent playable', () {
      final container = ProviderContainer(
        overrides: bindProviders(random: Provider((_) => Random(1))),
      );
      addTearDown(container.dispose);

      final game = Game.fresh(difficulty: Difficulty.hard, humanMark: Mark.o);

      expect(container.read(chooseCpuMoveProvider)(game), inInclusiveRange(0, 8));
    });
  });

  group('the public behaviours', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer(overrides: bindProviders(random: Provider((_) => Random(1))));
      addTearDown(container.dispose);
    });

    test('applying a move is reachable without naming the behaviour class', () {
      final game = Game.fresh(difficulty: Difficulty.easy, humanMark: Mark.x);

      expect(container.read(applyMoveProvider)(game, by: Mark.x, index: 0), isA<MoveAccepted>());
    });
  });
}
