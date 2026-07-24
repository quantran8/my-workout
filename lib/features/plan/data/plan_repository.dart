import '../../onboarding/models/computed_rules.dart';
import '../../onboarding/models/onboarding_data.dart';
import '../models/workout_plan.dart';

/// The swap seam between the demo and a real backend.
///
/// `abstract interface class` enforces implement-don't-extend, which is what a
/// substitution boundary wants. [ComputedRules] is passed alongside the raw
/// answers so a server implementation can either trust the client's guardrails
/// or recompute them without changing this signature.
abstract interface class PlanRepository {
  /// Runs plan/program generation against the stored profile. The review screen
  /// calls this at submit time; the returned plan is discarded there (the plan
  /// screen re-reads via [fetchPlan]), but returning it keeps the mock and API
  /// symmetric and lets a caller use the result directly.
  Future<WorkoutPlan> generatePlan(OnboardingData data, ComputedRules rules);

  /// Reads the already-generated plan without regenerating. The plan screen uses
  /// this after generation has run. For the mock this simply generates again,
  /// since it has no persistence.
  Future<WorkoutPlan> fetchPlan(OnboardingData data, ComputedRules rules);

  /// Whether the signed-in user already has a generated plan. Used by the router
  /// to decide, on reload, between the plan/home surfaces and re-running
  /// generation. A `404` (no program yet) is `false`, not an error.
  Future<bool> hasActivePlan();
}
