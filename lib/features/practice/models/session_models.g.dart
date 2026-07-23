// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExerciseDetail _$ExerciseDetailFromJson(Map<String, dynamic> json) =>
    _ExerciseDetail(
      id: json['id'] as String,
      slug: json['slug'] as String,
      name: json['name'] as String,
      exerciseType:
          $enumDecodeNullable(_$ExerciseTypeEnumMap, json['exerciseType']) ??
          ExerciseType.resistance,
      primaryMuscles:
          (json['primaryMuscles'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      secondaryMuscles:
          (json['secondaryMuscles'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      equipment:
          (json['equipment'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      difficulty: (json['difficulty'] as num?)?.toInt() ?? 1,
      movementPattern: json['movementPattern'] as String?,
      instructions:
          (json['instructions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      media: json['media'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ExerciseDetailToJson(_ExerciseDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'name': instance.name,
      'exerciseType': _$ExerciseTypeEnumMap[instance.exerciseType]!,
      'primaryMuscles': instance.primaryMuscles,
      'secondaryMuscles': instance.secondaryMuscles,
      'equipment': instance.equipment,
      'difficulty': instance.difficulty,
      'movementPattern': instance.movementPattern,
      'instructions': instance.instructions,
      'media': instance.media,
    };

const _$ExerciseTypeEnumMap = {
  ExerciseType.resistance: 'resistance',
  ExerciseType.cardio: 'cardio',
  ExerciseType.mobility: 'mobility',
};

_EffectiveRx _$EffectiveRxFromJson(Map<String, dynamic> json) => _EffectiveRx(
  targetSets: (json['targetSets'] as num?)?.toInt() ?? 1,
  rawTargetReps: json['targetReps'],
  targetWeightKg: (json['targetWeightKg'] as num?)?.toDouble(),
  targetDurationSec: (json['targetDurationSec'] as num?)?.toInt(),
  targetDistanceM: (json['targetDistanceM'] as num?)?.toInt(),
  targetRpe: (json['targetRpe'] as num?)?.toInt(),
  restSec: (json['restSec'] as num?)?.toInt() ?? 60,
);

Map<String, dynamic> _$EffectiveRxToJson(_EffectiveRx instance) =>
    <String, dynamic>{
      'targetSets': instance.targetSets,
      'targetReps': instance.rawTargetReps,
      'targetWeightKg': instance.targetWeightKg,
      'targetDurationSec': instance.targetDurationSec,
      'targetDistanceM': instance.targetDistanceM,
      'targetRpe': instance.targetRpe,
      'restSec': instance.restSec,
    };

_ExecutionItem _$ExecutionItemFromJson(Map<String, dynamic> json) =>
    _ExecutionItem(
      id: json['id'] as String,
      exerciseId: json['exerciseId'] as String,
      order: (json['order'] as num).toInt(),
      effectiveRx: EffectiveRx.fromJson(
        json['effectiveRx'] as Map<String, dynamic>,
      ),
      plannedRx: json['plannedRx'] == null
          ? null
          : EffectiveRx.fromJson(json['plannedRx'] as Map<String, dynamic>),
      movementPattern: json['movementPattern'] as String?,
      status:
          $enumDecodeNullable(_$ExecutionItemStatusEnumMap, json['status']) ??
          ExecutionItemStatus.planned,
      appliedModifications:
          (json['appliedModifications'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      exercise: json['exercise'] == null
          ? null
          : ExerciseDetail.fromJson(json['exercise'] as Map<String, dynamic>),
      blocks:
          (json['blocks'] as List<dynamic>?)
              ?.map((e) => CardioBlock.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <CardioBlock>[],
    );

Map<String, dynamic> _$ExecutionItemToJson(_ExecutionItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exerciseId': instance.exerciseId,
      'order': instance.order,
      'effectiveRx': instance.effectiveRx,
      'plannedRx': instance.plannedRx,
      'movementPattern': instance.movementPattern,
      'status': _$ExecutionItemStatusEnumMap[instance.status]!,
      'appliedModifications': instance.appliedModifications,
      'exercise': instance.exercise,
      'blocks': instance.blocks,
    };

const _$ExecutionItemStatusEnumMap = {
  ExecutionItemStatus.planned: 'planned',
  ExecutionItemStatus.skipped: 'skipped',
  ExecutionItemStatus.held: 'held',
};

_CardioBlock _$CardioBlockFromJson(Map<String, dynamic> json) => _CardioBlock(
  order: (json['order'] as num).toInt(),
  phase:
      $enumDecodeNullable(_$BlockPhaseEnumMap, json['phase']) ??
      BlockPhase.work,
  durationSec: (json['durationSec'] as num?)?.toInt(),
  distanceM: (json['distanceM'] as num?)?.toInt(),
  targetRpeMin: (json['targetRpeMin'] as num?)?.toInt(),
  targetRpeMax: (json['targetRpeMax'] as num?)?.toInt(),
  targetPaceSecPerKm: (json['targetPaceSecPerKm'] as num?)?.toDouble(),
  instruction: json['instruction'] as String? ?? '',
);

Map<String, dynamic> _$CardioBlockToJson(_CardioBlock instance) =>
    <String, dynamic>{
      'order': instance.order,
      'phase': _$BlockPhaseEnumMap[instance.phase]!,
      'durationSec': instance.durationSec,
      'distanceM': instance.distanceM,
      'targetRpeMin': instance.targetRpeMin,
      'targetRpeMax': instance.targetRpeMax,
      'targetPaceSecPerKm': instance.targetPaceSecPerKm,
      'instruction': instance.instruction,
    };

const _$BlockPhaseEnumMap = {
  BlockPhase.warmup: 'warmup',
  BlockPhase.work: 'work',
  BlockPhase.recovery: 'recovery',
  BlockPhase.cooldown: 'cooldown',
};

_ExecutionSnapshot _$ExecutionSnapshotFromJson(Map<String, dynamic> json) =>
    _ExecutionSnapshot(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => ExecutionItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ExecutionItem>[],
      ruleVersion: json['ruleVersion'] as String?,
    );

Map<String, dynamic> _$ExecutionSnapshotToJson(_ExecutionSnapshot instance) =>
    <String, dynamic>{
      'items': instance.items,
      'ruleVersion': instance.ruleVersion,
    };

_Discomfort _$DiscomfortFromJson(Map<String, dynamic> json) => _Discomfort(
  bodyArea: json['bodyArea'] as String,
  severity: json['severity'] as String,
  affectsNormalMovement: json['affectsNormalMovement'] as bool? ?? false,
);

Map<String, dynamic> _$DiscomfortToJson(_Discomfort instance) =>
    <String, dynamic>{
      'bodyArea': instance.bodyArea,
      'severity': instance.severity,
      'affectsNormalMovement': instance.affectsNormalMovement,
    };

_ReadinessResult _$ReadinessResultFromJson(Map<String, dynamic> json) =>
    _ReadinessResult(
      verdict:
          $enumDecodeNullable(_$ReadinessVerdictEnumMap, json['verdict']) ??
          ReadinessVerdict.unknown,
      modifications:
          (json['modifications'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const <Map<String, dynamic>>[],
      ruleVersion: json['ruleVersion'] as String?,
    );

Map<String, dynamic> _$ReadinessResultToJson(_ReadinessResult instance) =>
    <String, dynamic>{
      'verdict': _$ReadinessVerdictEnumMap[instance.verdict]!,
      'modifications': instance.modifications,
      'ruleVersion': instance.ruleVersion,
    };

const _$ReadinessVerdictEnumMap = {
  ReadinessVerdict.ready: 'ready',
  ReadinessVerdict.modify: 'modify',
  ReadinessVerdict.hold: 'hold',
  ReadinessVerdict.unknown: 'unknown',
};
