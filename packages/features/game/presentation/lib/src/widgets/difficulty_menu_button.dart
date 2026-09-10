import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_domain/game_domain.dart';
import 'package:game_presentation/src/notifiers/game_ui_state_notifier.br.dart';
import 'package:game_presentation/src/screens/game_screen.dart';
import 'package:game_presentation/src/widgets/difficulty_flavours.dart';

/// The level picker, shaped to sit in the host's app bar.
///
/// The feature owns it because the current level lives in state the host cannot read.
/// The host only decides where it goes.
class DifficultyMenuButton extends ConsumerWidget {
  const DifficultyMenuButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final current = ref.watch(gameUiStateProvider.select((state) => state.game.difficulty));
    final colors = Theme.of(context).colorScheme;

    return PopupMenuButton<Difficulty>(
      tooltip: 'Difficulty',
      offset: const Offset(0, 52),
      color: colors.surface,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24))),
      // Changing level restarts, so it goes through the same confirmation as New game.
      onSelected: (difficulty) =>
          startNewGame(context, ref, difficulty: difficulty, humanMark: Mark.x),
      itemBuilder: (context) => [
        for (final difficulty in orderedDifficulties)
          PopupMenuItem(
            value: difficulty,
            child: _MenuRow(difficulty: difficulty, isCurrent: difficulty == current),
          ),
      ],
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
        decoration: BoxDecoration(
          color: flavourOf(current, colors),
          borderRadius: const BorderRadius.all(Radius.circular(999)),
          boxShadow: [
            BoxShadow(color: colors.shadow.withValues(alpha: 0.28), offset: const Offset(0, 3)),
          ],
        ),
        child: Row(
          children: [
            Text(
              labelOf(current),
              style: TextStyle(
                color: inkOn(current, colors),
                fontWeight: FontWeight.w900,
                fontSize: 15,
              ),
            ),
            Icon(Icons.expand_more_rounded, size: 20, color: inkOn(current, colors)),
          ],
        ),
      ),
    );
  }
}

class _MenuRow extends StatelessWidget {
  const _MenuRow({required this.difficulty, required this.isCurrent});

  final Difficulty difficulty;
  final bool isCurrent;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(color: flavourOf(difficulty, colors), shape: BoxShape.circle),
        ),
        const SizedBox(width: 12),
        Text(
          labelOf(difficulty),
          style: TextStyle(
            color: colors.onSurface,
            fontWeight: isCurrent ? FontWeight.w900 : FontWeight.w600,
          ),
        ),
        if (isCurrent) ...[
          const SizedBox(width: 8),
          Icon(Icons.check_rounded, size: 18, color: colors.onSurface),
        ],
      ],
    );
  }
}
