import 'package:dio/dio.dart';

import '../../../core/logging/app_logger.dart';
import '../../onboarding/models/computed_rules.dart';
import '../../onboarding/models/onboarding_data.dart';
import '../models/program_response.dart';
import '../models/workout_plan.dart';
import 'program_mapper.dart';
import 'plan_repository.dart';

/// Live-backend implementation of the plan seam.
///
/// The backend calls this a **program**, generated from the *saved* profile —
/// there is no request body carrying the answers. The two-step contract:
///
/// - `POST /program/generate` runs the LLM synchronously and returns the fresh
///   program. The review screen triggers this at submit time, so the profile is
///   already stored when it fires.
/// - `GET /program/active` returns the current program without regenerating.
///
/// [data]/[rules] are the client's answers, passed to the mapper only for values
/// the program response legitimately omits (weekday labels, the weeks horizon).
class ApiPlanRepository implements PlanRepository {
  const ApiPlanRepository(this._dio);

  final Dio _dio;

  /// Runs the LLM generation synchronously against the stored profile. Called
  /// from the review screen after the profile save lands.
  @override
  Future<WorkoutPlan> generatePlan(
    OnboardingData data,
    ComputedRules rules,
  ) async {
    // Send an empty JSON object, not nothing: the shared Dio client sets
    // `content-type: application/json`, and the backend's body parser rejects an
    // empty body under that header ("Body cannot be empty…"). The endpoint reads
    // no fields — the profile is fetched server-side — so `{}` is correct.
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/program/generate',
        data: const <String, dynamic>{},
      );
      final program = ProgramResponse.fromJson(response.data!);
      return mapProgramToPlan(program, data, rules);
    } on DioException catch (error, stack) {
      AppLogger.apiError('program.generate', error, stack);
      rethrow;
    }
  }

  /// Reads the active program the generate step already produced, without
  /// regenerating.
  @override
  Future<WorkoutPlan> fetchPlan(
    OnboardingData data,
    ComputedRules rules,
  ) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/program/active');
      final program = ProgramResponse.fromJson(response.data!);
      return mapProgramToPlan(program, data, rules);
    } on DioException catch (error, stack) {
      AppLogger.apiError('program.active', error, stack);
      rethrow;
    }
  }

  @override
  Future<bool> hasActivePlan() async {
    try {
      await _dio.get<Map<String, dynamic>>('/program/active');
      return true;
    } on DioException catch (e, stack) {
      // 404 = "not generated yet" (API-6 semantics), a real answer, not a
      // failure. Anything else (offline, 401) is a genuine error: log it, then
      // rethrow so the router does not silently treat a transient error as "no
      // plan" and loop into generation.
      if (e.response?.statusCode == 404) return false;
      AppLogger.apiError('program.hasActivePlan', e, stack);
      rethrow;
    }
  }
}
