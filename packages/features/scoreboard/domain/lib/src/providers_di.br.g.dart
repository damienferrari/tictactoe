// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_di.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(scoreboardRepository)
final scoreboardRepositoryProvider = ScoreboardRepositoryProvider._();

final class ScoreboardRepositoryProvider
    extends $FunctionalProvider<ScoreboardRepository, ScoreboardRepository, ScoreboardRepository>
    with $Provider<ScoreboardRepository> {
  ScoreboardRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scoreboardRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scoreboardRepositoryHash();

  @$internal
  @override
  $ProviderElement<ScoreboardRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ScoreboardRepository create(Ref ref) {
    return scoreboardRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ScoreboardRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ScoreboardRepository>(value),
    );
  }
}

String _$scoreboardRepositoryHash() => r'e5a769cc4d8c04af4a966d3541a8748f910b077d';
