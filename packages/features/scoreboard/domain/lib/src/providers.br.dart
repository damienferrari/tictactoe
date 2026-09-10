import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scoreboard_domain/src/entities/match_result.dart';
import 'package:scoreboard_domain/src/notifiers/scoreboard_notifier.br.dart';
import 'package:scoreboard_domain/src/providers_di.br.dart';
import 'package:scoreboard_domain/src/repositories/scoreboard_repository.dart';

part 'providers.br.g.dart';

// ─────────────────────────────────────────────────────────────────────────────────────
// Public surface, plus the socket.
// ─────────────────────────────────────────────────────────────────────────────────────

typedef RecordMatchFun = Future<void> Function(MatchResult result);

@riverpod
RecordMatchFun recordMatch(Ref ref) => ref.read(scoreboardProvider.notifier).record;

List<Override> bindProviders({required ProviderListenable<ScoreboardRepository> repository}) => [
  scoreboardRepositoryProvider.overrideWith((ref) => ref.watch(repository)),
];
