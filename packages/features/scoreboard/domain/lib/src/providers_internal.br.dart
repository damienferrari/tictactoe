import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scoreboard_domain/src/behaviors/record_match.dart';
import 'package:scoreboard_domain/src/providers_di.br.dart';

part 'providers_internal.br.g.dart';

// ─────────────────────────────────────────────────────────────────────────────────────
// Internal wiring — the behaviour, built with the repository the contract supplies. Not
// public: the outside gets the *result* of calling it, never the object.
// ─────────────────────────────────────────────────────────────────────────────────────

@riverpod
RecordMatch recordMatchBehaviour(Ref ref) =>
    RecordMatch(repository: ref.watch(scoreboardRepositoryProvider));
