import 'package:flutter/widgets.dart';
import 'package:scoreboard_domain/scoreboard_domain.dart';
import 'package:scoreboard_presentation/src/widgets/score_tile.dart';

/// Places the tiles and watches nothing: each tile reads its own counter.
class ScoreboardWidget extends StatelessWidget {
  const ScoreboardWidget({super.key});

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    spacing: 12,
    children: [for (final result in MatchResult.values) ScoreTile(result: result)],
  );
}
