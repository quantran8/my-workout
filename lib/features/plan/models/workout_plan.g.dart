// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlanMetric _$PlanMetricFromJson(Map<String, dynamic> json) => _PlanMetric(
  value: json['value'] as String,
  caption: PlanText.fromJson(json['caption'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PlanMetricToJson(_PlanMetric instance) =>
    <String, dynamic>{'value': instance.value, 'caption': instance.caption};

_TimelinePhase _$TimelinePhaseFromJson(Map<String, dynamic> json) =>
    _TimelinePhase(
      weekRange: PlanText.fromJson(json['weekRange'] as Map<String, dynamic>),
      focus: PlanText.fromJson(json['focus'] as Map<String, dynamic>),
      detail: PlanText.fromJson(json['detail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TimelinePhaseToJson(_TimelinePhase instance) =>
    <String, dynamic>{
      'weekRange': instance.weekRange,
      'focus': instance.focus,
      'detail': instance.detail,
    };

_NutritionTarget _$NutritionTargetFromJson(Map<String, dynamic> json) =>
    _NutritionTarget(
      calorieLow: (json['calorieLow'] as num).toInt(),
      calorieHigh: (json['calorieHigh'] as num).toInt(),
      proteinLow: (json['proteinLow'] as num).toInt(),
      proteinHigh: (json['proteinHigh'] as num).toInt(),
      body: PlanText.fromJson(json['body'] as Map<String, dynamic>),
      healthNote: PlanText.fromJson(json['healthNote'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NutritionTargetToJson(_NutritionTarget instance) =>
    <String, dynamic>{
      'calorieLow': instance.calorieLow,
      'calorieHigh': instance.calorieHigh,
      'proteinLow': instance.proteinLow,
      'proteinHigh': instance.proteinHigh,
      'body': instance.body,
      'healthNote': instance.healthNote,
    };

_PlanExercise _$PlanExerciseFromJson(Map<String, dynamic> json) =>
    _PlanExercise(
      name: PlanText.fromJson(json['name'] as Map<String, dynamic>),
      sets: json['sets'] as String,
      reps: json['reps'] as String,
      note: json['note'] == null
          ? null
          : PlanText.fromJson(json['note'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlanExerciseToJson(_PlanExercise instance) =>
    <String, dynamic>{
      'name': instance.name,
      'sets': instance.sets,
      'reps': instance.reps,
      'note': instance.note,
    };

_PlanSession _$PlanSessionFromJson(Map<String, dynamic> json) => _PlanSession(
  day: json['day'] as String,
  name: PlanText.fromJson(json['name'] as Map<String, dynamic>),
  duration: json['duration'] as String,
  exercises: (json['exercises'] as List<dynamic>)
      .map((e) => PlanExercise.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PlanSessionToJson(_PlanSession instance) =>
    <String, dynamic>{
      'day': instance.day,
      'name': instance.name,
      'duration': instance.duration,
      'exercises': instance.exercises,
    };

_WorkoutPlan _$WorkoutPlanFromJson(Map<String, dynamic> json) => _WorkoutPlan(
  headline: PlanText.fromJson(json['headline'] as Map<String, dynamic>),
  summary: PlanText.fromJson(json['summary'] as Map<String, dynamic>),
  heroMetrics: (json['heroMetrics'] as List<dynamic>)
      .map((e) => PlanMetric.fromJson(e as Map<String, dynamic>))
      .toList(),
  timeline: (json['timeline'] as List<dynamic>)
      .map((e) => TimelinePhase.fromJson(e as Map<String, dynamic>))
      .toList(),
  inferredNeeds: (json['inferredNeeds'] as List<dynamic>)
      .map((e) => PlanText.fromJson(e as Map<String, dynamic>))
      .toList(),
  rationale: PlanText.fromJson(json['rationale'] as Map<String, dynamic>),
  nutrition: NutritionTarget.fromJson(
    json['nutrition'] as Map<String, dynamic>,
  ),
  sessions: (json['sessions'] as List<dynamic>)
      .map((e) => PlanSession.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$WorkoutPlanToJson(_WorkoutPlan instance) =>
    <String, dynamic>{
      'headline': instance.headline,
      'summary': instance.summary,
      'heroMetrics': instance.heroMetrics,
      'timeline': instance.timeline,
      'inferredNeeds': instance.inferredNeeds,
      'rationale': instance.rationale,
      'nutrition': instance.nutrition,
      'sessions': instance.sessions,
    };
