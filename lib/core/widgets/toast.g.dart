// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toast.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Current toast message, or null when nothing is showing.
///
/// Held in Riverpod rather than an [Overlay] so a toast can be raised from a
/// controller or a validation guard without a [BuildContext].

@ProviderFor(Toast)
final toastProvider = ToastProvider._();

/// Current toast message, or null when nothing is showing.
///
/// Held in Riverpod rather than an [Overlay] so a toast can be raised from a
/// controller or a validation guard without a [BuildContext].
final class ToastProvider extends $NotifierProvider<Toast, String?> {
  /// Current toast message, or null when nothing is showing.
  ///
  /// Held in Riverpod rather than an [Overlay] so a toast can be raised from a
  /// controller or a validation guard without a [BuildContext].
  ToastProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'toastProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$toastHash();

  @$internal
  @override
  Toast create() => Toast();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$toastHash() => r'c9eaf70b66f0921c25985d8097623d708928ba9b';

/// Current toast message, or null when nothing is showing.
///
/// Held in Riverpod rather than an [Overlay] so a toast can be raised from a
/// controller or a validation guard without a [BuildContext].

abstract class _$Toast extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
