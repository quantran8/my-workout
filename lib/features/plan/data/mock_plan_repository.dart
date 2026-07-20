import '../../onboarding/models/computed_rules.dart';
import '../../onboarding/models/enums.dart';
import '../../onboarding/models/onboarding_data.dart';
import '../models/plan_text.dart';
import '../models/workout_plan.dart';
import 'plan_repository.dart';

/// Builds a sample plan from the user's actual answers.
///
/// Not a hardcoded blob: session count follows the schedule, calories follow
/// body weight and BMI band, and exercises are filtered against
/// [ComputedRules.contraindicated] — so the demo responds to what was entered.
/// All copy is returned as [PlanText.key] so both locales render correctly.
class MockPlanRepository implements PlanRepository {
  const MockPlanRepository({this.delay = const Duration(milliseconds: 2600)});

  /// Long enough for screen 9's four stage checks to play through.
  final Duration delay;

  @override
  Future<WorkoutPlan> generatePlan(
    OnboardingData data,
    ComputedRules rules,
  ) async {
    await Future<void>.delayed(delay);

    final c = data.constraint;
    final underweight = rules.band == BmiBand.underweight;
    final days = rules.recommendedDaysPerWeek;
    final minutes = rules.minutesPerSession;

    return WorkoutPlan(
      headline: PlanText.key(
        underweight ? 'planHeadlineStrength' : 'planHeadlineGeneral',
      ),
      summary: PlanText.key(
        underweight ? 'planSummaryUnderweight' : 'planSummaryGeneral',
      ),
      heroMetrics: [
        PlanMetric(
          value: '$days',
          caption: const PlanText.key('planMetricSessions'),
        ),
        PlanMetric(
          value: '$minutes',
          caption: const PlanText.key('planMetricMinutes'),
        ),
        const PlanMetric(
          value: '8',
          caption: PlanText.key('planMetricWeeks'),
        ),
      ],
      timeline: const [
        TimelinePhase(
          weekRange: PlanText.key('planPhase1Range'),
          focus: PlanText.key('planPhase1Focus'),
          detail: PlanText.key('planPhase1Detail'),
        ),
        TimelinePhase(
          weekRange: PlanText.key('planPhase2Range'),
          focus: PlanText.key('planPhase2Focus'),
          detail: PlanText.key('planPhase2Detail'),
        ),
      ],
      inferredNeeds: _needs(rules, underweight),
      rationale: const PlanText.key('planRationaleBody'),
      nutrition: _nutrition(c, underweight),
      sessions: _sessions(c, rules, days, minutes),
    );
  }

  List<PlanText> _needs(ComputedRules rules, bool underweight) {
    return [
      const PlanText.key('planNeedStrength'),
      if (underweight) const PlanText.key('planNeedWeightGain'),
      const PlanText.key('planNeedEndurance'),
      if (rules.safetyFlags.contains(SafetyFlag.lowMobility))
        const PlanText.key('planNeedMobility'),
      if (rules.safetyFlags.contains(SafetyFlag.activeInjury))
        const PlanText.key('planNeedInjuryCare'),
    ];
  }

  NutritionTarget _nutrition(Constraint c, bool underweight) {
    // Mifflin–St Jeor, lightly active, then a surplus when underweight.
    final bmr = c.sex == Sex.female
        ? (10 * c.weightKg + 6.25 * c.heightCm - 5 * c.age - 161)
        : (10 * c.weightKg + 6.25 * c.heightCm - 5 * c.age + 5);
    final maintenance = bmr * 1.45;
    final target = underweight ? maintenance + 350 : maintenance;

    // Round to the nearest 50 so the range reads like a target, not a formula.
    int round50(double v) => (v / 50).round() * 50;

    final proteinLow = (c.weightKg * 1.6).round();
    final proteinHigh = (c.weightKg * 2.0).round();

    return NutritionTarget(
      calorieLow: round50(target - 50),
      calorieHigh: round50(target + 50),
      proteinLow: proteinLow,
      proteinHigh: proteinHigh,
      body: PlanText.key(
        underweight ? 'planNutritionSurplus' : 'planNutritionMaintain',
      ),
      healthNote: const PlanText.key('planHealthNote'),
    );
  }

  List<PlanSession> _sessions(
    Constraint c,
    ComputedRules rules,
    int days,
    int minutes,
  ) {
    final blocked = rules.contraindicated;
    final hasWeights =
        c.equipment.contains(Equipment.dumbbell) ||
        c.equipment.contains(Equipment.fullGym);

    // Candidate pool, each tagged with the pattern that would rule it out.
    final pool = <(String, MovementPattern?, String, String)>[
      if (hasWeights)
        ('exerciseGobletSquat', MovementPattern.deepSquat, '3', '8–10')
      else
        ('exerciseSplitSquat', MovementPattern.lunge, '3', '10–12'),
      ('exerciseHipHinge', MovementPattern.deadlift, '3', '10–12'),
      ('exerciseGluteBridge', null, '3', '12–15'),
      if (hasWeights)
        ('exerciseOverheadPress', MovementPattern.overheadPress, '3', '8–10'),
      ('exercisePushup', MovementPattern.pushup, '3', '8–12'),
      ('exerciseRow', null, '3', '10–12'),
      ('exercisePlank', null, '3', '30–45s'),
      ('exerciseDeadBug', null, '3', '8–10'),
      ('exerciseCalfRaise', null, '2', '12–15'),
      ('exerciseStepUp', MovementPattern.lunge, '2', '10–12'),
    ];

    final allowed = pool
        .where((e) => e.$2 == null || !blocked.contains(e.$2))
        .toList();

    // A shorter session simply carries fewer exercises.
    final perSession = minutes <= 30
        ? 4
        : minutes <= 45
        ? 6
        : 7;

    final weekdays = c.schedule.preferredDays.toList()
      ..sort((a, b) => a.index.compareTo(b.index));

    return [
      for (var i = 0; i < days && i < weekdays.length; i++)
        PlanSession(
          day: weekdays[i].name,
          name: const PlanText.key('planSessionFullBody'),
          duration: '$minutes',
          exercises: [
            for (final e in _rotate(allowed, i).take(perSession))
              PlanExercise(
                name: PlanText.key(e.$1),
                sets: e.$3,
                reps: e.$4,
                note: blocked.isEmpty
                    ? null
                    : const PlanText.key('noteControlledRange'),
              ),
          ],
        ),
    ];
  }

  /// Varies the order per session so consecutive days aren't identical.
  List<T> _rotate<T>(List<T> items, int by) {
    if (items.isEmpty) return items;
    final offset = by % items.length;
    return [...items.skip(offset), ...items.take(offset)];
  }
}
