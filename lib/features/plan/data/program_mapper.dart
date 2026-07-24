import '../../onboarding/models/computed_rules.dart';
import '../../onboarding/models/enums.dart';
import '../../onboarding/models/onboarding_data.dart';
import '../models/plan_text.dart';
import '../models/program_response.dart';
import '../models/workout_plan.dart';

/// Turns the backend's `ProgramResponse` (prescriptions, week/day numbers,
/// server-computed nutrition) into the presentation `WorkoutPlan` the plan
/// screen renders.
///
/// Free text from the server — the goal summary, exercise names, phase focus —
/// becomes [PlanText.raw]; it is already in the user's language, so it renders
/// as-is rather than through the ARB table the mock uses. Fields the backend
/// does not carry (hero metric captions, health notice copy) stay as
/// [PlanText.key] so they localise.
///
/// [data]/[rules] are the client's onboarding answers, used only for values the
/// program response legitimately does not include (weekday labels for the
/// schedule, the "weeks" hero tile) — never to override anything the server
/// computed (`API-3`).
WorkoutPlan mapProgramToPlan(
  ProgramResponse program,
  OnboardingData data,
  ComputedRules rules,
) {
  final sessions = program.revision.sessions;
  final minutes = rules.minutesPerSession;
  final weeks = _totalWeeks(program.phasePlan);

  return WorkoutPlan(
    // The LLM's one-paragraph rationale doubles as headline + summary source.
    headline: PlanText.raw(_firstSentence(program.goalSummary)),
    summary: PlanText.raw(program.goalSummary),
    heroMetrics: [
      PlanMetric(
        value: '${sessions.length}',
        caption: const PlanText.key('planMetricSessions'),
      ),
      PlanMetric(
        value: '$minutes',
        caption: const PlanText.key('planMetricMinutes'),
      ),
      PlanMetric(
        value: '$weeks',
        caption: const PlanText.key('planMetricWeeks'),
      ),
    ],
    timeline: _timeline(program.phasePlan),
    // inferredNeeds/rationale copy is not modelled server-side yet; the goal
    // summary already covers the "why", so needs stays empty and the rationale
    // card repeats the summary rather than inventing keys.
    inferredNeeds: const [],
    rationale: PlanText.raw(program.goalSummary),
    nutrition: _nutrition(program.nutrition),
    sessions: [
      for (final s in sessions)
        PlanSession(
          day: _weekday(s.dayNumber).name,
          name: PlanText.raw(s.focus),
          duration: '$minutes',
          exercises: [
            for (final p in s.prescriptions)
              PlanExercise(
                name: PlanText.raw(
                  p.exerciseName.isNotEmpty ? p.exerciseName : p.exerciseSlug,
                ),
                sets: '${p.targetSets}',
                reps: p.repsLabel(),
              ),
          ],
        ),
    ],
  );
}

/// dayNumber is 1..7 (Mon..Sun). Anything out of range falls back to Monday so
/// a malformed session still lands on a real weekday tile.
Weekday _weekday(int dayNumber) {
  final index = (dayNumber - 1).clamp(0, Weekday.values.length - 1);
  return Weekday.values[index];
}

int _totalWeeks(List<ProgramPhase> phases) {
  var maxWeek = 0;
  for (final p in phases) {
    if (p.weeks.isNotEmpty) maxWeek = maxWeek > p.weeks.last ? maxWeek : p.weeks.last;
  }
  // No phase plan (a simple static program) → the app's default 8-week horizon.
  return maxWeek > 0 ? maxWeek : 8;
}

List<TimelinePhase> _timeline(List<ProgramPhase> phases) => [
  for (final p in phases)
    TimelinePhase(
      weekRange: PlanText.raw(_weekRange(p.weeks)),
      focus: PlanText.raw(p.focus),
      // The phase name is the only per-phase detail the server sends.
      detail: PlanText.raw(_humanisePhase(p.phase)),
    ),
];

String _weekRange(List<int> weeks) {
  if (weeks.length < 2) return '';
  return weeks[0] == weeks[1] ? 'W${weeks[0]}' : 'W${weeks[0]}–${weeks[1]}';
}

/// `strength_hypertrophy_phase1` → `Strength hypertrophy phase1`.
String _humanisePhase(String phase) {
  final words = phase.replaceAll('_', ' ').trim();
  if (words.isEmpty) return words;
  return words[0].toUpperCase() + words.substring(1);
}

NutritionTarget? _nutrition(ProgramNutrition? n) {
  if (n == null) return null;
  return NutritionTarget(
    calorieLow: n.calorieLow,
    calorieHigh: n.calorieHigh,
    proteinLow: n.proteinLow,
    proteinHigh: n.proteinHigh,
    body: PlanText.key(
      n.intent == 'surplus' ? 'planNutritionSurplus' : 'planNutritionMaintain',
    ),
    healthNote: const PlanText.key('planHealthNote'),
  );
}

String _firstSentence(String text) {
  final end = text.indexOf(RegExp(r'[.!?]'));
  final trimmed = text.trim();
  if (end <= 0) return trimmed;
  return text.substring(0, end + 1).trim();
}
