import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/features/home/data/access_controller.dart';
import 'package:mobile/features/home/models/dashboard.dart';

/// A full `GET /dashboard` payload as the backend serializes it — snake/lower
/// wire values, day-granular dates. Mirrors `DashboardResponse`.
Map<String, dynamic> _payload() => {
  'sessionLog': {
    'days': [
      {'date': '2026-07-20', 'completed': true},
      {'date': '2026-07-22', 'completed': true},
      {'date': '2026-07-24', 'completed': false},
    ],
    'baselineSessions': 4,
  },
  'streak': 3,
  'adherence': 0.8,
  'due': 5,
  'done': 4,
  'accessTier': 'paid',
  'nextSession': {
    'plannedSessionId': 'ps-1',
    'programRevisionId': 'rev-1',
    'name': 'Lower body',
    'durationMin': 50,
    'exercises': 6,
  },
  'recent': {
    'sessionId': 's-1',
    'name': 'Upper body',
    'volumeKg': 1200,
    'exercises': 5,
    'completedAt': '2026-07-22T10:30:00.000Z',
  },
};

void main() {
  group('Dashboard.fromJson', () {
    test('parses the server-computed metrics as-is', () {
      final d = Dashboard.fromJson(_payload());

      expect(d.streak, 3);
      expect(d.adherence, 0.8);
      expect(d.due, 5);
      expect(d.done, 4);
      expect(d.accessTier, AccessTier.paid);
    });

    test('maps the day rows into a SessionLog, oldest first', () {
      final d = Dashboard.fromJson(_payload());

      expect(d.sessionLog.days, hasLength(3));
      expect(d.sessionLog.days.first.date, DateTime(2026, 7, 20));
      expect(d.sessionLog.days.first.completed, isTrue);
      expect(d.sessionLog.days.last.completed, isFalse);
      expect(d.sessionLog.baselineSessions, 4);
    });

    test('parses next session including the program revision id', () {
      final next = Dashboard.fromJson(_payload()).nextSession!;

      expect(next.plannedSessionId, 'ps-1');
      expect(next.programRevisionId, 'rev-1');
      expect(next.name, 'Lower body');
      expect(next.durationMin, 50);
      expect(next.exercises, 6);
    });

    test('parses recent session volume and exercise count', () {
      final recent = Dashboard.fromJson(_payload()).recent!;

      expect(recent.name, 'Upper body');
      expect(recent.volumeKg, 1200);
      expect(recent.exercises, 5);
      expect(recent.completedAt, DateTime.utc(2026, 7, 22, 10, 30));
    });

    test('an unknown or missing tier is the safe default (free)', () {
      final payload = _payload()..['accessTier'] = 'enterprise';
      expect(Dashboard.fromJson(payload).accessTier, AccessTier.free);

      final missing = _payload()..remove('accessTier');
      expect(Dashboard.fromJson(missing).accessTier, AccessTier.free);
    });

    test('nextSession and recent are null when absent', () {
      final payload = _payload()
        ..['nextSession'] = null
        ..['recent'] = null;
      final d = Dashboard.fromJson(payload);

      expect(d.nextSession, isNull);
      expect(d.recent, isNull);
    });

    test('empty session log parses to zero baseline and no days', () {
      final payload = _payload()
        ..['sessionLog'] = {'days': <dynamic>[], 'baselineSessions': 0};
      final d = Dashboard.fromJson(payload);

      expect(d.sessionLog.days, isEmpty);
      expect(d.sessionLog.baselineSessions, 0);
    });
  });
}
