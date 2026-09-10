import 'dart:math';

import 'package:game_domain/src/behaviors/apply_move.dart';
import 'package:game_domain/src/behaviors/choose_move.dart';
import 'package:game_domain/src/entities/game.br.dart';
import 'package:game_domain/src/entities/mark.dart';
import 'package:game_domain/src/entities/move_outcome.br.dart';
import 'package:game_domain/src/providers_di.br.dart';
import 'package:game_domain/src/providers_internal.br.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.br.g.dart';

// ─────────────────────────────────────────────────────────────────────────────────────
// Public surface, plus the one socket the package offers.
//
// Behaviours are exposed as functions, not objects: the caller gets something to call
// and nothing to couple to.
// ─────────────────────────────────────────────────────────────────────────────────────

typedef ApplyMoveFun = MoveOutcome Function(Game game, {required Mark by, required int index});
typedef ChooseCpuMove = int Function(Game game);

@riverpod
ApplyMoveFun applyMove(Ref _) => const ApplyMove().call;

@riverpod
ChooseCpuMove chooseCpuMove(Ref ref) => ChooseMove(
  easy: ref.watch(easyStrategyProvider),
  hard: ref.watch(hardStrategyProvider),
  medium: ref.watch(mediumStrategyProvider),
).call;

/// The package's only entry point. A new contract becomes a *parameter* here — never a
/// second bind function.
List<Override> bindProviders({required ProviderListenable<Random> random}) => [
  randomProvider.overrideWith((ref) => ref.watch(random)),
];
