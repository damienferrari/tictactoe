import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scoreboard_domain/src/repositories/scoreboard_repository.dart';

part 'providers_di.br.g.dart';

// ─────────────────────────────────────────────────────────────────────────────────────
// Incoming contracts. This one carries the whole dependency inversion of the project:
// the domain says it wants a repository, and will never say which.
// ─────────────────────────────────────────────────────────────────────────────────────

@riverpod
ScoreboardRepository scoreboardRepository(Ref _) =>
    throw StateError('scoreboardRepositoryProvider was never bound');
