import 'dart:convert';

import 'package:scoreboard_data/src/data_sources/key_value_store.dart';
import 'package:scoreboard_data/src/dtos/scoreboard_dto.br.dart';
import 'package:scoreboard_data/src/mappers/scoreboard_dto_mapper.dart';
import 'package:scoreboard_domain/scoreboard_domain.dart';

/// Implements the domain interface directly: a single source, so there is no repository
/// class worth interposing.
class ScoreboardLocalDataSource implements ScoreboardRepository {
  const ScoreboardLocalDataSource({required this.store});

  static const String storageKey = 'scoreboard';

  final KeyValueStore store;

  @override
  Future<Scoreboard> read() async {
    final stored = await store.read(storageKey);
    if (stored == null) return Scoreboard.empty;

    try {
      return ScoreboardDto.fromJson(jsonDecode(stored) as Map<String, dynamic>).toEntity();
    } on Object {
      // Stored bytes are outside our control — a hand-edited or half-written payload
      // must not stop the app from launching, so the tally restarts instead.
      return Scoreboard.empty;
    }
  }

  @override
  Future<void> write(Scoreboard scoreboard) =>
      store.write(storageKey, jsonEncode(scoreboard.toDto().toJson()));
}
