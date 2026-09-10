/// Rules and artificial opponent for tic-tac-toe.
///
/// Behaviours and strategies stay package-private: they are reachable only through the
/// providers below.
library;

// Board exposes its cells as an IList, so the type belongs to this package's public
// API and consumers must be able to name it without depending on FIC themselves.
export 'package:fast_immutable_collections/fast_immutable_collections.dart' show IList, IListConst;

export 'src/entities/board.br.dart';
export 'src/entities/difficulty.dart';
export 'src/entities/game.br.dart';
export 'src/entities/game_outcome.br.dart';
export 'src/entities/mark.dart';
export 'src/entities/move_outcome.br.dart';
export 'src/entities/winning_line.dart';
export 'src/providers.br.dart';
