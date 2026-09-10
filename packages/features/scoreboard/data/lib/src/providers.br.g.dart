// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Typed with the domain interface, so the data source name never leaves this package.

@ProviderFor(scoreboardRepositoryImpl)
final scoreboardRepositoryImplProvider = ScoreboardRepositoryImplProvider._();

/// Typed with the domain interface, so the data source name never leaves this package.

final class ScoreboardRepositoryImplProvider
    extends $FunctionalProvider<ScoreboardRepository, ScoreboardRepository, ScoreboardRepository>
    with $Provider<ScoreboardRepository> {
  /// Typed with the domain interface, so the data source name never leaves this package.
  ScoreboardRepositoryImplProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scoreboardRepositoryImplProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scoreboardRepositoryImplHash();

  @$internal
  @override
  $ProviderElement<ScoreboardRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ScoreboardRepository create(Ref ref) {
    return scoreboardRepositoryImpl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ScoreboardRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ScoreboardRepository>(value),
    );
  }
}

String _$scoreboardRepositoryImplHash() => r'd22942f8c850b1a95e37d2ef9a01ab0c0b6f0898';
