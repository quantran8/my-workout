// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionSummary _$SessionSummaryFromJson(Map<String, dynamic> json) =>
    _SessionSummary(
      plannedSessionId: json['plannedSessionId'] as String,
      programRevisionId: json['programRevisionId'] as String,
      name: json['name'] as String,
      exercises: (json['exercises'] as num).toInt(),
    );

Map<String, dynamic> _$SessionSummaryToJson(_SessionSummary instance) =>
    <String, dynamic>{
      'plannedSessionId': instance.plannedSessionId,
      'programRevisionId': instance.programRevisionId,
      'name': instance.name,
      'exercises': instance.exercises,
    };
