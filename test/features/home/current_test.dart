import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/features/home/models/current.dart';

void main() {
  group('Current.fromJson', () {
    test('training day collapses the session and reads progress', () {
      final c = Current.fromJson({
        'status': 'training',
        'date': '2026-07-24',
        'weekNumber': 1,
        'dayNumber': 3,
        'programRevisionId': 'rev-1',
        'session': {
          'plannedSessionId': 'ps-1',
          'focus': 'Full Body Workout',
          'prescriptions': [
            {'x': 1},
            {'x': 2},
          ],
        },
        'nextSession': {
          'plannedSessionId': 'ps-1',
          'programRevisionId': 'rev-1',
          'name': 'Full Body Workout',
          'exercises': 2,
        },
        'progress': {'completed': 0, 'total': 7},
      });

      expect(c.status, CurrentStatus.training);
      expect(c.session?.name, 'Full Body Workout');
      expect(c.session?.exercises, 2); // from prescriptions.length
      expect(c.session?.programRevisionId, 'rev-1'); // from envelope
      expect(c.completed, 0);
      expect(c.total, 7);
      // Actionable prefers today's session.
      expect(c.actionable?.plannedSessionId, 'ps-1');
    });

    test('rest day has no session but keeps nextSession as actionable', () {
      final c = Current.fromJson({
        'status': 'rest',
        'date': '2026-07-25',
        'programRevisionId': 'rev-1',
        'session': null,
        'nextSession': {
          'plannedSessionId': 'ps-next',
          'programRevisionId': 'rev-1',
          'name': 'Pull Day',
          'exercises': 4,
        },
        'progress': {'completed': 3, 'total': 7},
      });

      expect(c.status, CurrentStatus.rest);
      expect(c.session, isNull);
      expect(c.actionable?.name, 'Pull Day'); // falls through to nextSession
    });

    test('unknown status maps to CurrentStatus.unknown', () {
      final c = Current.fromJson({
        'status': 'something_new',
        'date': '2026-07-25',
        'programRevisionId': null,
        'session': null,
        'nextSession': null,
        'progress': {'completed': 0, 'total': 0},
      });
      expect(c.status, CurrentStatus.unknown);
      expect(c.actionable, isNull);
    });

    test('no_program parses to zero progress and no actionable', () {
      final c = Current.fromJson({
        'status': 'no_program',
        'date': '2026-07-25',
        'progress': {'completed': 0, 'total': 0},
      });
      expect(c.status, CurrentStatus.noProgram);
      expect(c.actionable, isNull);
      expect(c.total, 0);
    });
  });
}
