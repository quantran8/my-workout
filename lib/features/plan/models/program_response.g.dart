// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProgramResponse _$ProgramResponseFromJson(
  Map<String, dynamic> json,
) => _ProgramResponse(
  programId: json['programId'] as String,
  goalSummary: json['goalSummary'] as String,
  phasePlan:
      (json['phasePlan'] as List<dynamic>?)
          ?.map((e) => ProgramPhase.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  nutrition: json['nutrition'] == null
      ? null
      : ProgramNutrition.fromJson(json['nutrition'] as Map<String, dynamic>),
  revision: ProgramRevision.fromJson(json['revision'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProgramResponseToJson(_ProgramResponse instance) =>
    <String, dynamic>{
      'programId': instance.programId,
      'goalSummary': instance.goalSummary,
      'phasePlan': instance.phasePlan,
      'nutrition': instance.nutrition,
      'revision': instance.revision,
    };

_ProgramPhase _$ProgramPhaseFromJson(Map<String, dynamic> json) =>
    _ProgramPhase(
      phase: json['phase'] as String,
      weeks:
          (json['weeks'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      focus: json['focus'] as String,
    );

Map<String, dynamic> _$ProgramPhaseToJson(_ProgramPhase instance) =>
    <String, dynamic>{
      'phase': instance.phase,
      'weeks': instance.weeks,
      'focus': instance.focus,
    };

_ProgramNutrition _$ProgramNutritionFromJson(Map<String, dynamic> json) =>
    _ProgramNutrition(
      calorieLow: (json['calorieLow'] as num).toInt(),
      calorieHigh: (json['calorieHigh'] as num).toInt(),
      proteinLow: (json['proteinLow'] as num).toInt(),
      proteinHigh: (json['proteinHigh'] as num).toInt(),
      intent: json['intent'] as String,
    );

Map<String, dynamic> _$ProgramNutritionToJson(_ProgramNutrition instance) =>
    <String, dynamic>{
      'calorieLow': instance.calorieLow,
      'calorieHigh': instance.calorieHigh,
      'proteinLow': instance.proteinLow,
      'proteinHigh': instance.proteinHigh,
      'intent': instance.intent,
    };

_ProgramRevision _$ProgramRevisionFromJson(Map<String, dynamic> json) =>
    _ProgramRevision(
      revisionId: json['revisionId'] as String,
      revisionNumber: (json['revisionNumber'] as num).toInt(),
      sessions:
          (json['sessions'] as List<dynamic>?)
              ?.map(
                (e) =>
                    ProgramPlannedSession.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ProgramRevisionToJson(_ProgramRevision instance) =>
    <String, dynamic>{
      'revisionId': instance.revisionId,
      'revisionNumber': instance.revisionNumber,
      'sessions': instance.sessions,
    };

_ProgramPlannedSession _$ProgramPlannedSessionFromJson(
  Map<String, dynamic> json,
) => _ProgramPlannedSession(
  plannedSessionId: json['plannedSessionId'] as String,
  weekNumber: (json['weekNumber'] as num).toInt(),
  dayNumber: (json['dayNumber'] as num).toInt(),
  focus: json['focus'] as String,
  prescriptions:
      (json['prescriptions'] as List<dynamic>?)
          ?.map((e) => ProgramPrescription.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$ProgramPlannedSessionToJson(
  _ProgramPlannedSession instance,
) => <String, dynamic>{
  'plannedSessionId': instance.plannedSessionId,
  'weekNumber': instance.weekNumber,
  'dayNumber': instance.dayNumber,
  'focus': instance.focus,
  'prescriptions': instance.prescriptions,
};

_ProgramPrescription _$ProgramPrescriptionFromJson(Map<String, dynamic> json) =>
    _ProgramPrescription(
      prescriptionId: json['prescriptionId'] as String,
      exerciseId: json['exerciseId'] as String,
      exerciseSlug: json['exerciseSlug'] as String? ?? '',
      exerciseName: json['exerciseName'] as String? ?? '',
      order: (json['order'] as num).toInt(),
      targetSets: (json['targetSets'] as num).toInt(),
      targetRepsRaw: json['targetReps'],
      targetDurationSec: (json['targetDurationSec'] as num?)?.toInt(),
      restSec: (json['restSec'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProgramPrescriptionToJson(
  _ProgramPrescription instance,
) => <String, dynamic>{
  'prescriptionId': instance.prescriptionId,
  'exerciseId': instance.exerciseId,
  'exerciseSlug': instance.exerciseSlug,
  'exerciseName': instance.exerciseName,
  'order': instance.order,
  'targetSets': instance.targetSets,
  'targetReps': instance.targetRepsRaw,
  'targetDurationSec': instance.targetDurationSec,
  'restSec': instance.restSec,
};
