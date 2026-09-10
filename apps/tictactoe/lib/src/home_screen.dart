import 'package:flutter/material.dart';
import 'package:game_presentation/game_presentation.dart';
import 'package:scoreboard_presentation/scoreboard_presentation.dart';

/// The only widget that mentions both features.
///
/// Scrollable rather than a plain column: on a short screen, or with the system text
/// size turned up, the board plus the tally exceeds the viewport.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _lightSky = [
    Color(0xFFFFE2EF),
    Color(0xFFFDE6C8),
    Color(0xFFE6E0FF),
    Color(0xFFD4F5EC),
  ];

  static const _darkSky = [
    Color(0xFF44305F),
    Color(0xFF2E2044),
    Color(0xFF1B1330),
    Color(0xFF130D24),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: theme.brightness == Brightness.light ? _lightSky : _darkSky,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 68,
          centerTitle: false,
          title: const _Title(),
          actions: const [DifficultyMenuButton()],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const ScoreboardWidget(),
                    const SizedBox(height: 24),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: colors.surface,
                        borderRadius: const BorderRadius.all(Radius.circular(36)),
                        boxShadow: [
                          BoxShadow(
                            color: colors.primary.withValues(alpha: 0.22),
                            offset: const Offset(0, 10),
                            blurRadius: 28,
                          ),
                        ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                        child: GameScreen(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// One flavour per word, so the title carries the palette rather than describing it.
class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          _Word('TIC', color: colors.primary),
          const SizedBox(width: 9),
          _Word('TAC', color: colors.tertiary),
          const SizedBox(width: 9),
          _Word('TOE', color: colors.secondary),
        ],
      ),
    );
  }
}

class _Word extends StatelessWidget {
  const _Word(this.text, {required this.color});

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: 27,
      fontWeight: FontWeight.w900,
      letterSpacing: 1.5,
      shadows: const [
        Shadow(color: Colors.white, offset: Offset(0, 1.5)),
        Shadow(color: Color(0x33000000), offset: Offset(0, 3), blurRadius: 5),
      ],
    ),
  );
}
