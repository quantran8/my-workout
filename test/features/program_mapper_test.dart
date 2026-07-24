import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/features/onboarding/models/computed_rules.dart';
import 'package:mobile/features/onboarding/models/onboarding_data.dart';
import 'package:mobile/features/plan/data/program_mapper.dart';
import 'package:mobile/features/plan/models/plan_text.dart';
import 'package:mobile/features/plan/models/program_response.dart';
import 'package:mobile/l10n/app_localizations.dart';

/// A minimal backend program response for mapping.
ProgramResponse _program({ProgramNutrition? nutrition}) => ProgramResponse(
  programId: 'p1',
  goalSummary: 'Build base strength first. Endurance follows once the surplus lands.',
  phasePlan: const [
    ProgramPhase(phase: 'strength_phase1', weeks: [1, 4], focus: 'Strength'),
    ProgramPhase(phase: 'endurance_phase2', weeks: [5, 8], focus: 'Endurance'),
  ],
  nutrition: nutrition,
  revision: const ProgramRevision(
    revisionId: 'r1',
    revisionNumber: 1,
    sessions: [
      ProgramPlannedSession(
        plannedSessionId: 's1',
        weekNumber: 1,
        dayNumber: 1,
        focus: 'Lower body',
        prescriptions: [
          ProgramPrescription(
            prescriptionId: 'x1',
            exerciseId: 'uuid-1',
            exerciseSlug: 'goblet_squat',
            exerciseName: 'Goblet Squat',
            order: 1,
            targetSets: 3,
            targetRepsRaw: [8, 10],
          ),
        ],
      ),
    ],
  ),
);

void main() {
  const data = OnboardingData();
  final rules = computeRules(data);
  final t = lookupAppLocalizations(const Locale('en'));

  test('maps exercise name and rep range from the program', () {
    final plan = mapProgramToPlan(_program(), data, rules);
    final exercise = plan.sessions.single.exercises.single;

    expect(exercise.name.resolve(t), 'Goblet Squat');
    expect(exercise.sets, '3');
    expect(exercise.reps, '8–10'); // [min, max] on the wire → a range label
  });

  test('day number 1 maps to Monday', () {
    final plan = mapProgramToPlan(_program(), data, rules);
    expect(plan.sessions.single.day, 'mon');
  });

  test('hero metric for weeks reflects the phase plan horizon', () {
    final plan = mapProgramToPlan(_program(), data, rules);
    // phasePlan ends at week 8 → the weeks tile reads 8.
    expect(plan.heroMetrics.last.value, '8');
  });

  test('nutrition is null when the backend omits it', () {
    final plan = mapProgramToPlan(_program(), data, rules);
    expect(plan.nutrition, isNull);
  });

  test('nutrition maps through when present, with the intent copy', () {
    final plan = mapProgramToPlan(
      _program(
        nutrition: const ProgramNutrition(
          calorieLow: 2100,
          calorieHigh: 2200,
          proteinLow: 112,
          proteinHigh: 140,
          intent: 'surplus',
        ),
      ),
      data,
      rules,
    );
    final n = plan.nutrition!;
    expect(n.calorieLow, 2100);
    expect(n.proteinHigh, 140);
    // 'surplus' selects the surplus body key, which must resolve (not echo).
    expect(n.body, isA<PlanTextKey>());
    expect(n.body.resolve(t), isNot('planNutritionSurplus'));
  });
}
