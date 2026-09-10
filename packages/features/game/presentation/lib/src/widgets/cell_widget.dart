import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_domain/game_domain.dart';
import 'package:game_presentation/src/notifiers/game_ui_state_notifier.br.dart';

/// One cell, and one cell only.
///
/// It takes an index rather than a mark, which keeps the call site `const` and its
/// parent out of the rebuild: a move redraws the cell that changed, not the board. The
/// two values it needs come through a single record select — records compare
/// structurally, so one subscription covers both without firing on unrelated changes.
class CellWidget extends ConsumerStatefulWidget {
  const CellWidget({required this.index, super.key});

  final int index;

  @override
  ConsumerState<CellWidget> createState() => _CellWidgetState();
}

class _CellWidgetState extends ConsumerState<CellWidget> with SingleTickerProviderStateMixin {
  /// Squash then overshoot then settle. It ends on 1.0 and never repeats, so a widget
  /// test can still `pumpAndSettle`.
  static final _bumpTween = TweenSequence<double>([
    TweenSequenceItem(
      tween: Tween<double>(begin: 1, end: 0.9).chain(CurveTween(curve: Curves.easeOut)),
      weight: 30,
    ),
    TweenSequenceItem(
      tween: Tween(begin: 0.9, end: 1.07).chain(CurveTween(curve: Curves.easeOut)),
      weight: 40,
    ),
    TweenSequenceItem(
      tween: Tween<double>(begin: 1.07, end: 1).chain(CurveTween(curve: Curves.easeIn)),
      weight: 30,
    ),
  ]);

  late final AnimationController _bump = AnimationController(
    duration: const Duration(milliseconds: 260),
    vsync: this,
  );

  late final Animation<double> _scale = _bump.drive(_bumpTween);

  @override
  void dispose() {
    _bump.dispose();
    super.dispose();
  }

  /// Checkerboard: the two tints come from the theme, so the feature never names one.
  Color _tint(ColorScheme colors) {
    final isEven = (widget.index ~/ Board.side + widget.index % Board.side).isEven;

    return isEven ? colors.surfaceContainerHigh : colors.surfaceContainerHighest;
  }

  @override
  Widget build(BuildContext context) {
    final (mark, isWinning) = ref.watch(
      gameUiStateProvider.select(
        (state) => (state.markAt(widget.index), state.isWinning(widget.index)),
      ),
    );
    final colors = Theme.of(context).colorScheme;

    // A tap bumps the cell it hit; the machine's move has no tap, so its cell bumps from
    // here. The guard keeps a tap's own bump from being cut short by its own mark landing.
    ref.listen(gameUiStateProvider.select((state) => state.markAt(widget.index)), (before, after) {
      if (before == null && after != null && !_bump.isAnimating) {
        _bump.forward(from: 0);
      }
    });

    return GestureDetector(
      onTap: () {
        _bump.forward(from: 0);
        ref.read(gameUiStateProvider.notifier).play(widget.index);
      },
      child: ScaleTransition(
        scale: _scale,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: isWinning ? colors.secondaryContainer : _tint(colors),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: colors.onSurface.withValues(alpha: 0.12), width: 1.5),
            boxShadow: [
              // No blur on purpose: an offset hard edge reads as a thick plastic tile.
              BoxShadow(color: colors.shadow.withValues(alpha: 0.32), offset: const Offset(0, 5)),
            ],
          ),
          child: Center(
            child: mark == null
                ? const SizedBox.shrink()
                : Text(
                    mark.label,
                    style: TextStyle(
                      color: mark == Mark.x ? colors.primary : colors.tertiary,
                      fontSize: 46,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
