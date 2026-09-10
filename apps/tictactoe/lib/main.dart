import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/src/app.dart';
import 'package:tictactoe/src/composition/providers.dart';

void main() =>
    runApp(ProviderScope(overrides: compositionOverrides(), child: const TicTacToeApp()));
