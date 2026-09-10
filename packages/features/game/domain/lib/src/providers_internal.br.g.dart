// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_internal.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(easyStrategy)
final easyStrategyProvider = EasyStrategyProvider._();

final class EasyStrategyProvider
    extends $FunctionalProvider<MoveStrategy, MoveStrategy, MoveStrategy>
    with $Provider<MoveStrategy> {
  EasyStrategyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'easyStrategyProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$easyStrategyHash();

  @$internal
  @override
  $ProviderElement<MoveStrategy> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MoveStrategy create(Ref ref) {
    return easyStrategy(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MoveStrategy value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MoveStrategy>(value),
    );
  }
}

String _$easyStrategyHash() => r'2461ff7e41f846100a01c2ce35ddbe4b605eaa7d';

@ProviderFor(hardStrategy)
final hardStrategyProvider = HardStrategyProvider._();

final class HardStrategyProvider
    extends $FunctionalProvider<MoveStrategy, MoveStrategy, MoveStrategy>
    with $Provider<MoveStrategy> {
  HardStrategyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hardStrategyProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hardStrategyHash();

  @$internal
  @override
  $ProviderElement<MoveStrategy> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MoveStrategy create(Ref ref) {
    return hardStrategy(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MoveStrategy value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MoveStrategy>(value),
    );
  }
}

String _$hardStrategyHash() => r'88e4dddbc0add50dd5d90515a0e501560655397e';

@ProviderFor(mediumStrategy)
final mediumStrategyProvider = MediumStrategyProvider._();

final class MediumStrategyProvider
    extends $FunctionalProvider<MoveStrategy, MoveStrategy, MoveStrategy>
    with $Provider<MoveStrategy> {
  MediumStrategyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mediumStrategyProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mediumStrategyHash();

  @$internal
  @override
  $ProviderElement<MoveStrategy> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MoveStrategy create(Ref ref) {
    return mediumStrategy(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MoveStrategy value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MoveStrategy>(value),
    );
  }
}

String _$mediumStrategyHash() => r'997a8a2b91f99d188071b2ccf066ab4f54f9f52a';
