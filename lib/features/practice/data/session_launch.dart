import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'session_launch.g.dart';

/// The session the user is about to start, set just before navigating to the
/// readiness gate. Carries only the ids `POST /session/create` needs — the
/// program revision and (optionally) the planned day.
///
/// A free workout (no plan) is a valid session server-side (`SESSION-10`), but
/// the client always launches from a planned day today, so [plannedSessionId]
/// is populated in practice.
class SessionLaunch {
  const SessionLaunch({
    required this.programRevisionId,
    this.plannedSessionId,
    required this.name,
  });

  final String programRevisionId;
  final String? plannedSessionId;

  /// The planned-day focus, shown while the session is being prepared.
  final String name;
}

/// Holds the [SessionLaunch] between the home Start button and the readiness /
/// practice screens. keepAlive so it survives the navigation; set by the caller
/// that starts a session, read by the readiness gate.
///
/// Null when nothing is in flight — the practice screen then falls back to its
/// standalone demo state rather than trying to begin a session.
@Riverpod(keepAlive: true)
class PendingSession extends _$PendingSession {
  @override
  SessionLaunch? build() => null;

  /// Arm the flow with the session to start, then the caller navigates to the
  /// readiness route.
  void set(SessionLaunch launch) => state = launch;

  /// Clear once the session has been created (or the flow abandoned), so a stale
  /// launch cannot be reused on a later, unrelated navigation.
  void clear() => state = null;
}
