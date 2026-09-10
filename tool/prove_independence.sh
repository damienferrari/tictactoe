#!/usr/bin/env bash
# Proves the claim the repository is built on: each feature stands alone.
#
# The architecture test asserts the negative — no feature declares another in its
# pubspec. This goes further: it physically removes every other feature and the app,
# then analyses and tests what is left. A feature that survives that is independent in
# the only sense that matters.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

FEATURES=(game scoreboard)
STASH="$(mktemp -d)"

restore() {
  for feature in "${FEATURES[@]}"; do
    [ -d "$STASH/$feature" ] && mv "$STASH/$feature" "packages/features/$feature"
  done
  [ -d "$STASH/apps" ] && mv "$STASH/apps" apps
  [ -f "$STASH/pubspec.yaml" ] && mv "$STASH/pubspec.yaml" pubspec.yaml
  rm -rf "$STASH"
  flutter pub get >/dev/null 2>&1 || true
}
trap restore EXIT

cp pubspec.yaml "$STASH/pubspec.yaml.keep"

for kept in "${FEATURES[@]}"; do
  echo "════════ only $kept remains ════════"
  cp "$STASH/pubspec.yaml.keep" pubspec.yaml

  # The app depends on both features, so it goes too: what is under test is the
  # feature, not the assembled product.
  mv apps "$STASH/apps"
  sed -i.bak '/- apps\/tictactoe/d' pubspec.yaml && rm -f pubspec.yaml.bak

  for feature in "${FEATURES[@]}"; do
    [ "$feature" = "$kept" ] && continue
    mv "packages/features/$feature" "$STASH/$feature"
    sed -i.bak "/- packages\/features\/$feature\//d" pubspec.yaml && rm -f pubspec.yaml.bak
  done

  flutter pub get >/dev/null
  dart analyze
  for layer in packages/features/"$kept"/*; do
    [ -d "$layer/test" ] || continue
    echo "  ── ${layer#packages/features/}"
    if grep -q 'flutter_test' "$layer/pubspec.yaml"; then
      ( cd "$layer" && flutter test )
    else
      ( cd "$layer" && dart test )
    fi
  done

  # put everything back before the next round
  for feature in "${FEATURES[@]}"; do
    [ -d "$STASH/$feature" ] && mv "$STASH/$feature" "packages/features/$feature"
  done
  mv "$STASH/apps" apps
done

mv "$STASH/pubspec.yaml.keep" "$STASH/pubspec.yaml"
echo "════════ each feature builds and tests on its own ════════"
