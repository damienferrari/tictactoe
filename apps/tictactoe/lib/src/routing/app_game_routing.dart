import 'package:flutter/material.dart';
import 'package:game_presentation/game_presentation.dart';

/// The host's answer to the game feature's navigation port.
///
/// `assert` rather than `if (!context.mounted) return false`: returning `false` would
/// mean "the player declined" to a caller that never got to ask, and the caller would
/// take the declined branch on a decision nobody made. The caller owns liveness across
/// its own await.
class AppGameRouting implements GameRouting {
  const AppGameRouting();

  @override
  Future<bool> onRestartConfirmationRequested(BuildContext context) async {
    assert(context.mounted, 'onRestartConfirmationRequested called with an unmounted context');

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Start a new game?'),
        content: const Text('The game in progress will be lost.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Keep playing'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('New game'),
          ),
        ],
      ),
    );

    return confirmed ?? false;
  }
}
