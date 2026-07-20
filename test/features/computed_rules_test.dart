import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/features/onboarding/models/computed_rules.dart';
import 'package:mobile/features/onboarding/models/enums.dart';
import 'package:mobile/features/onboarding/models/onboarding_data.dart';

OnboardingData _data({
  double heightCm = 172,
  double weightKg = 49,
  ExperienceLevel experience = ExperienceLevel.beginner,
  bool hasInjury = false,
  List<Injury> injuries = const [],
  Set<MobilityLimit> mobility = const {},
  Set<Equipment> equipment = const {},
  Set<Weekday> days = const {Weekday.mon, Weekday.wed, Weekday.fri},
}) {
  return OnboardingData(
    constraint: Constraint(
      heightCm: heightCm,
      weightKg: weightKg,
      experienceLevel: experience,
      hasInjury: hasInjury,
      injuries: injuries,
      mobilityLimits: mobility,
      equipment: equipment,
      schedule: Schedule(preferredDays: days),
    ),
  );
}

void main() {
  group('BMI', () {
    test('uses WHO cutoffs', () {
      // 18.5 / 25 / 30 boundaries.
      expect(computeRules(_data(heightCm: 100, weightKg: 18)).band,
          BmiBand.underweight);
      expect(computeRules(_data(heightCm: 100, weightKg: 20)).band,
          BmiBand.normal);
      expect(computeRules(_data(heightCm: 100, weightKg: 27)).band,
          BmiBand.overweight);
      expect(computeRules(_data(heightCm: 100, weightKg: 31)).band,
          BmiBand.obese);
    });

    test('the prototype sample profile is underweight', () {
      // 49 kg / 172 cm ~ 16.6 — the branch the default walkthrough exercises.
      final rules = computeRules(_data());
      expect(rules.bmi, closeTo(16.6, 0.1));
      expect(rules.band, BmiBand.underweight);
      expect(rules.safetyFlags, contains(SafetyFlag.underweight));
    });

    test('is null when height is missing', () {
      expect(computeRules(_data(heightCm: 0)).bmi, isNull);
      expect(computeRules(_data(heightCm: 0)).band, isNull);
    });
  });

  group('injuries', () {
    test('an inactive injury raises no flag', () {
      final rules = computeRules(
        _data(
          hasInjury: true,
          injuries: const [Injury(area: InjuryArea.knee, active: false)],
        ),
      );
      expect(rules.safetyFlags, isNot(contains(SafetyFlag.activeInjury)));
      expect(rules.contraindicated, isEmpty);
    });

    test('injuries are ignored entirely when hasInjury is false', () {
      // Toggling "Có" -> "Không" on screen 5 must neutralise stale rows.
      final rules = computeRules(
        _data(
          hasInjury: false,
          injuries: const [Injury(area: InjuryArea.knee, active: true)],
        ),
      );
      expect(rules.safetyFlags, isNot(contains(SafetyFlag.activeInjury)));
      expect(rules.contraindicated, isEmpty);
    });

    test('an active knee injury blocks squat, lunge, running and jumping', () {
      final rules = computeRules(
        _data(
          hasInjury: true,
          injuries: const [Injury(area: InjuryArea.knee, active: true)],
        ),
      );
      expect(rules.safetyFlags, contains(SafetyFlag.activeInjury));
      expect(
        rules.contraindicated,
        containsAll([
          MovementPattern.deepSquat,
          MovementPattern.lunge,
          MovementPattern.running,
          MovementPattern.jumping,
        ]),
      );
    });

    test('multiple injuries union their contraindications', () {
      final rules = computeRules(
        _data(
          hasInjury: true,
          injuries: const [
            Injury(area: InjuryArea.knee, active: true),
            Injury(area: InjuryArea.shoulder, active: true),
          ],
        ),
      );
      expect(
        rules.contraindicated,
        containsAll([MovementPattern.deepSquat, MovementPattern.overheadPress]),
      );
    });
  });

  group('volume cap', () {
    test('scales with experience', () {
      expect(computeRules(_data()).weeklySetCap, 10);
      expect(
        computeRules(_data(experience: ExperienceLevel.intermediate))
            .weeklySetCap,
        16,
      );
      expect(
        computeRules(_data(experience: ExperienceLevel.advanced)).weeklySetCap,
        22,
      );
    });

    test('an active injury reduces it', () {
      final rules = computeRules(
        _data(
          experience: ExperienceLevel.intermediate,
          hasInjury: true,
          injuries: const [Injury(area: InjuryArea.knee, active: true)],
        ),
      );
      expect(rules.weeklySetCap, lessThan(16));
    });

    test('a severe active injury reduces it further', () {
      final moderate = computeRules(
        _data(
          experience: ExperienceLevel.advanced,
          hasInjury: true,
          injuries: const [
            Injury(area: InjuryArea.knee, active: true),
          ],
        ),
      );
      final severe = computeRules(
        _data(
          experience: ExperienceLevel.advanced,
          hasInjury: true,
          injuries: const [
            Injury(
              area: InjuryArea.knee,
              severity: InjurySeverity.severe,
              active: true,
            ),
          ],
        ),
      );
      expect(severe.weeklySetCap, lessThan(moderate.weeklySetCap));
    });
  });

  group('days per week', () {
    test('a beginner is capped at three even when offering more', () {
      final rules = computeRules(
        _data(
          days: {
            Weekday.mon,
            Weekday.tue,
            Weekday.wed,
            Weekday.thu,
            Weekday.fri,
          },
        ),
      );
      expect(rules.recommendedDaysPerWeek, 3);
    });

    test('offering fewer days than the cap is respected', () {
      final rules = computeRules(_data(days: {Weekday.mon, Weekday.thu}));
      expect(rules.recommendedDaysPerWeek, 2);
    });

    test('no days selected yields zero', () {
      expect(computeRules(_data(days: {})).recommendedDaysPerWeek, 0);
    });
  });

  group('mobility and equipment', () {
    test('mobility limits contribute contraindications and a flag', () {
      final rules = computeRules(
        _data(mobility: {MobilityLimit.overhead, MobilityLimit.hipHinge}),
      );
      expect(rules.safetyFlags, contains(SafetyFlag.lowMobility));
      expect(
        rules.contraindicated,
        containsAll([
          MovementPattern.overheadPress,
          MovementPattern.deadlift,
          MovementPattern.goodMorning,
        ]),
      );
    });

    test('having equipment clears the no-equipment flag', () {
      expect(
        computeRules(_data()).safetyFlags,
        contains(SafetyFlag.noEquipment),
      );
      expect(
        computeRules(_data(equipment: {Equipment.dumbbell})).safetyFlags,
        isNot(contains(SafetyFlag.noEquipment)),
      );
    });
  });

  group('derived model getters', () {
    test('Schedule.daysPerWeek follows the selected set', () {
      const schedule = Schedule(preferredDays: {Weekday.mon, Weekday.fri});
      expect(schedule.daysPerWeek, 2);
    });

    test('goalLines splits and trims, dropping blanks', () {
      const data = OnboardingData(
        raw: RawInput(statedGoal: 'One\n\n  Two  \n'),
      );
      expect(data.goalLines, ['One', 'Two']);
    });
  });
}
