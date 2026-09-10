import 'dart:convert';

import 'package:scoreboard_data/scoreboard_data.dart';
import 'package:scoreboard_data/src/data_sources/scoreboard_local_data_source.dart';
import 'package:scoreboard_domain/scoreboard_domain.dart';
import 'package:test/test.dart';

class _InMemoryStore implements KeyValueStore {
  _InMemoryStore([Map<String, String>? seed]) : values = {...?seed};

  final Map<String, String> values;

  @override
  Future<String?> read(String key) async => values[key];

  @override
  Future<void> write(String key, String value) async => values[key] = value;
}

void main() {
  group('reading', () {
    test('a first launch starts from an empty tally', () async {
      final source = ScoreboardLocalDataSource(store: _InMemoryStore());

      expect(await source.read(), Scoreboard.empty);
    });

    test('a stored tally is read back', () async {
      final store = _InMemoryStore({
        ScoreboardLocalDataSource.storageKey: jsonEncode({'draws': 1, 'losses': 2, 'wins': 3}),
      });

      expect(
        await ScoreboardLocalDataSource(store: store).read(),
        const Scoreboard(draws: 1, losses: 2, wins: 3),
      );
    });

    test('an unreadable payload restarts the tally instead of breaking launch', () async {
      final store = _InMemoryStore({ScoreboardLocalDataSource.storageKey: 'not json at all'});

      expect(await ScoreboardLocalDataSource(store: store).read(), Scoreboard.empty);
    });

    test('a payload of the wrong shape is treated the same way', () async {
      final store = _InMemoryStore({
        ScoreboardLocalDataSource.storageKey: jsonEncode({'wins': 'many'}),
      });

      expect(await ScoreboardLocalDataSource(store: store).read(), Scoreboard.empty);
    });
  });

  group('writing', () {
    test('what was written comes back', () async {
      final source = ScoreboardLocalDataSource(store: _InMemoryStore());
      const scoreboard = Scoreboard(draws: 2, losses: 1, wins: 4);

      await source.write(scoreboard);

      expect(await source.read(), scoreboard);
    });
  });
}
