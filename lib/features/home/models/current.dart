import 'package:freezed_annotation/freezed_annotation.dart';

part 'current.freezed.dart';
part 'current.g.dart';

/// The "current actionable session" aggregate — `GET /api/v1/program/current`.
///
/// Peer contract: backend `.claude/memory/features/program/program.md`
/// (`PROGRAM-13`, `CurrentResponse`). Resolves any date to a schedule status and,
/// when today is a training day, the session to do; it always carries
/// [nextSession] so a rest day is still startable (user-centric — the hero never
/// dead-ends), and [progress] for the whole-program "X of M".
@freezed
sealed class Current with _$Current {
  const factory Current({
    required CurrentStatus status,
    required String date,
    int? weekNumber,
    int? dayNumber,
    required String? programRevisionId,
    // Today's session (only when status is training). A pointer, not the full
    // hydrated prescription list — the hero only needs a name + count to render,
    // and the runner re-fetches the session on start.
    required SessionSummary? session,
    // The next unlogged planned day, in week/day order. Present even on a rest
    // day so the user can train ahead. Null once every planned day is logged.
    required SessionSummary? nextSession,
    required int completed,
    required int total,
  }) = _Current;

  const Current._();

  factory Current.fromJson(Map<String, dynamic> json) {
    final progress = (json['progress'] as Map<String, dynamic>?) ?? const {};
    final session = json['session'] as Map<String, dynamic>?;
    final revId = json['programRevisionId'] as String?;
    return Current(
      status: _statusFromWire(json['status'] as String?),
      date: json['date'] as String? ?? '',
      weekNumber: (json['weekNumber'] as num?)?.toInt(),
      dayNumber: (json['dayNumber'] as num?)?.toInt(),
      programRevisionId: revId,
      // The wire `session` is a full PlannedSession; collapse it to the summary
      // the hero needs. `focus` is the display name, `prescriptions.length` the
      // exercise count. programRevisionId comes from the envelope, not the row.
      session: session == null
          ? null
          : SessionSummary(
              plannedSessionId: session['plannedSessionId'] as String? ?? '',
              programRevisionId: revId ?? '',
              name: session['focus'] as String? ?? '',
              exercises:
                  (session['prescriptions'] as List<dynamic>? ?? const []).length,
            ),
      nextSession: json['nextSession'] == null
          ? null
          : SessionSummary.fromJson(
              json['nextSession'] as Map<String, dynamic>,
            ),
      completed: (progress['completed'] as num?)?.toInt() ?? 0,
      total: (progress['total'] as num?)?.toInt() ?? 0,
    );
  }

  /// The session the hero should offer to start: today's when training, else the
  /// next unlogged one (rest day / before start), so the CTA is never dead.
  SessionSummary? get actionable => session ?? nextSession;
}

/// Schedule status for the resolved date. `unknown` guards against a wire value
/// this build does not know — treated as "no actionable session" by the UI.
enum CurrentStatus {
  training,
  rest,
  beforeStart,
  programComplete,
  noProgram,
  unknown,
}

CurrentStatus _statusFromWire(String? wire) => switch (wire) {
  'training' => CurrentStatus.training,
  'rest' => CurrentStatus.rest,
  'before_start' => CurrentStatus.beforeStart,
  'program_complete' => CurrentStatus.programComplete,
  'no_program' => CurrentStatus.noProgram,
  _ => CurrentStatus.unknown,
};

/// A pointer to a session the client can start without fetching the full program
/// (`POST /session/create` takes plannedSessionId + programRevisionId).
@freezed
sealed class SessionSummary with _$SessionSummary {
  const factory SessionSummary({
    required String plannedSessionId,
    required String programRevisionId,
    required String name,
    required int exercises,
  }) = _SessionSummary;

  factory SessionSummary.fromJson(Map<String, dynamic> json) => SessionSummary(
    plannedSessionId: json['plannedSessionId'] as String? ?? '',
    programRevisionId: json['programRevisionId'] as String? ?? '',
    name: json['name'] as String? ?? '',
    exercises: (json['exercises'] as num?)?.toInt() ?? 0,
  );
}
