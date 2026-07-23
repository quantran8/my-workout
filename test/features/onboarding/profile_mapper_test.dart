import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/features/onboarding/data/profile_mapper.dart';
import 'package:mobile/features/onboarding/models/enums.dart';
import 'package:mobile/features/onboarding/models/onboarding_data.dart';

void main() {
  // Pinned so the derived `lastConsistentTrainingAt` is reproducible.
  final now = DateTime.utc(2026, 7, 23);

  test('maps a fully populated profile onto the backend wire shape', () {
    const data = OnboardingData(
      raw: RawInput(story: 'story', statedGoal: 'lose fat\nrun 5k'),
      constraint: Constraint(
        sex: Sex.female,
        age: 31,
        heightCm: 165,
        weightKg: 52,
        experienceLevel: ExperienceLevel.intermediate,
        recentActivityLevel: RecentActivityLevel.veryLow,
        detrainingGap: DetrainingGap.threeToTwelveMonths,
        hasInjury: true,
        injuries: [
          Injury(area: InjuryArea.lowerBack, severity: InjurySeverity.moderate, notes: 'n', active: true),
          Injury(area: InjuryArea.knee, severity: InjurySeverity.mild, active: false),
        ],
        mobilityLimits: {MobilityLimit.deepSquat, MobilityLimit.hipHinge},
        equipment: {Equipment.resistanceBand, Equipment.pullupBar},
        space: TrainingSpace.minimal,
        budgetWillingness: BudgetWillingness.invest,
        schedule: Schedule(preferredDays: {Weekday.mon, Weekday.thu}, minutesPerSession: 50),
        diet: Diet(type: DietType.pescatarian, allergies: ['peanut'], restrictions: ['halal']),
      ),
      target: Target(statedGoals: ['lose fat', 'run 5k']),
    );

    final json = ProfileMapper.profileToJson(data, now: now);
    // ignore: avoid_print
    print(const JsonEncoder.withIndent('  ').convert(json));

    final c = json['constraint'] as Map<String, dynamic>;
    // snake_case unions, not the app's camelCase enum names.
    expect((c['injuries'] as List).first['area'], 'lower_back');
    expect(c['mobilityLimits'], ['deep_squat', 'hip_hinge']);
    expect(c['equipment'], ['resistance_band', 'pullup_bar']);
    // hasInjury=true keeps both rows; status derives from `active`.
    expect((c['injuries'] as List).length, 2);
    expect((c['injuries'] as List)[1]['status'], 'historical');
    // daysPerWeek is derived from the selected days.
    expect((c['schedule'] as Map)['daysPerWeek'], 2);
    // The detraining trio, kept separate from experienceLevel per §1.2.
    expect(c['recentActivityLevel'], 'very_low');
    // 3-12 months maps to 13 weeks — the first band past the backend's
    // LONG_DETRAINING_WEEKS = 12 threshold.
    expect(c['detrainingDurationWeeks'], 13);
    expect(c['lastConsistentTrainingAt'], '2026-04-23');
    // target carries the arrays the backend's TargetDto requires.
    final t = json['target'] as Map<String, dynamic>;
    expect(t['statedGoals'], ['lose fat', 'run 5k']);
    expect(t['problems'], isEmpty);
    expect(t['inferredNeeds'], isEmpty);
  });

  test('sends null detraining fields while still training consistently', () {
    const data = OnboardingData(
      constraint: Constraint(detrainingGap: DetrainingGap.none),
    );
    final c = ProfileMapper.profileToJson(data, now: now)['constraint']
        as Map<String, dynamic>;
    // The backend reads a null/absent duration as "no detraining", so no
    // adaptation phase is triggered.
    expect(c['detrainingDurationWeeks'], isNull);
    expect(c['lastConsistentTrainingAt'], isNull);
  });

  test('only bands at or past 3 months cross the long-detraining threshold', () {
    int? weeksFor(DetrainingGap gap) =>
        const Constraint().copyWith(detrainingGap: gap).detrainingDurationWeeks;

    // The backend triggers LONG_DETRAINING at >= 12 weeks.
    expect(weeksFor(DetrainingGap.underMonth)! < 12, isTrue);
    expect(weeksFor(DetrainingGap.oneToThreeMonths)! < 12, isTrue);
    expect(weeksFor(DetrainingGap.threeToTwelveMonths)! >= 12, isTrue);
    expect(weeksFor(DetrainingGap.overYear)! >= 12, isTrue);
  });

  test('drops injuries entirely when the user answered "no"', () {
    const data = OnboardingData(
      constraint: Constraint(
        hasInjury: false,
        injuries: [Injury(area: InjuryArea.knee)],
      ),
    );
    final c = ProfileMapper.profileToJson(data, now: now)['constraint'] as Map<String, dynamic>;
    expect(c['injuries'], isEmpty);
  });
}
