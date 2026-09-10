import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scoreboard_data/src/data_sources/scoreboard_local_data_source.dart';
import 'package:scoreboard_data/src/providers_di.br.dart';

part 'providers_internal.br.g.dart';

// ─────────────────────────────────────────────────────────────────────────────────────
// Internal wiring — the data source. Its name never leaves the package.
// ─────────────────────────────────────────────────────────────────────────────────────

@riverpod
ScoreboardLocalDataSource scoreboardLocalDataSource(Ref ref) =>
    ScoreboardLocalDataSource(store: ref.watch(keyValueStoreProvider));
