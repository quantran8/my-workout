import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/access_controller.dart' show AccessTier;
import 'session_log.dart';

part 'dashboard.freezed.dart';
part 'dashboard.g.dart';

/// The Home screen's server-computed aggregate — `GET /api/v1/dashboard`.
///
/// The backend is the source of truth for the derived numbers ([streak],
/// [adherence], [due], [done]): they are computed server-side and rendered
/// as-is, not recomputed from [SessionLog] here. [SessionLog] is still built
/// from [days]/[baselineSessions] so the week strip and the "next/recent"
/// fallbacks keep working, but the headline metrics come off this object.
///
/// Peer contract: backend `.claude/memory/features/dashboard/dashboard.md`
/// (`DashboardResponse`). Field names and the `free`/`paid` tier vocabulary are
/// in lockstep with it.
@freezed
sealed class Dashboard with _$Dashboard {
  const factory Dashboard({
    required SessionLog sessionLog,
    required int streak,
    required double adherence,
    required int due,
    required int done,
    // Whole-program "X of M sessions": completed planned days out of the plan's
    // total (durationWeeks × training-days/week). Distinct from [due]/[adherence]
    // (a reach-based window). Peer: backend DASHBOARD-7 / PROGRAM-14.
    required ProgramProgress programProgress,
    required AccessTier accessTier,
    required DashboardNextSession? nextSession,
    required DashboardRecentSession? recent,
  }) = _Dashboard;

  const Dashboard._();

  factory Dashboard.fromJson(Map<String, dynamic> json) {
    final log = json['sessionLog'] as Map<String, dynamic>;
    return Dashboard(
      sessionLog: SessionLog(
        days: [
          for (final day in (log['days'] as List<dynamic>? ?? const []))
            _dayFromJson(day as Map<String, dynamic>),
        ],
        baselineSessions: (log['baselineSessions'] as num?)?.toInt() ?? 0,
      ),
      streak: (json['streak'] as num?)?.toInt() ?? 0,
      adherence: (json['adherence'] as num?)?.toDouble() ?? 1,
      due: (json['due'] as num?)?.toInt() ?? 0,
      done: (json['done'] as num?)?.toInt() ?? 0,
      programProgress: ProgramProgress.fromJson(
        (json['programProgress'] as Map<String, dynamic>?) ?? const {},
      ),
      accessTier: _tierFromWire(json['accessTier'] as String?),
      nextSession: json['nextSession'] == null
          ? null
          : DashboardNextSession.fromJson(
              json['nextSession'] as Map<String, dynamic>,
            ),
      recent: json['recent'] == null
          ? null
          : DashboardRecentSession.fromJson(
              json['recent'] as Map<String, dynamic>,
            ),
    );
  }
}

/// `SessionLog`/`LoggedDay` have no `fromJson` of their own (they are pure
/// freezed with computed methods), so the day rows are mapped here. `date` is
/// the backend's day-granular `YYYY-MM-DD`.
LoggedDay _dayFromJson(Map<String, dynamic> json) => LoggedDay(
  date: DateTime.parse(json['date'] as String),
  completed: json['completed'] as bool? ?? false,
);

/// Wire tier is lower-case (`free`/`paid`); an unknown or missing value is the
/// safe default (`free`) so a stray value never unlocks paid surfaces.
AccessTier _tierFromWire(String? wire) =>
    wire == 'paid' ? AccessTier.paid : AccessTier.free;

/// Whole-program progress: how many planned sessions are done out of the plan's
/// total. `total` is 0 when there is no active program (or a legacy program with
/// no training days) — callers hide the indicator rather than showing "X of 0".
@freezed
sealed class ProgramProgress with _$ProgramProgress {
  const factory ProgramProgress({
    required int completed,
    required int total,
  }) = _ProgramProgress;

  factory ProgramProgress.fromJson(Map<String, dynamic> json) => ProgramProgress(
    completed: (json['completed'] as num?)?.toInt() ?? 0,
    total: (json['total'] as num?)?.toInt() ?? 0,
  );
}

/// The hero card's "do this next" session. Null once every planned day is done.
@freezed
sealed class DashboardNextSession with _$DashboardNextSession {
  const factory DashboardNextSession({
    required String plannedSessionId,
    // The active revision the planned day belongs to — needed to start the
    // session (`POST /session/create` takes programRevisionId) without a second
    // call to the program endpoint.
    required String programRevisionId,
    required String name,
    required int durationMin,
    required int exercises,
  }) = _DashboardNextSession;

  factory DashboardNextSession.fromJson(Map<String, dynamic> json) =>
      _$DashboardNextSessionFromJson(json);
}

/// The most recently completed session, for the Recent row. Null before the
/// first one. [volumeKg] is Σ(weight × reps) computed server-side.
@freezed
sealed class DashboardRecentSession with _$DashboardRecentSession {
  const factory DashboardRecentSession({
    required String sessionId,
    required String name,
    required int volumeKg,
    required int exercises,
    required DateTime completedAt,
  }) = _DashboardRecentSession;

  factory DashboardRecentSession.fromJson(Map<String, dynamic> json) =>
      _$DashboardRecentSessionFromJson(json);
}
