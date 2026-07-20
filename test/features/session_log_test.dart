import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/features/home/data/session_log_controller.dart';
import 'package:mobile/features/home/models/progress_report.dart';
import 'package:mobile/features/home/models/session_log.dart';

/// Wednesday, mid-week, so "before/after today" cases are both reachable.
final _wednesday = DateTime(2026, 7, 22, 9, 41);

SessionLog _log(List<(DateTime, bool)> days, {int? baseline}) => SessionLog(
  days: [
    for (final (date, completed) in days)
      LoggedDay(date: date, completed: completed),
  ],
  baselineSessions: baseline ?? days.where((d) => d.$2).length,
);

DateTime _day(int day) => DateTime(2026, 7, day);

void main() {
  group('adherence', () {
    test('counts only sessions that have come due', () {
      // Mon done, Wed (today) open, Fri still ahead.
      final log = _log([
        (_day(20), true),
        (_day(22), false),
        (_day(24), false),
      ]);

      // Friday must not drag the ratio down before it arrives.
      expect(log.dueAsOf(_wednesday), hasLength(2));
      expect(log.adherenceAsOf(_wednesday), 0.5);
    });

    test('is 100% before any session is due', () {
      final log = _log([(_day(24), false)]);

      expect(log.adherenceAsOf(_wednesday), 1);
    });

    test('a rest day is absent, so it never reads as a miss', () {
      final log = _log([(_day(20), true), (_day(22), true)]);

      expect(log.adherenceAsOf(_wednesday), 1);
    });
  });

  group('streak', () {
    test('counts back from the latest due session', () {
      final log = _log([
        (_day(15), true),
        (_day(17), true),
        (_day(20), true),
        (_day(22), true),
      ]);

      expect(log.streakAsOf(_wednesday), 4);
    });

    test('breaks on a missed session', () {
      final log = _log([
        (_day(15), true),
        (_day(17), false), // missed
        (_day(20), true),
        (_day(22), true),
      ]);

      expect(log.streakAsOf(_wednesday), 2);
    });

    test('an open session today ends the streak at yesterday', () {
      final log = _log([(_day(20), true), (_day(22), false)]);

      expect(log.streakAsOf(_wednesday), 0);
    });
  });

  group('weekOf', () {
    test('returns seven Monday-first days aligned to the log', () {
      final log = _log([(_day(20), true), (_day(22), false)]);
      final week = log.weekOf(_wednesday);

      expect(week, hasLength(7));
      expect(week.first.$1, _day(20)); // Monday
      expect(week.last.$1, _day(26)); // Sunday
      expect(week[0].$2?.completed, isTrue);
      expect(week[1].$2, isNull, reason: 'Tuesday is a rest day');
      expect(week[2].$2?.completed, isFalse);
    });
  });

  group('completeToday', () {
    ProviderContainer containerAt(DateTime now) {
      final container = ProviderContainer(
        overrides: [nowProvider.overrideWithValue(now)],
      );
      addTearDown(container.dispose);
      return container;
    }

    test('marks today done and advances the baseline', () {
      final container = containerAt(_wednesday);
      final before = container.read(sessionLogControllerProvider);

      container.read(sessionLogControllerProvider.notifier).completeToday();
      final after = container.read(sessionLogControllerProvider);

      expect(after.completedAsOf(_wednesday), before.completedAsOf(_wednesday) + 1);
      expect(after.baselineSessions, before.baselineSessions + 1);
      expect(after.adherenceAsOf(_wednesday), 1);
    });

    test('is idempotent, so a double tap cannot inflate the streak', () {
      final container = containerAt(_wednesday);
      final notifier = container.read(sessionLogControllerProvider.notifier);

      notifier.completeToday();
      final once = container.read(sessionLogControllerProvider);
      notifier.completeToday();
      final twice = container.read(sessionLogControllerProvider);

      expect(twice.baselineSessions, once.baselineSessions);
      expect(twice.streakAsOf(_wednesday), once.streakAsOf(_wednesday));
    });

    test('does nothing on a rest day', () {
      // Tuesday: the seeded plan trains Mon/Wed/Fri.
      final container = containerAt(DateTime(2026, 7, 21, 9));
      final notifier = container.read(sessionLogControllerProvider.notifier);

      expect(notifier.hasPendingToday, isFalse);
      notifier.completeToday();

      expect(
        container.read(sessionLogControllerProvider).baselineSessions,
        1,
        reason: 'only Monday is trained by Tuesday',
      );
    });
  });

  group('ProgressReport', () {
    test('withholds any trend below the baseline', () {
      final report = ProgressReport.from(2);

      expect(report.hasBaseline, isFalse);
      expect(report.verdict, ProgressVerdict.insufficient);
      expect(report.strength.trend, TrendDirection.insufficient);
      expect(report.confidence, ProgressConfidence.low);
    });

    test('claims an early signal at the baseline, still low confidence', () {
      final report = ProgressReport.from(kProgressBaseline);

      expect(report.verdict, ProgressVerdict.earlySignal);
      expect(report.strength.trend, TrendDirection.rising);
      // Endurance needs more data than strength — it must not jump early.
      expect(report.endurance.trend, TrendDirection.insufficient);
      expect(report.confidence, ProgressConfidence.low);
    });

    test('a confident verdict never sits over insufficient domains', () {
      final report = ProgressReport.from(kProgressConfidentBaseline);

      expect(report.verdict, ProgressVerdict.progressing);
      expect(report.confidence, ProgressConfidence.medium);
      expect(report.strength.trend, isNot(TrendDirection.insufficient));
      expect(report.endurance.trend, isNot(TrendDirection.insufficient));
    });
  });
}
