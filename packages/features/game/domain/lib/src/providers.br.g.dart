// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(applyMove)
final applyMoveProvider = ApplyMoveProvider._();

final class ApplyMoveProvider extends $FunctionalProvider<ApplyMoveFun, ApplyMoveFun, ApplyMoveFun>
    with $Provider<ApplyMoveFun> {
  ApplyMoveProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'applyMoveProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$applyMoveHash();

  @$internal
  @override
  $ProviderElement<ApplyMoveFun> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ApplyMoveFun create(Ref ref) {
    return applyMove(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ApplyMoveFun value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ApplyMoveFun>(value),
    );
  }
}

String _$applyMoveHash() => r'90eb2e2e85a657d7cb15cf962863d3793864a663';

@ProviderFor(chooseCpuMove)
final chooseCpuMoveProvider = ChooseCpuMoveProvider._();

final class ChooseCpuMoveProvider
    extends $FunctionalProvider<ChooseCpuMove, ChooseCpuMove, ChooseCpuMove>
    with $Provider<ChooseCpuMove> {
  ChooseCpuMoveProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chooseCpuMoveProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chooseCpuMoveHash();

  @$internal
  @override
  $ProviderElement<ChooseCpuMove> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ChooseCpuMove create(Ref ref) {
    return chooseCpuMove(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChooseCpuMove value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChooseCpuMove>(value),
    );
  }
}

String _$chooseCpuMoveHash() => r'b391075e920a28414280f8de8916d54cbef7887e';
