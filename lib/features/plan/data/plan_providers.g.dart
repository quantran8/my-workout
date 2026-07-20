// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The swap point. Replace with `ApiPlanRepository(ref.watch(dioProvider))` to
/// go live — no screen changes required.

@ProviderFor(planRepository)
final planRepositoryProvider = PlanRepositoryProvider._();

/// The swap point. Replace with `ApiPlanRepository(ref.watch(dioProvider))` to
/// go live — no screen changes required.

final class PlanRepositoryProvider
    extends $FunctionalProvider<PlanRepository, PlanRepository, PlanRepository>
    with $Provider<PlanRepository> {
  /// The swap point. Replace with `ApiPlanRepository(ref.watch(dioProvider))` to
  /// go live — no screen changes required.
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

String _$planRepositoryHash() => r'3d93224fed589365b71006b09d506ee1cfd6ab9a';

/// Generates the plan from the confirmed answers and their guardrails.
///
/// autoDispose (the codegen default) so backing out of the plan and confirming
/// again regenerates rather than serving a stale result.

@ProviderFor(plan)
final planProvider = PlanProvider._();

/// Generates the plan from the confirmed answers and their guardrails.
///
/// autoDispose (the codegen default) so backing out of the plan and confirming
/// again regenerates rather than serving a stale result.

final class PlanProvider
    extends
        $FunctionalProvider<
          AsyncValue<WorkoutPlan>,
          WorkoutPlan,
          FutureOr<WorkoutPlan>
        >
    with $FutureModifier<WorkoutPlan>, $FutureProvider<WorkoutPlan> {
  /// Generates the plan from the confirmed answers and their guardrails.
  ///
  /// autoDispose (the codegen default) so backing out of the plan and confirming
  /// again regenerates rather than serving a stale result.
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

String _$planHash() => r'b85d14829061fbb3864a057921741f0fd19d36ac';
