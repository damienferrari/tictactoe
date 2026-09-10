import 'package:scoreboard_domain/src/entities/scoreboard.br.dart';

abstract interface class ScoreboardRepository {
  Future<Scoreboard> read();

  Future<void> write(Scoreboard scoreboard);
}
