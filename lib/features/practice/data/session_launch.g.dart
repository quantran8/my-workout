// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_launch.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Holds the [SessionLaunch] between the home Start button and the readiness /
/// practice screens. keepAlive so it survives the navigation; set by the caller
/// that starts a session, read by the readiness gate.
///
/// Null when nothing is in flight — the practice screen then falls back to its
/// standalone demo state rather than trying to begin a session.

@ProviderFor(PendingSession)
final pendingSessionProvider = PendingSessionProvider._();

/// Holds the [SessionLaunch] between the home Start button and the readiness /
/// practice screens. keepAlive so it survives the navigation; set by the caller
/// that starts a session, read by the readiness gate.
///
/// Null when nothing is in flight — the practice screen then falls back to its
/// standalone demo state rather than trying to begin a session.
final class PendingSessionProvider
    extends $NotifierProvider<PendingSession, SessionLaunch?> {
  /// Holds the [SessionLaunch] between the home Start button and the readiness /
  /// practice screens. keepAlive so it survives the navigation; set by the caller
  /// that starts a session, read by the readiness gate.
  ///
  /// Null when nothing is in flight — the practice screen then falls back to its
  /// standalone demo state rather than trying to begin a session.
  PendingSessionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pendingSessionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pendingSessionHash();

  @$internal
  @override
  PendingSession create() => PendingSession();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SessionLaunch? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SessionLaunch?>(value),
    );
  }
}

String _$pendingSessionHash() => r'a4a39ab1a47179cc02cc00f462c8530aa91850e0';

/// Holds the [SessionLaunch] between the home Start button and the readiness /
/// practice screens. keepAlive so it survives the navigation; set by the caller
/// that starts a session, read by the readiness gate.
///
/// Null when nothing is in flight — the practice screen then falls back to its
/// standalone demo state rather than trying to begin a session.

abstract class _$PendingSession extends $Notifier<SessionLaunch?> {
  SessionLaunch? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<SessionLaunch?, SessionLaunch?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SessionLaunch?, SessionLaunch?>,
              SessionLaunch?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
