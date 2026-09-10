import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/src/routing/app_router.br.dart';

/// The router outlives every rebuild but must not outlive the container, so it lives in
/// the graph like everything else rather than as a top-level global. Two consequences
/// that matter: a test gets a fresh navigation stack per `ProviderScope`, and disposal is
/// declared rather than hoped for.
final appRouterProvider = Provider<AppRouter>((ref) {
  final router = AppRouter();
  ref.onDispose(router.dispose);

  return router;
});

/// `config()` builds the delegate and parsers, so it is called once and memoised here —
/// calling it from `build` would rebuild them on every frame.
final routerConfigProvider = Provider<RouterConfig<UrlState>>(
  (ref) => ref.watch(appRouterProvider).config(),
);
