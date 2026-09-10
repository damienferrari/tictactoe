#!/usr/bin/env bash
# Everything CI runs, runnable locally in one command.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

# Packages carrying tests. Pure Dart ones run under `dart test`, which is much faster
# than booting the Flutter harness for code that never touches it.
DART_PACKAGES=(
  packages/features/game/domain
  packages/features/scoreboard/domain
  packages/features/scoreboard/data
)
FLUTTER_PACKAGES=(
  packages/features/game/presentation
  packages/features/scoreboard/presentation
  apps/tictactoe
)

echo "==> resolving"
flutter pub get

echo "==> format"
dart format --line-length 100 --output=none --set-exit-if-changed .

echo "==> analyze"
dart analyze

echo "==> tests (pure Dart)"
for package in "${DART_PACKAGES[@]}"; do
  echo "--- $package"
  ( cd "$package" && dart test )
done

echo "==> tests (Flutter)"
for package in "${FLUTTER_PACKAGES[@]}"; do
  echo "--- $package"
  ( cd "$package" && flutter test )
done

echo "==> all green"
