import 'package:game_presentation/src/on_game_finished.dart';
import 'package:game_presentation/src/routing/game_routing.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers_di.br.g.dart';

/// Long enough to read as a move being considered, short enough not to feel slow.
const _cpuMoveDelay = Duration(milliseconds: 350);

// ─────────────────────────────────────────────────────────────────────────────────────
// Incoming contracts. Two shapes, and the rule that tells them apart: *is there a
// default that makes sense?* For an outgoing port, no — so it throws. For a delay, yes —
// so it returns the in-package value and binding it stays optional.
// ─────────────────────────────────────────────────────────────────────────────────────

/// Throws: there is no inventing a destination.
@riverpod
GameRouting gameRouting(Ref _) => throw StateError('gameRoutingProvider was never bound');

/// Throws: doing nothing when a game ends is a missing binding, not a sane default.
@riverpod
OnGameFinished onGameFinished(Ref _) => throw StateError('onGameFinishedProvider was never bound');

/// Returns the in-package default, so binding it is optional — tests bind `Duration.zero`.
@riverpod
Duration cpuMoveDelay(Ref _) => _cpuMoveDelay;
