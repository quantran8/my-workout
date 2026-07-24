import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/logging/app_logger.dart';
import '../../../core/network/dio_provider.dart';
import '../models/session_models.dart';
import 'practice_mapper.dart';

part 'practice_repository.g.dart';

/// One set as the user actually performed it. Which fields are filled depends
/// on the movement: resistance uses reps/weight, cardio uses duration/distance.
class SetEntry {
  const SetEntry({
    required this.exerciseId,
    required this.setNumber,
    this.executionItemId,
    this.prescriptionId,
    this.movementPattern,
    this.actualReps,
    this.actualWeightKg,
    this.actualDurationSec,
    this.actualDistanceM,
    this.actualPaceSecPerKm,
    this.actualRpe,
  });

  final String exerciseId;
  final int setNumber;
  final String? executionItemId;
  final String? prescriptionId;
  final String? movementPattern;
  final int? actualReps;
  final double? actualWeightKg;
  final int? actualDurationSec;
  final int? actualDistanceM;
  final double? actualPaceSecPerKm;
  final int? actualRpe;

  Map<String, dynamic> toJson() => {
    'exerciseId': exerciseId,
    'setNumber': setNumber,
    if (executionItemId != null) 'executionItemId': executionItemId,
    if (prescriptionId != null) 'prescriptionId': prescriptionId,
    if (movementPattern != null) 'movementPattern': movementPattern,
    if (actualReps != null) 'actualReps': actualReps,
    if (actualWeightKg != null) 'actualWeightKg': actualWeightKg,
    if (actualDurationSec != null) 'actualDurationSec': actualDurationSec,
    if (actualDistanceM != null) 'actualDistanceM': actualDistanceM,
    if (actualPaceSecPerKm != null) 'actualPaceSecPerKm': actualPaceSecPerKm,
    if (actualRpe != null) 'actualRpe': actualRpe,
    // §5B — the backend trusts a manual number less than an auto-captured one.
    'fieldSources': {
      if (actualReps != null) 'reps': 'manual',
      if (actualWeightKg != null) 'weight': 'manual',
      if (actualDurationSec != null) 'duration': 'auto',
      if (actualDistanceM != null) 'distance': 'manual',
      if (actualPaceSecPerKm != null) 'pace': 'manual',
    },
  };
}

/// Wraps the backend's session lifecycle:
/// create -> readiness -> execution -> sets -> feedback -> complete.
class PracticeRepository {
  const PracticeRepository(this._dio);

  final Dio _dio;

  /// Runs a Dio request and logs any failure at the network boundary (house
  /// rule: no API call fails silently) before rethrowing so callers still react.
  Future<T> _call<T>(String operation, Future<T> Function() request) async {
    try {
      return await request();
    } on DioException catch (error, stack) {
      AppLogger.apiError(operation, error, stack);
      rethrow;
    }
  }

  /// `POST /session/create` — the session shell, before any sets exist.
  Future<String> createSession({
    required String programRevisionId,
    String? plannedSessionId,
    TrainingEnvironment environment = TrainingEnvironment.unknown,
    DistanceSource distanceSource = DistanceSource.none,
  }) async {
    final response = await _call(
      'session.create',
      () => _dio.post<Map<String, dynamic>>(
        '/session/create',
        data: {
          'programRevisionId': programRevisionId,
          if (plannedSessionId != null) 'plannedSessionId': plannedSessionId,
          'environment': PracticeMapper.environment(environment),
          'distanceSource': PracticeMapper.distanceSource(distanceSource),
          'dataSource': 'manual',
        },
      ),
    );
    return response.data!['sessionId'] as String;
  }

  /// `POST /session/:id/readiness` — the safety gate (§5.1). Skipping it makes
  /// the backend assume the conservative unknown branch.
  Future<ReadinessResult> submitReadiness(
    String sessionId,
    ReadinessAnswers answers,
  ) async {
    final response = await _call(
      'session.readiness',
      () => _dio.post<Map<String, dynamic>>(
        '/session/$sessionId/readiness',
        data: answers.toJson(),
      ),
    );
    return ReadinessResult.fromJson(response.data!);
  }

  /// `POST /session/:id/execution` — the immutable snapshot of what to perform,
  /// with each exercise hydrated. Idempotent: re-calling returns the same items.
  Future<ExecutionSnapshot> buildExecution(String sessionId) async {
    final response = await _call(
      'session.execution',
      () => _dio.post<Map<String, dynamic>>('/session/$sessionId/execution'),
    );
    return ExecutionSnapshot.fromJson(response.data!);
  }

  Future<void> logSets(String sessionId, List<SetEntry> sets) => _call(
    'session.logSets',
    () => _dio.post<Map<String, dynamic>>(
      '/session/$sessionId/sets',
      data: {'sets': [for (final set in sets) set.toJson()]},
    ),
  );

  /// `POST /session/:id/feedback` — one feedback event, including `pain_stop`,
  /// which the backend turns into a follow-up and a tolerance signal.
  Future<Map<String, dynamic>> recordFeedback(
    String sessionId, {
    required String exerciseId,
    required String type,
    String? executionItemId,
    String? movementPattern,
    String? bodyArea,
    int? severity,
    String? notes,
  }) async {
    final response = await _call(
      'session.feedback',
      () => _dio.post<Map<String, dynamic>>(
        '/session/$sessionId/feedback',
        data: {
          'exerciseId': exerciseId,
          'type': type,
          if (executionItemId != null) 'executionItemId': executionItemId,
          if (movementPattern != null) 'movementPattern': movementPattern,
          if (bodyArea != null) 'bodyArea': bodyArea,
          if (severity != null) 'severity': severity,
          if (notes != null && notes.isNotEmpty) 'notes': notes,
        },
      ),
    );
    return response.data ?? const {};
  }

  /// `POST /session/:id/complete` — ends the session and schedules the
  /// next-day follow-up.
  ///
  /// [sessionRpe] is the whole-session effort (1–10), distinct from a set's
  /// `actualRpe`; it can only be collected on the finish sheet.
  Future<Map<String, dynamic>> complete(
    String sessionId, {
    int? sessionRpe,
    EnergyLevel? energyAfter,
    String? notes,
  }) async {
    final response = await _call(
      'session.complete',
      () => _dio.post<Map<String, dynamic>>(
        '/session/$sessionId/complete',
        data: {
          if (sessionRpe != null) 'sessionRpe': sessionRpe,
          if (energyAfter != null)
            'energyAfter': PracticeMapper.energyAfter(energyAfter),
          if (notes != null && notes.isNotEmpty) 'notes': notes,
        },
      ),
    );
    return response.data ?? const {};
  }

  /// `GET /exercises?ids=` — batch read; only PT-reviewed movements.
  Future<List<ExerciseDetail>> exercisesByIds(List<String> ids) async {
    if (ids.isEmpty) return const [];
    final response = await _call(
      'exercises.byIds',
      () => _dio.get<List<dynamic>>(
        '/exercises',
        queryParameters: {'ids': ids.join(',')},
      ),
    );
    return [
      for (final row in response.data ?? const [])
        ExerciseDetail.fromJson(row as Map<String, dynamic>),
    ];
  }
}

@Riverpod(keepAlive: true)
PracticeRepository practiceRepository(Ref ref) =>
    PracticeRepository(ref.watch(dioProvider));
