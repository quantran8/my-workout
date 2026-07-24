// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(currentRepository)
final currentRepositoryProvider = CurrentRepositoryProvider._();

final class CurrentRepositoryProvider
    extends
        $FunctionalProvider<
          CurrentRepository,
          CurrentRepository,
          CurrentRepository
        >
    with $Provider<CurrentRepository> {
  CurrentRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentRepositoryHash();

  @$internal
  @override
  $ProviderElement<CurrentRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CurrentRepository create(Ref ref) {
    return currentRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CurrentRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CurrentRepository>(value),
    );
  }
}

String _$currentRepositoryHash() => r'5d4773ada6b4bfa8178a87fbaeb4662df8e49e34';
