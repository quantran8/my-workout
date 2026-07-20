import 'package:dio/dio.dart';

import '../../onboarding/models/computed_rules.dart';
import '../../onboarding/models/onboarding_data.dart';
import '../models/workout_plan.dart';
import 'plan_repository.dart';

/// Real-backend implementation — **not wired**.
///
/// It exists to prove the seam holds: swapping the demo for a live LLM backend
/// is a one-line change in `planRepositoryProvider`, with no edits to any
/// screen. The response is expected to carry free text, which deserializes into
/// `PlanText.raw` and renders identically to the mock's ARB keys.
class ApiPlanRepository implements PlanRepository {
  const ApiPlanRepository(this._dio);

  final Dio _dio;

  @override
  Future<WorkoutPlan> generatePlan(
    OnboardingData data,
    ComputedRules rules,
  ) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/plans',
      data: {
        'onboarding': data.toJson(),
        // Sent so the server can honour the client-side guardrails.
        'guardrails': {
          'weeklySetCap': rules.weeklySetCap,
          'recommendedDaysPerWeek': rules.recommendedDaysPerWeek,
          'contraindicated': [
            for (final pattern in rules.contraindicated) pattern.name,
          ],
          'safetyFlags': [for (final flag in rules.safetyFlags) flag.name],
        },
      },
    );

    return WorkoutPlan.fromJson(response.data!);
  }
}
