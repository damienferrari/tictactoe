// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scoreboard_notifier.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A notifier rather than a plain provider because something outside writes it: the
/// composition layer records a result when a game ends.

@ProviderFor(ScoreboardNotifier)
final scoreboardProvider = ScoreboardNotifierProvider._();

/// A notifier rather than a plain provider because something outside writes it: the
/// composition layer records a result when a game ends.
final class ScoreboardNotifierProvider
    extends $AsyncNotifierProvider<ScoreboardNotifier, Scoreboard> {
  /// A notifier rather than a plain provider because something outside writes it: the
  /// composition layer records a result when a game ends.
  ScoreboardNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scoreboardProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scoreboardNotifierHash();

  @$internal
  @override
  ScoreboardNotifier create() => ScoreboardNotifier();
}

String _$scoreboardNotifierHash() => r'a7fcc975a3fbf063fc9135ced41e3e4ffc1c5b5e';

/// A notifier rather than a plain provider because something outside writes it: the
/// composition layer records a result when a game ends.

abstract class _$ScoreboardNotifier extends $AsyncNotifier<Scoreboard> {
  FutureOr<Scoreboard> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Scoreboard>, Scoreboard>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Scoreboard>, Scoreboard>,
              AsyncValue<Scoreboard>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
