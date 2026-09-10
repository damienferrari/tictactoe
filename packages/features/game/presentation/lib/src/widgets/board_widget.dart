import 'dart:math';

import 'package:flutter/material.dart';
import 'package:game_domain/game_domain.dart';
import 'package:game_presentation/src/widgets/cell_widget.dart';

/// Lays out the nine cells and watches nothing itself, so a move never reaches it.
class BoardWidget extends StatelessWidget {
  const BoardWidget({super.key});

  /// The board stays square and stops growing past this. Without a cap it would take
  /// the full width it is offered and overflow vertically on a wide surface.
  static const double maxSide = 320;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final side = min(constraints.maxWidth, maxSide);

        return DecoratedBox(
          decoration: BoxDecoration(
            color: colors.primaryContainer,
            borderRadius: const BorderRadius.all(Radius.circular(28)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: side,
              height: side,
              child: GridView.count(
                crossAxisCount: Board.side,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  CellWidget(index: 0),
                  CellWidget(index: 1),
                  CellWidget(index: 2),
                  CellWidget(index: 3),
                  CellWidget(index: 4),
                  CellWidget(index: 5),
                  CellWidget(index: 6),
                  CellWidget(index: 7),
                  CellWidget(index: 8),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
