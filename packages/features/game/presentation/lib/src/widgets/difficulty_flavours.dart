import 'package:flutter/material.dart';
import 'package:game_domain/game_domain.dart';

/// Enum values are alphabetical, which would sit Unbeatable between Easy and Fair.
/// The switch is exhaustive, so a new level cannot silently drop out of the picker.
List<Difficulty> get orderedDifficulties =>
    [...Difficulty.values]..sort((a, b) => _rank(a).compareTo(_rank(b)));

/// One flavour per level, all three read off the theme — the feature names no colour.
Color flavourOf(Difficulty difficulty, ColorScheme colors) => switch (difficulty) {
  Difficulty.easy => colors.tertiary,
  Difficulty.hard => colors.primary,
  Difficulty.medium => colors.secondary,
};

Color inkOn(Difficulty difficulty, ColorScheme colors) => switch (difficulty) {
  Difficulty.easy => colors.onTertiary,
  Difficulty.hard => colors.onPrimary,
  Difficulty.medium => colors.onSecondary,
};

String labelOf(Difficulty difficulty) => switch (difficulty) {
  Difficulty.easy => 'Easy',
  Difficulty.hard => 'Unbeatable',
  Difficulty.medium => 'Fair',
};

int _rank(Difficulty difficulty) => switch (difficulty) {
  Difficulty.easy => 0,
  Difficulty.medium => 1,
  Difficulty.hard => 2,
};
