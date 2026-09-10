import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
// Override left the main barrel in Riverpod 3.3.
import 'package:flutter_riverpod/misc.dart';
import 'package:game_domain/game_domain.dart' as game_domain;
import 'package:game_presentation/game_presentation.dart' as game_presentation;
import 'package:scoreboard_data/scoreboard_data.dart' as scoreboard_data;
import 'package:scoreboard_domain/scoreboard_domain.dart' as scoreboard_domain;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tictactoe/src/composition/game_result_recorder.dart';
import 'package:tictactoe/src/composition/shared_preferences_store.dart';
import 'package:tictactoe/src/routing/app_game_routing.dart';

/// Every package is prefixed because they all expose a `bindProviders` — the clash is
/// the point: one seam per package, and this is the only file that reaches for them.
List<Override> compositionOverrides() => [
  ...game_domain.bindProviders(random: Provider((_) => Random())),

  ...scoreboard_data.bindProviders(
    store: Provider((_) => SharedPreferencesStore(preferences: SharedPreferencesAsync())),
  ),

  // Dependency inversion, in one line: the implementation the data layer exposes is
  // handed to the domain's contract. Neither package names the other.
  ...scoreboard_domain.bindProviders(repository: scoreboard_data.scoreboardRepositoryImplProvider),

  ...game_presentation.bindProviders(onGameFinished: recordGameResultProvider),

  // Routing has its own bind function, never folded into bindProviders.
  ...game_presentation.bindRoutingProvider(
    routing: Provider<game_presentation.GameRouting>((_) => const AppGameRouting()),
  ),
];
