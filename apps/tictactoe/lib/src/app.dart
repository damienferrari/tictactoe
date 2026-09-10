import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/src/composition/router_providers.dart';

/// The app owns the palette. Features read roles off `ColorScheme` and never name a
/// colour, so the whole look is decided here.
class TicTacToeApp extends ConsumerWidget {
  const TicTacToeApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => MaterialApp.router(
    title: 'Tic-tac-toe',
    debugShowCheckedModeBanner: false,
    theme: _themeFor(Brightness.light),
    darkTheme: _themeFor(Brightness.dark),
    routerConfig: ref.watch(routerConfigProvider),
  );

  static ThemeData _themeFor(Brightness brightness) {
    final isLight = brightness == Brightness.light;

    final colors = ColorScheme.fromSeed(
      seedColor: const Color(0xFFB08BE8),
      brightness: brightness,
      // Raspberry, mint, lemon — the three flavours the board plays with.
      primary: isLight ? const Color(0xFFFF6FA5) : const Color(0xFFFF9CC2),
      onPrimary: const Color(0xFF4A1030),
      tertiary: isLight ? const Color(0xFF3FCFC0) : const Color(0xFF6EE3D6),
      onTertiary: const Color(0xFF0A3A36),
      secondary: isLight ? const Color(0xFFFFC95C) : const Color(0xFFF6D486),
      onSecondary: const Color(0xFF4A3400),
      secondaryContainer: isLight ? const Color(0xFFFFDD5C) : const Color(0xFF7A6018),
      onSecondaryContainer: isLight ? const Color(0xFF5A4600) : const Color(0xFFFFF3C0),
      // Lavender frosting behind the tiles.
      primaryContainer: isLight ? const Color(0xFFD9C2FF) : const Color(0xFF543D7C),
      surface: isLight ? const Color(0xFFFFFDFA) : const Color(0xFF2E2440),
      onSurface: isLight ? const Color(0xFF3B2A46) : const Color(0xFFF3EAFB),
      onSurfaceVariant: isLight ? const Color(0xFF7A6A88) : const Color(0xFFCBBBDA),
      // The two tile tints that make the board a checkerboard.
      surfaceContainerHigh: isLight ? const Color(0xFFFFC2DC) : const Color(0xFF553C6B),
      surfaceContainerHighest: isLight ? const Color(0xFFB6DEFF) : const Color(0xFF34486B),
    );

    return ThemeData(
      colorScheme: colors,
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.transparent,
      dialogTheme: DialogThemeData(
        backgroundColor: colors.surface,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(28))),
        titleTextStyle: TextStyle(
          color: colors.onSurface,
          fontSize: 22,
          fontWeight: FontWeight.w900,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(fontWeight: FontWeight.w800),
          shape: const StadiumBorder(),
        ),
      ),
    );
  }
}
