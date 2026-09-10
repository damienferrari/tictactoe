// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_ui_state_notifier.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GameUiStateNotifier)
final gameUiStateProvider = GameUiStateNotifierProvider._();

final class GameUiStateNotifierProvider
    extends $NotifierProvider<GameUiStateNotifier, GameUiState> {
  GameUiStateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gameUiStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gameUiStateNotifierHash();

  @$internal
  @override
  GameUiStateNotifier create() => GameUiStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GameUiState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GameUiState>(value),
    );
  }
}

String _$gameUiStateNotifierHash() => r'ea1108a1883159ccf14246e840e2d4134e1b062c';

abstract class _$GameUiStateNotifier extends $Notifier<GameUiState> {
  GameUiState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<GameUiState, GameUiState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GameUiState, GameUiState>,
              GameUiState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
