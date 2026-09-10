import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_domain/game_domain.dart';
import 'package:game_presentation/game_presentation.dart';
import 'package:scoreboard_domain/scoreboard_domain.dart';

/// The single point where the two features' vocabularies meet.
///
/// `game` knows nothing of [MatchResult] and `scoreboard` knows nothing of
/// [GameOutcome]; this translation is the whole reason neither has to.
extension GameOutcomeMapper on GameOutcome {
  MatchResult? toMatchResult(Mark humanMark) => switch (this) {
    GameDraw() => MatchResult.draw,
    GameWin(:final mark) => mark == humanMark ? MatchResult.win : MatchResult.loss,
    GameInProgress() => null,
  };
}

/// Feeds the game feature's outgoing port. Swapping the tally for analytics — or adding
/// analytics next to it — changes this file and nothing else.
final recordGameResultProvider = Provider<OnGameFinished>(
  (ref) => ({required humanMark, required outcome}) {
    final result = outcome.toMatchResult(humanMark);
    if (result == null) return;

    // Fire-and-forget on purpose: the board must not wait on a disk write. `unawaited`
    // only declares that intent to the analyzer — it does not swallow a failure, which
    // is what we want: a tally that silently stops persisting is worse than a reported
    // error. Use `.ignore()` instead to drop the error too.
    unawaited(ref.read(recordMatchProvider)(result));
  },
);
