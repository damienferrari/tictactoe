import 'package:game_domain/src/providers_di.br.dart';
import 'package:game_domain/src/strategies/fallible_move_strategy.dart';
import 'package:game_domain/src/strategies/minimax_move_strategy.dart';
import 'package:game_domain/src/strategies/move_strategy.dart';
import 'package:game_domain/src/strategies/random_move_strategy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers_internal.br.g.dart';

// ─────────────────────────────────────────────────────────────────────────────────────
// Internal wiring. Nothing here is public: callers ask for a move, they do not pick the
// algorithm. Swapping minimax for something else touches this file alone.
// ─────────────────────────────────────────────────────────────────────────────────────

/// One blunder in five: enough to be beatable, rare enough that the opponent still
/// punishes a careless line.
const _mediumBlunderRate = 0.2;

@riverpod
MoveStrategy easyStrategy(Ref ref) => RandomMoveStrategy(random: ref.watch(randomProvider));

@riverpod
MoveStrategy hardStrategy(Ref ref) => MinimaxMoveStrategy(random: ref.watch(randomProvider));

@riverpod
MoveStrategy mediumStrategy(Ref ref) => FallibleMoveStrategy(
  blunderRate: _mediumBlunderRate,
  fallback: ref.watch(easyStrategyProvider),
  perfect: ref.watch(hardStrategyProvider),
  random: ref.watch(randomProvider),
);
