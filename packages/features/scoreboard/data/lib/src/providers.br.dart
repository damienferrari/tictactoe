import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scoreboard_data/src/data_sources/key_value_store.dart';
import 'package:scoreboard_data/src/providers_di.br.dart';
import 'package:scoreboard_data/src/providers_internal.br.dart';
import 'package:scoreboard_domain/scoreboard_domain.dart';

part 'providers.br.g.dart';

// ─────────────────────────────────────────────────────────────────────────────────────
// Public surface. This layer feeds only its OWN contracts: it never calls the domain's
// `bindProviders`. Composition calls both, side by side, and so decides which
// implementation serves the contract.
// ─────────────────────────────────────────────────────────────────────────────────────

/// Typed with the domain interface, so the data source name never leaves this package.
@riverpod
ScoreboardRepository scoreboardRepositoryImpl(Ref ref) =>
    ref.watch(scoreboardLocalDataSourceProvider);

List<Override> bindProviders({required ProviderListenable<KeyValueStore> store}) => [
  keyValueStoreProvider.overrideWith((ref) => ref.watch(store)),
];
