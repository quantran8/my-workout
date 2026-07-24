// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashboardNextSession _$DashboardNextSessionFromJson(
  Map<String, dynamic> json,
) => _DashboardNextSession(
  plannedSessionId: json['plannedSessionId'] as String,
  programRevisionId: json['programRevisionId'] as String,
  name: json['name'] as String,
  durationMin: (json['durationMin'] as num).toInt(),
  exercises: (json['exercises'] as num).toInt(),
);

Map<String, dynamic> _$DashboardNextSessionToJson(
  _DashboardNextSession instance,
) => <String, dynamic>{
  'plannedSessionId': instance.plannedSessionId,
  'programRevisionId': instance.programRevisionId,
  'name': instance.name,
  'durationMin': instance.durationMin,
  'exercises': instance.exercises,
};

_DashboardRecentSession _$DashboardRecentSessionFromJson(
  Map<String, dynamic> json,
) => _DashboardRecentSession(
  sessionId: json['sessionId'] as String,
  name: json['name'] as String,
  volumeKg: (json['volumeKg'] as num).toInt(),
  exercises: (json['exercises'] as num).toInt(),
  completedAt: DateTime.parse(json['completedAt'] as String),
);

Map<String, dynamic> _$DashboardRecentSessionToJson(
  _DashboardRecentSession instance,
) => <String, dynamic>{
  'sessionId': instance.sessionId,
  'name': instance.name,
  'volumeKg': instance.volumeKg,
  'exercises': instance.exercises,
  'completedAt': instance.completedAt.toIso8601String(),
};
