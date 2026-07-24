// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The plan seam. Live against the backend's program API; swap for
/// `const MockPlanRepository()` to run the demo without a server.

@ProviderFor(planRepository)
final planRepositoryProvider = PlanRepositoryProvider._();

/// The plan seam. Live against the backend's program API; swap for
/// `const MockPlanRepository()` to run the demo without a server.

final class PlanRepositoryProvider
    extends $FunctionalProvider<PlanRepository, PlanRepository, PlanRepository>
    with $Provider<PlanRepository> {
  /// The plan seam. Live against the backend's program API; swap for
  /// `const MockPlanRepository()` to run the demo without a server.
  PlanRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'planRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$planRepositoryHash();

  @$internal
  @override
  $ProviderElement<PlanRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PlanRepository create(Ref ref) {
    return planRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlanRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlanRepository>(value),
    );
  }
}

String _$planRepositoryHash() => r'6e5caf6799513f6aa98b2ea7944f7f5e778dfdef';

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

@ProviderFor(hasActivePlan)
final hasActivePlanProvider = HasActivePlanProvider._();

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

final class HasActivePlanProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
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
  HasActivePlanProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hasActivePlanProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hasActivePlanHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return hasActivePlan(ref);
  }
}

String _$hasActivePlanHash() => r'756e36363784b302386430215a5df20aab97c4d4';

/// Reads the generated plan for the plan screen.
///
/// The plan is produced by [ProgramGenerate] at review-submit time and read here
/// via `fetchPlan` (`GET /program/active`) — this provider does **not**
/// regenerate. autoDispose (the codegen default) so re-entering the plan screen
/// re-reads rather than serving a stale result.

@ProviderFor(plan)
final planProvider = PlanProvider._();

/// Reads the generated plan for the plan screen.
///
/// The plan is produced by [ProgramGenerate] at review-submit time and read here
/// via `fetchPlan` (`GET /program/active`) — this provider does **not**
/// regenerate. autoDispose (the codegen default) so re-entering the plan screen
/// re-reads rather than serving a stale result.

final class PlanProvider
    extends
        $FunctionalProvider<
          AsyncValue<WorkoutPlan>,
          WorkoutPlan,
          FutureOr<WorkoutPlan>
        >
    with $FutureModifier<WorkoutPlan>, $FutureProvider<WorkoutPlan> {
  /// Reads the generated plan for the plan screen.
  ///
  /// The plan is produced by [ProgramGenerate] at review-submit time and read here
  /// via `fetchPlan` (`GET /program/active`) — this provider does **not**
  /// regenerate. autoDispose (the codegen default) so re-entering the plan screen
  /// re-reads rather than serving a stale result.
  PlanProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'planProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$planHash();

  @$internal
  @override
  $FutureProviderElement<WorkoutPlan> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<WorkoutPlan> create(Ref ref) {
    return plan(ref);
  }
}

String _$planHash() => r'3611b4bf34650267a01591f53effe109367d1695';

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

@ProviderFor(ProgramGenerate)
final programGenerateProvider = ProgramGenerateProvider._();

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
final class ProgramGenerateProvider
    extends $AsyncNotifierProvider<ProgramGenerate, WorkoutPlan?> {
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
  ProgramGenerateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'programGenerateProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$programGenerateHash();

  @$internal
  @override
  ProgramGenerate create() => ProgramGenerate();
}

String _$programGenerateHash() => r'919afadf6a68b6981bbe6c4b708bbabe16c5e160';

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

abstract class _$ProgramGenerate extends $AsyncNotifier<WorkoutPlan?> {
  FutureOr<WorkoutPlan?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<WorkoutPlan?>, WorkoutPlan?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<WorkoutPlan?>, WorkoutPlan?>,
              AsyncValue<WorkoutPlan?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
