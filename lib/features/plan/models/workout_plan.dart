import 'package:freezed_annotation/freezed_annotation.dart';

import 'plan_text.dart';

part 'workout_plan.freezed.dart';
part 'workout_plan.g.dart';

/// One of the three hero tiles at the top of the plan.
@freezed
sealed class PlanMetric with _$PlanMetric {
  const factory PlanMetric({required String value, required PlanText caption}) =
      _PlanMetric;

  factory PlanMetric.fromJson(Map<String, dynamic> json) =>
      _$PlanMetricFromJson(json);
}

@freezed
sealed class TimelinePhase with _$TimelinePhase {
  const factory TimelinePhase({
    required PlanText weekRange,
    required PlanText focus,
    required PlanText detail,
  }) = _TimelinePhase;

  factory TimelinePhase.fromJson(Map<String, dynamic> json) =>
      _$TimelinePhaseFromJson(json);
}

@freezed
sealed class NutritionTarget with _$NutritionTarget {
  const factory NutritionTarget({
    required int calorieLow,
    required int calorieHigh,
    required int proteinLow,
    required int proteinHigh,
    required PlanText body,
    required PlanText healthNote,
  }) = _NutritionTarget;

  factory NutritionTarget.fromJson(Map<String, dynamic> json) =>
      _$NutritionTargetFromJson(json);
}

@freezed
sealed class PlanExercise with _$PlanExercise {
  const factory PlanExercise({
    required PlanText name,
    required String sets,
    required String reps,
    PlanText? note,
  }) = _PlanExercise;

  factory PlanExercise.fromJson(Map<String, dynamic> json) =>
      _$PlanExerciseFromJson(json);
}

@freezed
sealed class PlanSession with _$PlanSession {
  const factory PlanSession({
    required String day,
    required PlanText name,
    required String duration,
    required List<PlanExercise> exercises,
  }) = _PlanSession;

  factory PlanSession.fromJson(Map<String, dynamic> json) =>
      _$PlanSessionFromJson(json);
}

/// The generated plan rendered by screen 10.
///
/// Every user-visible string is a [PlanText] so the mock (ARB keys) and a real
/// API (free text) can both satisfy this type.
@freezed
sealed class WorkoutPlan with _$WorkoutPlan {
  const factory WorkoutPlan({
    required PlanText headline,
    required PlanText summary,
    required List<PlanMetric> heroMetrics,
    required List<TimelinePhase> timeline,
    required List<PlanText> inferredNeeds,
    required PlanText rationale,
    // Null when the backend cannot compute a nutrition target (missing body
    // data); the plan screen hides the nutrition card rather than inventing one.
    NutritionTarget? nutrition,
    required List<PlanSession> sessions,
  }) = _WorkoutPlan;

  factory WorkoutPlan.fromJson(Map<String, dynamic> json) =>
      _$WorkoutPlanFromJson(json);
}
