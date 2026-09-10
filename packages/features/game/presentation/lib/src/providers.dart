// Override and ProviderListenable left the main barrel in Riverpod 3.3.
import 'package:flutter_riverpod/misc.dart';
import 'package:game_presentation/src/on_game_finished.dart';
import 'package:game_presentation/src/providers_di.br.dart';
import 'package:game_presentation/src/routing/game_routing.dart';

// ─────────────────────────────────────────────────────────────────────────────────────
// Public surface. No codegen: this layer exposes no annotated provider of its own — its
// notifier lives in `notifiers/`. A package never has both `providers.dart` and
// `providers.br.dart`.
// ─────────────────────────────────────────────────────────────────────────────────────

/// Routing gets its own bind function, never folded into `bindProviders`: it is fed from
/// a different composition layer than the rest.
List<Override> bindRoutingProvider({required ProviderListenable<GameRouting> routing}) => [
  gameRoutingProvider.overrideWith((ref) => ref.watch(routing)),
];

List<Override> bindProviders({
  required ProviderListenable<OnGameFinished> onGameFinished,
  ProviderListenable<Duration>? cpuMoveDelay,
}) => [
  onGameFinishedProvider.overrideWith((ref) => ref.watch(onGameFinished)),
  if (cpuMoveDelay != null) cpuMoveDelayProvider.overrideWith((ref) => ref.watch(cpuMoveDelay)),
];
