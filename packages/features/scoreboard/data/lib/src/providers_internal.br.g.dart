// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_internal.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(scoreboardLocalDataSource)
final scoreboardLocalDataSourceProvider = ScoreboardLocalDataSourceProvider._();

final class ScoreboardLocalDataSourceProvider
    extends
        $FunctionalProvider<
          ScoreboardLocalDataSource,
          ScoreboardLocalDataSource,
          ScoreboardLocalDataSource
        >
    with $Provider<ScoreboardLocalDataSource> {
  ScoreboardLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scoreboardLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scoreboardLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<ScoreboardLocalDataSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ScoreboardLocalDataSource create(Ref ref) {
    return scoreboardLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ScoreboardLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ScoreboardLocalDataSource>(value),
    );
  }
}

String _$scoreboardLocalDataSourceHash() => r'ef83ee07935f9c825d79c1574d721ec5aac5dee9';
