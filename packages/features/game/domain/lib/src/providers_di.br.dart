import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers_di.br.g.dart';

// ─────────────────────────────────────────────────────────────────────────────────────
// Incoming contracts: what this package needs from outside.
//
// Internal to the package — the barrel never exports this file, and composition feeds it
// through `bindProviders` rather than touching these symbols.
// ─────────────────────────────────────────────────────────────────────────────────────

/// Injected rather than constructed here, so tests can seed it and replay a game.
/// Throws until fed: a missing binding fails loudly instead of degrading.
@riverpod
Random random(Ref _) => throw StateError('randomProvider was never bound');
