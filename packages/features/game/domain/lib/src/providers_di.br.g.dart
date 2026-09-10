// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_di.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Injected rather than constructed here, so tests can seed it and replay a game.
/// Throws until fed: a missing binding fails loudly instead of degrading.

@ProviderFor(random)
final randomProvider = RandomProvider._();

/// Injected rather than constructed here, so tests can seed it and replay a game.
/// Throws until fed: a missing binding fails loudly instead of degrading.

final class RandomProvider extends $FunctionalProvider<Random, Random, Random>
    with $Provider<Random> {
  /// Injected rather than constructed here, so tests can seed it and replay a game.
  /// Throws until fed: a missing binding fails loudly instead of degrading.
  RandomProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'randomProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$randomHash();

  @$internal
  @override
  $ProviderElement<Random> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  Random create(Ref ref) {
    return random(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Random value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<Random>(value));
  }
}

String _$randomHash() => r'101cda3c98b6c97ee5e7fbc1dd5df5a751635871';
