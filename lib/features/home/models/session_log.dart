import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_log.freezed.dart';

/// One scheduled training day and whether it has been trained.
///
/// [date] is normalized to midnight — the log is day-granular, and comparing
/// raw `DateTime`s with a time component would make "same day" lookups miss.
@freezed
sealed class LoggedDay with _$LoggedDay {
  const factory LoggedDay({
    required DateTime date,
    required bool completed,
  }) = _LoggedDay;

  const LoggedDay._();

  /// Midnight of [date], the key form used throughout the log.
  DateTime get day => DateTime(date.year, date.month, date.day);
}

/// Every training day the user has been scheduled so far, oldest first.
///
/// Rest days are absent rather than present-and-incomplete: adherence is
/// "sessions done ÷ sessions due", so a rest day must not count as a miss.
@freezed
sealed class SessionLog with _$SessionLog {
  const factory SessionLog({
    required List<LoggedDay> days,

    /// Distinct sessions logged, which gates the Progress analysis. Kept
    /// separate from `days.length` because the baseline counts *comparable*
    /// sessions — the same movement pattern repeated — not calendar days.
    required int baselineSessions,
  }) = _SessionLog;

  const SessionLog._();

  /// Training days that have come due, i.e. today or earlier. A session
  /// scheduled for Friday is not a miss on Wednesday.
  List<LoggedDay> dueAsOf(DateTime now) {
    final today = DateTime(now.year, now.month, now.day);
    return days
        .where((d) => !d.day.isAfter(today))
        .toList(growable: false);
  }

  int completedAsOf(DateTime now) =>
      dueAsOf(now).where((d) => d.completed).length;

  /// Share of due sessions actually trained, 0..1. No due sessions reads as
  /// 100% — a user who has not been asked to train yet has not fallen behind.
  double adherenceAsOf(DateTime now) {
    final due = dueAsOf(now);
    if (due.isEmpty) return 1;
    return completedAsOf(now) / due.length;
  }

  /// Consecutive completed sessions counting back from the most recent due day.
  /// Breaks on the first missed due session.
  int streakAsOf(DateTime now) {
    var streak = 0;
    for (final day in dueAsOf(now).reversed) {
      if (!day.completed) break;
      streak++;
    }
    return streak;
  }

  /// The seven days of the calendar week containing [now], Monday-first, each
  /// paired with its log entry when that day is a training day.
  List<(DateTime, LoggedDay?)> weekOf(DateTime now) {
    final today = DateTime(now.year, now.month, now.day);
    final monday = today.subtract(Duration(days: today.weekday - 1));

    return [
      for (var i = 0; i < 7; i++)
        () {
          final date = DateTime(monday.year, monday.month, monday.day + i);
          // firstWhereOrNull without pulling in collection: the log is small.
          final matches = days.where((d) => d.day == date);
          return (date, matches.isEmpty ? null : matches.first);
        }(),
    ];
  }
}
