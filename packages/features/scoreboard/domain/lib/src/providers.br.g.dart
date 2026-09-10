// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recordMatch)
final recordMatchProvider = RecordMatchProvider._();

final class RecordMatchProvider
    extends $FunctionalProvider<RecordMatchFun, RecordMatchFun, RecordMatchFun>
    with $Provider<RecordMatchFun> {
  RecordMatchProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recordMatchProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recordMatchHash();

  @$internal
  @override
  $ProviderElement<RecordMatchFun> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RecordMatchFun create(Ref ref) {
    return recordMatch(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RecordMatchFun value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RecordMatchFun>(value),
    );
  }
}

String _$recordMatchHash() => r'70c9a382e532e78116f355b5c9066f38f359b43b';
