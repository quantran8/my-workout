// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Access)
final accessProvider = AccessProvider._();

final class AccessProvider extends $NotifierProvider<Access, AccessTier> {
  AccessProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'accessProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$accessHash();

  @$internal
  @override
  Access create() => Access();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AccessTier value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AccessTier>(value),
    );
  }
}

String _$accessHash() => r'4c6959a60ea9a55f2a1ca39f17697067f006d2b4';

abstract class _$Access extends $Notifier<AccessTier> {
  AccessTier build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AccessTier, AccessTier>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AccessTier, AccessTier>,
              AccessTier,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
