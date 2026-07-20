import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/session_log.dart';

part 'session_log_controller.g.dart';

/// "Now" as a provider so the home screen's date-dependent state (which day is
/// today, which sessions are due) can be pinned in tests instead of drifting
/// with the wall clock.
@Riverpod(keepAlive: true)
DateTime now(Ref ref) => DateTime.now();

/// The user's training history.
///
/// In-memory only, mirroring [MockPlanRepository]: the demo needs a log that
/// already looks lived-in, and the persistence seam belongs with the real
/// backend rather than a `shared_preferences` layer this app has nowhere else.
@Riverpod(keepAlive: true)
class SessionLogController extends _$SessionLogController {
  @override
  SessionLog build() => _seed(ref.watch(nowProvider));

  /// Marks today's due session complete. A no-op when today is a rest day or
  /// the session is already logged, so a double tap can't inflate the streak.
  void completeToday() {
    final today = _midnight(ref.read(nowProvider));

    final index = state.days.indexWhere((d) => d.day == today);
    if (index < 0 || state.days[index].completed) return;

    final days = [...state.days];
    days[index] = days[index].copyWith(completed: true);

    state = state.copyWith(
      days: days,
      baselineSessions: state.baselineSessions + 1,
    );
  }

  /// Whether today is a scheduled training day that has not been logged yet —
  /// the condition for the hero CTA being actionable.
  bool get hasPendingToday {
    final today = _midnight(ref.read(nowProvider));
    return state.days.any((d) => d.day == today && !d.completed);
  }
}

DateTime _midnight(DateTime value) =>
    DateTime(value.year, value.month, value.day);

/// A demo history ending at "day 6": two sessions trained, a third due today.
///
/// Built relative to [now] rather than hard-coded dates so the week strip and
/// the "today" marker line up whenever the app is opened.
SessionLog _seed(DateTime now) {
  final today = _midnight(now);
  final monday = today.subtract(Duration(days: today.weekday - 1));

  DateTime at(int offsetFromMonday) => DateTime(
    monday.year,
    monday.month,
    monday.day + offsetFromMonday,
  );

  // Mon/Wed/Fri, the mock plan's default cadence. Past days are trained; the
  // next one on or after today is left open for the user to complete.
  final scheduled = [at(0), at(2), at(4)];

  return SessionLog(
    days: [
      for (final date in scheduled)
        LoggedDay(date: date, completed: date.isBefore(today)),
    ],
    baselineSessions: scheduled.where((d) => d.isBefore(today)).length,
  );
}
