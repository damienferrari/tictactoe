import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scoreboard_data/src/data_sources/key_value_store.dart';

part 'providers_di.br.g.dart';

// ─────────────────────────────────────────────────────────────────────────────────────
// Incoming contracts. Worth noting: the data layer is not the bottom of the stack — it
// has its own bottom, and it inverts it exactly as the domain inverts its repository.
// ─────────────────────────────────────────────────────────────────────────────────────

@riverpod
KeyValueStore keyValueStore(Ref _) => throw StateError('keyValueStoreProvider was never bound');
