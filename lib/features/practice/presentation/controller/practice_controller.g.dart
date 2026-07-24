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
///
/// keepAlive: `beginSession`/`loadExecution` run on the readiness route, then
/// the app navigates to the practice runner. An autoDispose provider would be
/// torn down in the gap between the two routes, dropping the loaded session and
/// bouncing the runner back to its standalone demo state. [reset] returns it to
/// the empty state after a session ends.

@ProviderFor(Practice)
final practiceProvider = PracticeProvider._();

/// Drives the whole practice flow: the set overview → exercise loop → rest, and
/// the cardio overview → continuous / structured runners. Every timer lives
/// here so they survive rebuilds and sheet opens, and are cancelled on dispose.
///
/// keepAlive: `beginSession`/`loadExecution` run on the readiness route, then
/// the app navigates to the practice runner. An autoDispose provider would be
/// torn down in the gap between the two routes, dropping the loaded session and
/// bouncing the runner back to its standalone demo state. [reset] returns it to
/// the empty state after a session ends.
final class PracticeProvider
    extends $NotifierProvider<Practice, PracticeState> {
  /// Drives the whole practice flow: the set overview → exercise loop → rest, and
  /// the cardio overview → continuous / structured runners. Every timer lives
  /// here so they survive rebuilds and sheet opens, and are cancelled on dispose.
  ///
  /// keepAlive: `beginSession`/`loadExecution` run on the readiness route, then
  /// the app navigates to the practice runner. An autoDispose provider would be
  /// torn down in the gap between the two routes, dropping the loaded session and
  /// bouncing the runner back to its standalone demo state. [reset] returns it to
  /// the empty state after a session ends.
  PracticeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'practiceProvider',
        isAutoDispose: false,
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

String _$practiceHash() => r'62cfedacab11181f5b858bb93d79afcf61b4f709';

/// Drives the whole practice flow: the set overview → exercise loop → rest, and
/// the cardio overview → continuous / structured runners. Every timer lives
/// here so they survive rebuilds and sheet opens, and are cancelled on dispose.
///
/// keepAlive: `beginSession`/`loadExecution` run on the readiness route, then
/// the app navigates to the practice runner. An autoDispose provider would be
/// torn down in the gap between the two routes, dropping the loaded session and
/// bouncing the runner back to its standalone demo state. [reset] returns it to
/// the empty state after a session ends.

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
