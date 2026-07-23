// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Single source of truth for everything gathered across the 8 onboarding
/// steps. Held above the router so navigating back to a step — including the
/// arbitrary jumps from the review screen — preserves every entered value.
///
/// keepAlive is essential: under autoDispose the state is discarded whenever no
/// screen is listening, which silently empties the form between steps.

@ProviderFor(Onboarding)
final onboardingProvider = OnboardingProvider._();

/// Single source of truth for everything gathered across the 8 onboarding
/// steps. Held above the router so navigating back to a step — including the
/// arbitrary jumps from the review screen — preserves every entered value.
///
/// keepAlive is essential: under autoDispose the state is discarded whenever no
/// screen is listening, which silently empties the form between steps.
final class OnboardingProvider
    extends $NotifierProvider<Onboarding, OnboardingData> {
  /// Single source of truth for everything gathered across the 8 onboarding
  /// steps. Held above the router so navigating back to a step — including the
  /// arbitrary jumps from the review screen — preserves every entered value.
  ///
  /// keepAlive is essential: under autoDispose the state is discarded whenever no
  /// screen is listening, which silently empties the form between steps.
  OnboardingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onboardingHash();

  @$internal
  @override
  Onboarding create() => Onboarding();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OnboardingData value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OnboardingData>(value),
    );
  }
}

String _$onboardingHash() => r'75ff3c96d334ca5849b31e7ad62c7dea99bc1218';

/// Single source of truth for everything gathered across the 8 onboarding
/// steps. Held above the router so navigating back to a step — including the
/// arbitrary jumps from the review screen — preserves every entered value.
///
/// keepAlive is essential: under autoDispose the state is discarded whenever no
/// screen is listening, which silently empties the form between steps.

abstract class _$Onboarding extends $Notifier<OnboardingData> {
  OnboardingData build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<OnboardingData, OnboardingData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<OnboardingData, OnboardingData>,
              OnboardingData,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Guardrails derived from the current answers. Screens 8, 9 and 10 all read
/// this, and it recomputes whenever the underlying answers change.

@ProviderFor(computedRules)
final computedRulesProvider = ComputedRulesProvider._();

/// Guardrails derived from the current answers. Screens 8, 9 and 10 all read
/// this, and it recomputes whenever the underlying answers change.

final class ComputedRulesProvider
    extends $FunctionalProvider<ComputedRules, ComputedRules, ComputedRules>
    with $Provider<ComputedRules> {
  /// Guardrails derived from the current answers. Screens 8, 9 and 10 all read
  /// this, and it recomputes whenever the underlying answers change.
  ComputedRulesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'computedRulesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$computedRulesHash();

  @$internal
  @override
  $ProviderElement<ComputedRules> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ComputedRules create(Ref ref) {
    return computedRules(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ComputedRules value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ComputedRules>(value),
    );
  }
}

String _$computedRulesHash() => r'3b8451a1a1557f5647ddf06a379799b931c4af54';
