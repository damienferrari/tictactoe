import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:game_presentation/src/screens/game_screen.dart';

part 'game_router.br.gr.dart';

/// Exists only so the generator emits `GameRoute` for the composition layer to place in
/// its own route tree. The feature declares its pages; it never declares where they sit.
@AutoRouterConfig()
abstract class GameRouter extends RootStackRouter {}

@RoutePage(name: 'GameRoute')
class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) => const GameScreen();
}
