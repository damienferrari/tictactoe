import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_domain/game_domain.dart';
import 'package:game_presentation/src/notifiers/game_ui_state_notifier.br.dart';
import 'package:game_presentation/src/providers_di.br.dart';
import 'package:game_presentation/src/widgets/board_widget.dart';
import 'package:game_presentation/src/widgets/status_banner.dart';

/// Composes the feature's widgets. No logic of its own — every value is read by the leaf
/// that draws it.
class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) => const Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      BoardWidget(),
      SizedBox(height: 20),
      StatusBanner(),
      SizedBox(height: 16),
      _NewGameButton(),
    ],
  );
}

class _NewGameButton extends ConsumerWidget {
  const _NewGameButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => startNewGame(context, ref, humanMark: Mark.x),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
        decoration: BoxDecoration(
          color: colors.tertiary,
          borderRadius: const BorderRadius.all(Radius.circular(999)),
          boxShadow: [
            BoxShadow(color: colors.shadow.withValues(alpha: 0.22), offset: const Offset(0, 4)),
          ],
        ),
        child: Text(
          'New game',
          style: TextStyle(
            color: colors.onTertiary,
            fontSize: 17,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.4,
          ),
        ),
      ),
    );
  }
}

/// Throwing away a game in progress asks first. The confirmation itself is the host's
/// business — the feature only knows it wants to ask.
///
/// The `context.mounted` check sits here, at the await, because only the caller knows
/// what a dead context should mean. The routing implementation asserts instead.
Future<void> startNewGame(
  BuildContext context,
  WidgetRef ref, {
  required Mark humanMark,
  Difficulty? difficulty,
}) async {
  final state = ref.read(gameUiStateProvider);

  if (state.isInterruptible) {
    final confirmed = await ref.read(gameRoutingProvider).onRestartConfirmationRequested(context);
    if (!confirmed || !context.mounted) return;
  }

  ref
      .read(gameUiStateProvider.notifier)
      .newGame(difficulty: difficulty ?? state.game.difficulty, humanMark: humanMark);
}
