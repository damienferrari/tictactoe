import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scoreboard_domain/scoreboard_domain.dart';

/// One counter, watching only its own.
///
/// Winning a game leaves the draws tile alone: the select narrows to a single int, so
/// the other two tiles never rebuild.
class ScoreTile extends ConsumerWidget {
  const ScoreTile({required this.result, super.key});

  final MatchResult result;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(
      scoreboardProvider.select((tally) => tally.value?.countOf(result) ?? 0),
    );
    final colors = Theme.of(context).colorScheme;

    return Container(
      width: 96,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Color.alphaBlend(_tint(colors).withValues(alpha: 0.3), colors.surface),
        borderRadius: const BorderRadius.all(Radius.circular(22)),
        boxShadow: [
          BoxShadow(color: colors.shadow.withValues(alpha: 0.2), offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        children: [
          Text(
            '$count',
            style: TextStyle(
              color: _ink(colors),
              fontSize: 30,
              fontWeight: FontWeight.w900,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
          ),
          Text(
            _label.toUpperCase(),
            style: TextStyle(
              color: colors.onSurfaceVariant,
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }

  Color _tint(ColorScheme colors) => switch (result) {
    MatchResult.draw => colors.primaryContainer,
    MatchResult.loss => colors.primary,
    MatchResult.win => colors.tertiary,
  };

  Color _ink(ColorScheme colors) => switch (result) {
    MatchResult.draw => colors.onPrimaryContainer,
    MatchResult.loss => colors.error,
    MatchResult.win => colors.onTertiary,
  };

  String get _label => switch (result) {
    MatchResult.draw => 'Draws',
    MatchResult.loss => 'Losses',
    MatchResult.win => 'Wins',
  };
}
