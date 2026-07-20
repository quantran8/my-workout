import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../onboarding/presentation/controller/onboarding_controller.dart';
import '../models/workout_plan.dart';
import 'mock_plan_repository.dart';
import 'plan_repository.dart';

part 'plan_providers.g.dart';

/// The swap point. Replace with `ApiPlanRepository(ref.watch(dioProvider))` to
/// go live — no screen changes required.
@Riverpod(keepAlive: true)
PlanRepository planRepository(Ref ref) => const MockPlanRepository();

/// Generates the plan from the confirmed answers and their guardrails.
///
/// autoDispose (the codegen default) so backing out of the plan and confirming
/// again regenerates rather than serving a stale result.
@riverpod
Future<WorkoutPlan> plan(Ref ref) {
  final data = ref.watch(onboardingProvider);
  final rules = ref.watch(computedRulesProvider);
  return ref.watch(planRepositoryProvider).generatePlan(data, rules);
}
