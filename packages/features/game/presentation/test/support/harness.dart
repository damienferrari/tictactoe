import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:game_domain/game_domain.dart' as game_domain;
import 'package:game_domain/game_domain.dart';
import 'package:game_presentation/game_presentation.dart' as game_presentation;
import 'package:game_presentation/game_presentation.dart';

/// Records what the feature publishes, so a test can assert on the outgoing port without
/// knowing anything about scoreboards.
class RecordedResults {
  final List<({Mark humanMark, GameOutcome outcome})> published = [];

  OnGameFinished get port =>
      ({required Mark humanMark, required GameOutcome outcome}) =>
          published.add((humanMark: humanMark, outcome: outcome));
}

/// Answers the restart confirmation without a dialog, and records that it was asked.
class RecordedRouting implements GameRouting {
  RecordedRouting({this.answer = true});

  final bool answer;
  int askedCount = 0;

  @override
  Future<bool> onRestartConfirmationRequested(BuildContext context) async {
    askedCount++;
    return answer;
  }
}

/// The opponent thinks instantly here, and its randomness is seeded — otherwise the suite
/// would either sleep or flake.
List<Override> testOverrides({
  required RecordedResults results,
  RecordedRouting? routing,
  int seed = 1,
}) => [
  ...game_presentation.bindRoutingProvider(
    routing: Provider<GameRouting>((_) => routing ?? RecordedRouting()),
  ),
  ...game_domain.bindProviders(random: Provider((_) => Random(seed))),
  ...game_presentation.bindProviders(
    cpuMoveDelay: Provider((_) => Duration.zero),
    onGameFinished: Provider((_) => results.port),
  ),
];
