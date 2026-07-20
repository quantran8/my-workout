// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_log_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// "Now" as a provider so the home screen's date-dependent state (which day is
/// today, which sessions are due) can be pinned in tests instead of drifting
/// with the wall clock.

@ProviderFor(now)
final nowProvider = NowProvider._();

/// "Now" as a provider so the home screen's date-dependent state (which day is
/// today, which sessions are due) can be pinned in tests instead of drifting
/// with the wall clock.

final class NowProvider
    extends $FunctionalProvider<DateTime, DateTime, DateTime>
    with $Provider<DateTime> {
  /// "Now" as a provider so the home screen's date-dependent state (which day is
  /// today, which sessions are due) can be pinned in tests instead of drifting
  /// with the wall clock.
  NowProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'nowProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$nowHash();

  @$internal
  @override
  $ProviderElement<DateTime> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DateTime create(Ref ref) {
    return now(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DateTime value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DateTime>(value),
    );
  }
}

String _$nowHash() => r'6ce0b0f491f51ecbcb4c9775ab2b7eab5f0d9d39';

/// The user's training history.
///
/// In-memory only, mirroring [MockPlanRepository]: the demo needs a log that
/// already looks lived-in, and the persistence seam belongs with the real
/// backend rather than a `shared_preferences` layer this app has nowhere else.

@ProviderFor(SessionLogController)
final sessionLogControllerProvider = SessionLogControllerProvider._();

/// The user's training history.
///
/// In-memory only, mirroring [MockPlanRepository]: the demo needs a log that
/// already looks lived-in, and the persistence seam belongs with the real
/// backend rather than a `shared_preferences` layer this app has nowhere else.
final class SessionLogControllerProvider
    extends $NotifierProvider<SessionLogController, SessionLog> {
  /// The user's training history.
  ///
  /// In-memory only, mirroring [MockPlanRepository]: the demo needs a log that
  /// already looks lived-in, and the persistence seam belongs with the real
  /// backend rather than a `shared_preferences` layer this app has nowhere else.
  SessionLogControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sessionLogControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sessionLogControllerHash();

  @$internal
  @override
  SessionLogController create() => SessionLogController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SessionLog value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SessionLog>(value),
    );
  }
}

String _$sessionLogControllerHash() =>
    r'a7d76ebc739eb4852b624f2d81d54404b76781cb';

/// The user's training history.
///
/// In-memory only, mirroring [MockPlanRepository]: the demo needs a log that
/// already looks lived-in, and the persistence seam belongs with the real
/// backend rather than a `shared_preferences` layer this app has nowhere else.

abstract class _$SessionLogController extends $Notifier<SessionLog> {
  SessionLog build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<SessionLog, SessionLog>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SessionLog, SessionLog>,
              SessionLog,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
