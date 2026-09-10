import 'package:flutter/widgets.dart';

/// Navigation port for the game feature.
///
/// Methods name events, never destinations: the feature says what happened, the router
/// decides where that leads. That is what lets the same feature live in an app whose
/// navigation it knows nothing about.
abstract interface class GameRouting {
  /// Asked before a game in progress is thrown away. Returns whether the player agreed.
  Future<bool> onRestartConfirmationRequested(BuildContext context);
}
