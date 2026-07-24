import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/dio_provider.dart';
import '../../auth/data/auth_controller.dart';
import '../../onboarding/presentation/controller/onboarding_controller.dart';
import '../models/workout_plan.dart';
import 'api_plan_repository.dart';
import 'plan_repository.dart';

part 'plan_providers.g.dart';

/// The plan seam. Live against the backend's program API; swap for
/// `const MockPlanRepository()` to run the demo without a server.
@Riverpod(keepAlive: true)
PlanRepository planRepository(Ref ref) =>
    ApiPlanRepository(ref.watch(dioProvider));

/// Whether the signed-in user already has a generated program.
///
/// The router reads this to decide, on reload, between the home/plan surfaces
/// and re-running generation (a user who saved their profile but never got a
/// plan must not be stranded on an empty home). keepAlive + read synchronously
/// by the router; it is invalidated after generation so the gate re-opens.
///
/// Short-circuits to `true` when signed out so it never calls the network
/// without a session (the auth gate already handles signed-out routing) — this
/// also keeps it inert at app boot and in signed-out tests.
@Riverpod(keepAlive: true)
Future<bool> hasActivePlan(Ref ref) async {
  // Await the *resolved* session, not the current `.value`. Reading `.value`
  // while auth is still restoring sees `null`, mistakes it for "signed out",
  // short-circuits to `true`, and the router caches that — so the gate never
  // fires even once a session appears. Awaiting the future suspends until the
  // restore finishes and re-runs when the session changes.
  final session = await ref.watch(authProvider.future);
  if (session == null) return true; // signed out — the auth gate handles it
  return ref.watch(planRepositoryProvider).hasActivePlan();
}

/// Reads the generated plan for the plan screen.
///
/// The plan is produced by [ProgramGenerate] at review-submit time and read here
/// via `fetchPlan` (`GET /program/active`) — this provider does **not**
/// regenerate. autoDispose (the codegen default) so re-entering the plan screen
/// re-reads rather than serving a stale result.
@riverpod
Future<WorkoutPlan> plan(Ref ref) {
  final data = ref.watch(onboardingProvider);
  final rules = ref.watch(computedRulesProvider);
  return ref.watch(planRepositoryProvider).fetchPlan(data, rules);
}

/// Drives `POST /program/generate`.
///
/// Separate from [plan] (which reads the result) so generation is triggered
/// once, explicitly — not re-run every time the plan screen rebuilds. The
/// profile must already be saved when this fires (the server generates from the
/// stored profile), which the review screen guarantees by saving first.
///
/// keepAlive: generation is kicked off on the review screen but its outcome is
/// consumed on the loading screen, so the notifier must survive the navigation
/// between them — an autoDispose provider would be torn down mid-request.
///
/// The loading screen reads [state] directly (not only via `ref.listen`), so a
/// generation that finishes before the screen mounts is still handled — a
/// listen-only consumer would miss the already-resolved value and hang.
@Riverpod(keepAlive: true)
class ProgramGenerate extends _$ProgramGenerate {
  /// `null` = idle (generation not started yet). Once [generate] runs the state
  /// moves loading → data/error. The loading screen reads this directly, so a
  /// request that finishes before the screen mounts is still handled.
  @override
  Future<WorkoutPlan?> build() async => null;

  bool _started = false;

  /// Runs generation once. Repeated calls (the review submit plus the loading
  /// screen's own safety trigger) are a no-op once it has started, so the
  /// request fires exactly once even if both callers invoke it.
  Future<void> ensureStarted() async {
    if (_started) return;
    await generate();
  }

  /// Records the outcome in [state]; does **not** rethrow — callers
  /// fire-and-forget, so a rethrow would become an unhandled future error.
  Future<void> generate() async {
    _started = true;
    state = const AsyncValue.loading();
    final data = ref.read(onboardingProvider);
    final rules = ref.read(computedRulesProvider);
    state = await AsyncValue.guard(
      () => ref.read(planRepositoryProvider).generatePlan(data, rules),
    );
    // A fresh program now exists — let the router gate (hasActivePlan) and the
    // plan screen re-read rather than serving the pre-generation 404.
    if (state.hasValue) {
      ref.invalidate(hasActivePlanProvider);
      ref.invalidate(planProvider);
    }
  }

  /// Clears the outcome so a retry starts fresh (idle again).
  void reset() {
    _started = false;
    state = const AsyncValue.data(null);
  }
}
