# Tic-tac-toe
<img height="500" alt="Screenshot_1789031275" src="https://github.com/user-attachments/assets/c45bad48-0daf-45b8-a105-ddb28c6eb054" />
<img height="500" alt="Simulator Screenshot - iPhone 17 - 2026-09-10 at 11 08 07" src="https://github.com/user-attachments/assets/390d1618-dabd-4bac-9c41-b5183eb380dc" />


A local game against a computer opponent.

**The game is the pretext.** Nine cells and a solved game are not an engineering problem.
What this repository is about is two things, and it is worth stating them before any code:

1. **Two features that cannot reach each other** — separate packages, no shared import,
   coordinated only from above — and two mechanical ways to *prove* it rather than claim it.
2. **It deliberately follows the conventions of Betclic's `flutter-front` monorepo**, including
   where those conventions are heavier than a tic-tac-toe warrants. That choice is defended
   below under [Why it looks like this](#why-it-looks-like-this).

**Flutter 3.44.4 · Dart 3.12 · Riverpod 3 · freezed · auto_route**

**Architecture walkthrough → [damienferrari.github.io/tictactoe](https://damienferrari.github.io/tictactoe/)**
— the same story layer by layer, with the dependency graphs, a catalogue of every provider
and what it supplies, and the full sequence from a tap on a cell down to the disk write.
Written in French; this README covers the same ground in English.

---

## Run it

```bash
flutter pub get                       # one resolution for the whole workspace
./tool/check.sh                       # format, analyze, and the 91 tests
./tool/prove_independence.sh          # deletes each feature in turn, rebuilds the rest

cd apps/tictactoe && flutter run
```

From VS Code, open the **repository root** and pick the `tictactoe` launch configuration.
`.vscode/settings.json` raises `dart.projectSearchDepth`, without which the extension does not
look deep enough to find the app — the root is a pub workspace, not a Flutter project. That
setting is read at window startup, so reload the window if the device selector is missing.

Verified on the iOS simulator and an Android emulator.

## Layout

```
apps/tictactoe/                 composition: it wires, it does not compute
packages/features/game/         domain + presentation — rules, opponent, board
packages/features/scoreboard/   domain + data + presentation — the persisted tally
```

Six packages in a [pub workspace](https://dart.dev/tools/pub/workspaces): one `pubspec.lock`,
one `flutter pub get`, packages referring to each other by name.

`game` computes and persists nothing, so **it has no data layer**. `scoreboard` persists, holds
three lines of logic, and has a real DTO-to-entity boundary. The contrast is the point: a data
layer answers a need, it is not a slot to fill because the diagram has one.

---

## 1. Two features that cannot reach each other

When a game ends the tally must move, and the obvious solution — `game` calls `scoreboard` — is
the one to refuse. Instead `game` publishes on an outgoing port that throws until something
binds it, and **the app translates**:

```dart
// apps/tictactoe/lib/src/composition/game_result_recorder.dart
extension GameOutcomeMapper on GameOutcome {
  MatchResult? toMatchResult(Mark humanMark) => switch (this) {
    GameDraw() => MatchResult.draw,
    GameWin(:final mark) => mark == humanMark ? MatchResult.win : MatchResult.loss,
    GameInProgress() => null,
  };
}
```

`game` does not know `MatchResult`; `scoreboard` does not know `GameOutcome`. And the language
itself keeps the translation where it belongs: **Dart extensions are lexically scoped**, so
calling `outcome.toMatchResult(...)` from inside a feature is `undefined_method`, not a style
violation. Verified by trying it.

### Two proofs, and they are not the same proof

`apps/tictactoe/test/architecture/dependency_rule_test.dart` reads the six manifests and fails
on a feature-to-feature dependency, a domain that pulls in Flutter, or a presentation layer
reaching into a data layer. It asserts the **negative**: nothing declares what it must not. It
has been checked against a deliberate violation — a rule nothing enforces is a comment.

`tool/prove_independence.sh` asserts the **positive**. For each feature it physically moves
every other feature *and the app* out of the tree, re-resolves, then analyses and tests what
remains:

```
════════ only game remains ════════       ════════ only scoreboard remains ════════
No issues found!                          No issues found!
  ── game/domain        45 tests            ── scoreboard/domain        9 tests
  ── game/presentation  16 tests            ── scoreboard/data          7 tests
                                            ── scoreboard/presentation  3 tests
```

Both run in CI. **An honest caveat:** a pub workspace makes a cross-feature import
*resolvable* — the analyzer reports only an `info`. So the boundary here is held by these two
checks, not by the compiler. `flutter-front` has the same property and answers it the same
way, with `scripts/validate_dependencies.sh` failing the build.

## 2. Dependency inversion, six times

Reducing it to "the repository interface goes in the domain" misses most of it. The rule is a
direction: **whoever needs declares the contract, whoever knows how implements it.**

| Contract | Declared by | Implemented by | What is inverted |
|---|---|---|---|
| `ScoreboardRepository` | scoreboard/domain | scoreboard/data | data access |
| `KeyValueStore` | scoreboard/**data** | composition | the data layer's *own* infrastructure |
| `OnGameFinished` | game/presentation | composition | **control flow** — an outgoing event |
| `GameRouting` | game/presentation | composition | **navigation and its shape** |
| `Random` | game/domain | composition | an ambient dependency; seeded in tests |
| `cpuMoveDelay` | game/presentation | composition, optional | timing — the only one that does not throw |

The second row is the one usually missed: **the data layer is not the bottom of the stack.** It
has its own bottom and inverts it exactly as the domain inverts its repository. Two stacked
inversions, which is why `scoreboard/data` is tested in plain `dart test` with no Flutter
binding, against a fake backed by a `Map`.

`shared_preferences` is the only external runtime dependency, and it appears in exactly one
class, in the app.

## 3. The provider triple, and the two shapes of contract

| File | Answers | Direction |
|---|---|---|
| `providers_di.br.dart` | what do I need from outside? Stubs that throw until fed. **Never exported.** | in |
| `providers_internal.br.dart` | how am I wired inside? Strategies, data sources. | internal |
| `providers.br.dart` / `providers.dart` | what do I offer, and where do you plug in? Public API plus `bindProviders()`. | out |

A package has exactly one public providers file. The discriminator is whether the layer exports
an annotated provider: if it does it needs codegen and the file is `providers.br.dart`; the two
presentation layers do not, so theirs is a plain `providers.dart`.

Contracts come in **two shapes**, and one question separates them — *is there a default that
makes sense?*

```dart
// game/presentation/lib/src/providers_di.br.dart

/// Throws: there is no inventing a destination.
@riverpod
GameRouting gameRouting(Ref _) => throw StateError('gameRoutingProvider was never bound');

/// Returns the in-package default, so binding it is optional — tests bind `Duration.zero`.
@riverpod
Duration cpuMoveDelay(Ref _) => _cpuMoveDelay;
```

For an outgoing port, no — so it throws, and a forgotten binding fails loudly at first use.
For a 350 ms pause, yes — so it returns the package's own value and binding stays optional.

**Read `apps/tictactoe/lib/src/composition/providers.dart` first.** Every package is imported
with a prefix, because they all expose a `bindProviders` — the clash is the design, and that
one file *is* the architecture.

## 4. The feature emits, the app decides

Throwing away a game in progress should ask first. The feature knows **that** it must ask and
what to do with the answer; it does not know the question is an `AlertDialog`:

```dart
// game/presentation — the port
abstract interface class GameRouting {
  Future<bool> onRestartConfirmationRequested(BuildContext context);
}
```

The method is named as an **event**, not a navigation instruction (`on…Requested`, never
`navigateTo…`) — destination and stack policy belong to the router.

Two consequences worth knowing:

- The feature's own tests inject a double, so **nothing there would catch a broken
  `showDialog`**. `apps/tictactoe/test/widget/restart_dialog_test.dart` exercises the real
  implementation for that reason.
- **`BuildContext` liveness follows the house rule**: the caller owns the `await` gap and
  decides what a dead context means; the implementation opens with `assert(context.mounted)`
  and never a silent `if (!context.mounted) return;`, which would turn a programming error
  into a modal that sometimes does not appear.

The mirror case is `DifficultyMenuButton`. The level picker lives in the app's `AppBar`, but
the current level lives in state the app cannot read — so **the feature exports the widget and
the app decides where it sits.** Same contract as `GameScreen`, opposite direction.

## 5. Rebuild granularity is a design, and it is pinned

The unit of rebuild is the widget that subscribes, so each cell subscribes to its own cell:

```dart
final (mark, isWinning) = ref.watch(
  gameUiStateProvider.select((state) => (state.markAt(index), state.isWinning(index))),
);
```

A record, because Dart records compare structurally — **one subscription for two values**,
firing only when either actually changes. The constructor takes an `int`, which is what keeps
the call site `const`, which is what keeps the parent out of the rebuild.

`rebuild_granularity_test.dart` pins it: a move notifies **two** cells and leaves the other
seven alone. Without that test the claim would be decoration.

Colours obey the same discipline in the other direction: **no feature names a colour.**
Everything reads a role off `Theme.of(context).colorScheme`, and the app owns the palette —
the local stand-in for `flutter-front`'s rule against raw values outside the design system.

## 6. The opponent — deliberately the least interesting part

Three difficulties behind one `MoveStrategy` interface. `ChooseMove` maps a difficulty to a
strategy and **contains no algorithm**, so nothing above it knows which one runs:

```dart
int call(Game game) => switch (game.difficulty) {
  Difficulty.easy => easy, Difficulty.hard => hard, Difficulty.medium => medium,
}.chooseMove(game.board, game.turn);
```

Two algorithms, three levels: random, full minimax with alpha-beta pruning, and **minimax
wrapped in a 20 % blunder rate**. The wrapper is not a depth-limited minimax on purpose — a
shallow opponent is predictably weak in the same positions every time, so it becomes
exploitable; this one is beatable without being learnable.

Ties are broken at random rather than by lowest index, which is why `Random` is injected: no
seeding, no reproducible test. One test walks the entire tree of human moves against **every**
optimal reply, tie-breaks driven by a fake `Random` — a proof rather than a sample. It runs in
milliseconds because the domain is pure Dart.

That is the whole of it. The interest stops at "a provider hands you a move".

---

## Why it looks like this

Several choices here are **disproportionate for a nine-cell game, and that is the point.** The
brief asks to showcase engineering standards; the standard being shown is the one used by the
codebase this targets. A house convention applied halfway costs a reader more than a
convention applied completely, so it is applied completely — and dropped where it has nothing
to carry.

| Convention here | Where it comes from in `flutter-front` |
|---|---|
| `providers_di` / `providers_internal` / `providers` per layer | `rules/naming.md` § Provider files |
| `bindProviders()` / `bindRoutingProvider()`, and that set being closed | `rules/feature.md` § Provider Binding |
| `.br.dart` suffix with `part '*.br.g.dart'` | AGENTS.md § Naming Conventions |
| feature-first, three layers, domain independent of Flutter | AGENTS.md § Feature-First Architecture |
| routing as a port with event-named methods (`on…Requested`) | `rules/feature.md` § Routing method naming |
| `{Feature}Page` above `{Feature}Screen`, via `@RoutePage` | `rules/feature.md` § Feature Router |
| `{Feature}UiState` + `{Feature}UiStateNotifier` | `rules/naming.md` |
| behaviours are verb-named callables, no suffix, never exported | `rules/behaviors.md` |
| `IList` for collections in watched state | `rules/immutable-collections.md` |
| caller owns `context.mounted`; callee asserts | `rules/build-context-liveness.md` |
| leaf watches, narrowest `select`, `const` call sites | `rules/riverpodify-ui.md` |
| no feature-to-feature import, enforced by a check that fails the build | `rules/cross-feature.md` |
| no raw visual values inside a feature | `rules/dsm-tokens.md`, adapted — see below |

**Three adaptations, stated rather than hidden.** There is no design system package here, so
the app's `ColorScheme` plays the role `tactics` tokens play there. There is no `Givn`, so
tests are plain `test()` / `testWidgets()` with behaviour-named descriptions. And `providers_internal`
is **absent from `game/presentation`**: that file exists to default a feature theme, there is
no feature theme here, and keeping it empty would be costume rather than convention.

## Deliberately not done

**Melos.** The native pub workspace gives one resolution, one `pub get`, name-based references.
Melos adds centralised versions and per-package scripts; at six packages and one developer that
is a tool to install for a problem I do not have. The threshold is clear: when versions need a
single source of truth, Melos pays.

**A package generator.** Mason bricks were written and then removed, mirroring
`mise run create-package`. A generator pays off on the tenth feature, not the second, and it
added a template to maintain alongside the code it produced. The six packages are hand-written.

**An event bus.** A bus makes the dependency graph invisible — you cannot tell who listens
without reading everything. A named port bound in one place is legible in the composition file.
At two features it barely matters; at twenty I would still want to answer "what reacts to a
finished game?" by opening one file.

**A mocking library.** A fake `KeyValueStore` over a `Map` is fifteen lines, reads at a glance,
and survives a compatible signature change. Mockito would have added codegen and a verification
syntax this project does not need.

**Golden tests — the real gap.** There are none, and the 91 behaviour tests stayed green
through a complete visual redesign, because they do not look at pixels. A golden on the board
(empty, mid-game, winning line, light and dark) would pin the rendering so a change is a
decision rather than an accident. It is the first thing I would add.

**A note on one dependency:** `freezed` resolves to a `-dev` build. Its stable line requires
`analyzer <11`, which the current `build_runner` refuses on Dart 3.12, and pinning it cascades
into `json_serializable`. It is a `dev_dependency` — never in the shipped binary — and the
lockfile is committed, so builds are reproducible.

## Two bugs the tests found

The board took the full width it was offered and **overflowed vertically** on a wide surface —
it made itself square from whatever width it got. It is now capped and the home screen scrolls,
which also covers a short screen and enlarged system text.

The level pills **overflowed horizontally by 15 px** once they were restyled thicker. Fixed with
a `Wrap` rather than a smaller number, so it also holds when the system text size is raised.

Neither was visible by hand on a phone-sized simulator. Both surfaced on the first test run
after the change.

## What I would add next

Golden tests, as above. A local two-player mode — `game` already supports it, only the
presentation would move, which makes it a good test of the boundary. And a game history, which
would turn `scoreboard` into a real list feature.
