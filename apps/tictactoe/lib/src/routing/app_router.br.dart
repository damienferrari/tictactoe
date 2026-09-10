import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:tictactoe/src/home_screen.dart';

part 'app_router.br.gr.dart';

/// The composition layer owns the route tree. Features declare pages — `GameRoute` comes
/// from `game_presentation` — and this is the only place that decides where they sit.
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [AutoRoute(path: '/', page: HomeRoute.page, initial: true)];
}

@RoutePage(name: 'HomeRoute')
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => const HomeScreen();
}
