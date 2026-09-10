import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scoreboard_domain/src/entities/match_result.dart';
import 'package:scoreboard_domain/src/entities/scoreboard.br.dart';
import 'package:scoreboard_domain/src/providers_di.br.dart';
import 'package:scoreboard_domain/src/providers_internal.br.dart';

part 'scoreboard_notifier.br.g.dart';

/// A notifier rather than a plain provider because something outside writes it: the
/// composition layer records a result when a game ends.
@Riverpod(keepAlive: true)
class ScoreboardNotifier extends _$ScoreboardNotifier {
  @override
  Future<Scoreboard> build() => ref.watch(scoreboardRepositoryProvider).read();

  Future<void> record(MatchResult result) async {
    state = AsyncData(await ref.read(recordMatchBehaviourProvider)(result));
  }
}
