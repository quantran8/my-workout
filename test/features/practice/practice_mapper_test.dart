import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/features/practice/data/practice_mapper.dart';
import 'package:mobile/features/practice/models/session_models.dart';
import 'package:mobile/features/practice/presentation/widgets/practice_feedback_sheet.dart';

void main() {
  group('feedback', () {
    test('emits the backend snake_case union, not Dart enum names', () {
      // RecordFeedbackDto validates with @IsIn(['too_easy','too_hard',
      // 'uncomfortable','pain_stop','ok']) — camelCase would be rejected.
      expect(PracticeMapper.feedbackType(PracticeFeedback.easy), 'too_easy');
      expect(PracticeMapper.feedbackType(PracticeFeedback.hard), 'too_hard');
      expect(PracticeMapper.feedbackType(PracticeFeedback.pain), 'pain_stop');
      expect(
        PracticeMapper.feedbackType(PracticeFeedback.uncomfortable),
        'uncomfortable',
      );
      expect(PracticeMapper.feedbackType(PracticeFeedback.ok), 'ok');
    });

    test('pain is not a set-level flag', () {
      // pain_stop is an event, not a LoggedSet.feedbackFlag; sending it as a
      // flag would fail the set DTO's narrower union.
      expect(PracticeMapper.setFeedbackFlag(PracticeFeedback.pain), isNull);
      expect(PracticeMapper.setFeedbackFlag(PracticeFeedback.easy), 'too_easy');
    });
  });

  test('body areas are snake_case, matching InjuryArea', () {
    expect(PracticeMapper.bodyArea(BodyArea.lowerBack), 'lower_back');
    expect(PracticeMapper.bodyArea(BodyArea.upperBack), 'upper_back');
    expect(PracticeMapper.bodyArea(BodyArea.knee), 'knee');
  });

  test('distance source is snake_case', () {
    expect(
      PracticeMapper.distanceSource(DistanceSource.smartTrainer),
      'smart_trainer',
    );
    expect(
      PracticeMapper.distanceSource(DistanceSource.machineManual),
      'machine_manual',
    );
  });

  group('readiness payload', () {
    test('serializes into the shape SubmitReadinessDto expects', () {
      const answers = ReadinessAnswers(
        discomforts: [
          ReportedDiscomfort(
            area: BodyArea.lowerBack,
            severity: DiscomfortSeverity.moderate,
            affectsNormalMovement: true,
          ),
        ],
        residualSoreness: ResidualSoreness.high,
        energyLevel: EnergyLevel.low,
        poorSleep: true,
      );

      final json = answers.toJson();
      expect(json['answered'], isTrue);
      expect(json['residualSoreness'], 'high');
      expect(json['energyLevel'], 'low');

      final discomfort = (json['discomforts'] as List).single as Map;
      expect(discomfort['bodyArea'], 'lower_back');
      expect(discomfort['severity'], 'moderate');
      // The field that escalates the verdict to `hold`.
      expect(discomfort['affectsNormalMovement'], isTrue);

      expect((json['externalLoads'] as Map)['poorSleep'], isTrue);
      expect((json['externalLoads'] as Map)['illness'], isFalse);
    });

    test('skipping sends answered:false, the conservative branch', () {
      const answers = ReadinessAnswers.skipped();
      expect(answers.toJson()['answered'], isFalse);
      expect(answers.toJson()['discomforts'], isEmpty);
    });
  });

  group('EffectiveRx', () {
    test('reads targetReps as either an int or a [min,max] range', () {
      const single = EffectiveRx(targetSets: 3, rawTargetReps: 12);
      expect(single.targetReps, 12);
      expect(single.repsLabel, '12');

      const range = EffectiveRx(targetSets: 3, rawTargetReps: [8, 12]);
      // The lower bound is the conservative read for a rep target.
      expect(range.targetReps, 8);
      expect(range.repsLabel, '8-12');
    });

    test('a duration with no reps is a timed hold', () {
      const timed = EffectiveRx(targetSets: 3, targetDurationSec: 45);
      expect(timed.isTimed, isTrue);
      expect(timed.repsLabel, isNull);

      const counted = EffectiveRx(targetSets: 3, rawTargetReps: 10);
      expect(counted.isTimed, isFalse);
    });
  });

  group('ExecutionItem', () {
    test('only planned items are performed', () {
      const planned = ExecutionItem(
        id: 'a',
        exerciseId: 'e1',
        order: 0,
        effectiveRx: EffectiveRx(),
      );
      const held = ExecutionItem(
        id: 'b',
        exerciseId: 'e2',
        order: 1,
        effectiveRx: EffectiveRx(),
        status: ExecutionItemStatus.held,
      );
      expect(planned.isPerformed, isTrue);
      // A held item is shown for context but must never be entered.
      expect(held.isPerformed, isFalse);
    });

    test('parses the hydrated exercise the backend joins in', () {
      final item = ExecutionItem.fromJson({
        'id': 'x',
        'exerciseId': 'e1',
        'order': 0,
        'effectiveRx': {'targetSets': 3, 'targetReps': 10, 'restSec': 90},
        'status': 'planned',
        'exercise': {
          'id': 'e1',
          'slug': 'Barbell_Squat',
          'name': 'Barbell Squat',
          'primaryMuscles': ['quads', 'glutes'],
          'instructions': ['Stand tall', 'Sit back'],
        },
      });

      expect(item.displayName, 'Barbell Squat');
      expect(item.exercise?.targetSummary, 'quads, glutes');
      expect(item.effectiveRx.restSec, 90);
    });

    test('falls back to the id when hydration found nothing', () {
      const bare = ExecutionItem(
        id: 'x',
        exerciseId: 'e-unknown',
        order: 0,
        effectiveRx: EffectiveRx(),
      );
      expect(bare.displayName, 'e-unknown');
    });
  });

  group('interval blocks', () {
    test('parses the structured cardio steps', () {
      final item = ExecutionItem.fromJson({
        'id': 'x',
        'exerciseId': 'e1',
        'order': 0,
        'effectiveRx': {'targetSets': 1, 'restSec': 0},
        'blocks': [
          {'order': 1, 'phase': 'warmup', 'durationSec': 300, 'instruction': 'Đi bộ nhanh'},
          {'order': 2, 'phase': 'work', 'durationSec': 180, 'instruction': 'Chạy nhanh'},
          {'order': 3, 'phase': 'recovery', 'durationSec': 120, 'instruction': 'Hồi sức'},
        ],
      });

      expect(item.isStructured, isTrue);
      expect(item.blocks.map((b) => b.phase), [
        BlockPhase.warmup,
        BlockPhase.work,
        BlockPhase.recovery,
      ]);
      // flex weights the segmented progress bar by minutes.
      expect(item.blocks.first.flex, 5);
    });

    test('a prescription without blocks is not structured', () {
      const plain = ExecutionItem(
        id: 'x',
        exerciseId: 'e1',
        order: 0,
        effectiveRx: EffectiveRx(),
      );
      expect(plain.isStructured, isFalse);
    });

    test('a distance-bounded block still gets a usable flex', () {
      const block = CardioBlock(order: 1, distanceM: 400);
      // No duration to weight by — falls back rather than collapsing to zero.
      expect(block.flex, greaterThan(0));
    });
  });

  test('a hold verdict blocks the session and surfaces its reasons', () {
    final result = ReadinessResult.fromJson({
      'verdict': 'hold',
      'modifications': [
        {'code': 'hold_session', 'scope': 'session', 'reason': 'Đang đau nhiều'},
      ],
      'ruleVersion': 'readiness/v4.0',
    });
    expect(result.blocksSession, isTrue);
    expect(result.reasons, ['Đang đau nhiều']);
  });
}
