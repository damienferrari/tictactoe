import 'package:scoreboard_domain/src/entities/match_result.dart';
import 'package:scoreboard_domain/src/entities/scoreboard.br.dart';
import 'package:scoreboard_domain/src/repositories/scoreboard_repository.dart';

class RecordMatch {
  const RecordMatch({required this.repository});

  final ScoreboardRepository repository;

  Future<Scoreboard> call(MatchResult result) async {
    final updated = (await repository.read()).incremented(result);
    await repository.write(updated);

    return updated;
  }
}
