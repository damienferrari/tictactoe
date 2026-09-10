/// Board, status and difficulty for the game feature.
///
/// Two widgets the host mounts — the board and the level picker for its app bar — plus a
/// port the feature demands and the socket to feed it. The screen state stays internal:
/// nothing outside reads it, and exporting it would freeze its shape for no gain.
library;

export 'src/on_game_finished.dart';
export 'src/providers.dart';
export 'src/routing/game_router.br.dart';
export 'src/routing/game_routing.dart';
export 'src/screens/game_screen.dart';
export 'src/widgets/difficulty_menu_button.dart';
