// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_di.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Throws: there is no inventing a destination.

@ProviderFor(gameRouting)
final gameRoutingProvider = GameRoutingProvider._();

/// Throws: there is no inventing a destination.

final class GameRoutingProvider extends $FunctionalProvider<GameRouting, GameRouting, GameRouting>
    with $Provider<GameRouting> {
  /// Throws: there is no inventing a destination.
  GameRoutingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gameRoutingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gameRoutingHash();

  @$internal
  @override
  $ProviderElement<GameRouting> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GameRouting create(Ref ref) {
    return gameRouting(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GameRouting value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GameRouting>(value),
    );
  }
}

String _$gameRoutingHash() => r'5ef8fcb7d8a9a96c53c037539190bbf334a8ed7d';

/// Throws: doing nothing when a game ends is a missing binding, not a sane default.

@ProviderFor(onGameFinished)
final onGameFinishedProvider = OnGameFinishedProvider._();

/// Throws: doing nothing when a game ends is a missing binding, not a sane default.

final class OnGameFinishedProvider
    extends $FunctionalProvider<OnGameFinished, OnGameFinished, OnGameFinished>
    with $Provider<OnGameFinished> {
  /// Throws: doing nothing when a game ends is a missing binding, not a sane default.
  OnGameFinishedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onGameFinishedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onGameFinishedHash();

  @$internal
  @override
  $ProviderElement<OnGameFinished> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  OnGameFinished create(Ref ref) {
    return onGameFinished(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OnGameFinished value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OnGameFinished>(value),
    );
  }
}

String _$onGameFinishedHash() => r'd6d8a429661aa367cf62fe6b78891a769d392d27';

/// Returns the in-package default, so binding it is optional — tests bind `Duration.zero`.

@ProviderFor(cpuMoveDelay)
final cpuMoveDelayProvider = CpuMoveDelayProvider._();

/// Returns the in-package default, so binding it is optional — tests bind `Duration.zero`.

final class CpuMoveDelayProvider extends $FunctionalProvider<Duration, Duration, Duration>
    with $Provider<Duration> {
  /// Returns the in-package default, so binding it is optional — tests bind `Duration.zero`.
  CpuMoveDelayProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cpuMoveDelayProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cpuMoveDelayHash();

  @$internal
  @override
  $ProviderElement<Duration> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  Duration create(Ref ref) {
    return cpuMoveDelay(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Duration value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<Duration>(value));
  }
}

String _$cpuMoveDelayHash() => r'65e34275e98606d060a1d610687d5f5aff9e6718';
