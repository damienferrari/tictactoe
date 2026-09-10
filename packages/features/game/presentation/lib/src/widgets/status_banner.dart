import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_domain/game_domain.dart';
import 'package:game_presentation/src/notifiers/game_ui_state_notifier.br.dart';
import 'package:game_presentation/src/state/game_ui_state.br.dart';

/// Watches the sentence it renders, not the state that produces it: the banner rebuilds
/// when the wording changes and stays put while the board fills.
class StatusBanner extends ConsumerWidget {
  const StatusBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final message = ref.watch(gameUiStateProvider.select<String>(_messageOf));
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: colors.secondaryContainer,
        borderRadius: const BorderRadius.all(Radius.circular(999)),
      ),
      child: Text(
        message,
        style: TextStyle(
          color: colors.onSecondaryContainer,
          fontSize: 16,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }

  static String _messageOf(GameUiState state) => switch (state.game.outcome) {
    GameDraw() => 'Draw.',
    GameWin(:final mark) when mark == state.game.humanMark => 'You win.',
    GameWin() => 'The machine wins.',
    GameInProgress() when state.isCpuThinking => 'The machine is thinking…',
    GameInProgress() => 'Your turn.',
  };
}
