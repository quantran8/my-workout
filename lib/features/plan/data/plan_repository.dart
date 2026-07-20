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
  Future<WorkoutPlan> generatePlan(OnboardingData data, ComputedRules rules);
}
