// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_internal.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recordMatchBehaviour)
final recordMatchBehaviourProvider = RecordMatchBehaviourProvider._();

final class RecordMatchBehaviourProvider
    extends $FunctionalProvider<RecordMatch, RecordMatch, RecordMatch>
    with $Provider<RecordMatch> {
  RecordMatchBehaviourProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recordMatchBehaviourProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recordMatchBehaviourHash();

  @$internal
  @override
  $ProviderElement<RecordMatch> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RecordMatch create(Ref ref) {
    return recordMatchBehaviour(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RecordMatch value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RecordMatch>(value),
    );
  }
}

String _$recordMatchBehaviourHash() => r'0f8319c26a7bee0228cdad1fbb01941a38feead3';
