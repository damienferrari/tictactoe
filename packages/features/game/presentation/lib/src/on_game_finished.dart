import 'package:game_domain/game_domain.dart';

/// Announced when a game ends. The feature publishes it and never learns who listens,
/// which is what keeps it independent of whatever records results.
typedef OnGameFinished = void Function({required Mark humanMark, required GameOutcome outcome});
