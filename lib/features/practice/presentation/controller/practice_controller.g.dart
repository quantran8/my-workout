// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'practice_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Drives the whole practice flow: the set overview → exercise loop → rest, and
/// the cardio overview → continuous / structured runners. Every timer lives
/// here so they survive rebuilds and sheet opens, and are cancelled on dispose.

@ProviderFor(Practice)
final practiceProvider = PracticeProvider._();

/// Drives the whole practice flow: the set overview → exercise loop → rest, and
/// the cardio overview → continuous / structured runners. Every timer lives
/// here so they survive rebuilds and sheet opens, and are cancelled on dispose.
final class PracticeProvider
    extends $NotifierProvider<Practice, PracticeState> {
  /// Drives the whole practice flow: the set overview → exercise loop → rest, and
  /// the cardio overview → continuous / structured runners. Every timer lives
  /// here so they survive rebuilds and sheet opens, and are cancelled on dispose.
  PracticeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'practiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$practiceHash();

  @$internal
  @override
  Practice create() => Practice();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PracticeState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PracticeState>(value),
    );
  }
}

String _$practiceHash() => r'20ecb80fdb67471520d1b6ffc7ae71f01f42deed';

/// Drives the whole practice flow: the set overview → exercise loop → rest, and
/// the cardio overview → continuous / structured runners. Every timer lives
/// here so they survive rebuilds and sheet opens, and are cancelled on dispose.

abstract class _$Practice extends $Notifier<PracticeState> {
  PracticeState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<PracticeState, PracticeState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PracticeState, PracticeState>,
              PracticeState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
