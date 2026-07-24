// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The Home screen aggregate (`GET /dashboard`).
///
/// Consumed via `.value` (nullable) so Home renders immediately and falls back
/// to its local defaults while this resolves — the same pattern the plan screen
/// uses for `planProvider`. Returns null when signed out so it never hits the
/// network without a session (the auth gate already handles routing).

@ProviderFor(dashboard)
final dashboardProvider = DashboardProvider._();

/// The Home screen aggregate (`GET /dashboard`).
///
/// Consumed via `.value` (nullable) so Home renders immediately and falls back
/// to its local defaults while this resolves — the same pattern the plan screen
/// uses for `planProvider`. Returns null when signed out so it never hits the
/// network without a session (the auth gate already handles routing).

final class DashboardProvider
    extends
        $FunctionalProvider<
          AsyncValue<Dashboard?>,
          Dashboard?,
          FutureOr<Dashboard?>
        >
    with $FutureModifier<Dashboard?>, $FutureProvider<Dashboard?> {
  /// The Home screen aggregate (`GET /dashboard`).
  ///
  /// Consumed via `.value` (nullable) so Home renders immediately and falls back
  /// to its local defaults while this resolves — the same pattern the plan screen
  /// uses for `planProvider`. Returns null when signed out so it never hits the
  /// network without a session (the auth gate already handles routing).
  DashboardProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dashboardProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashboardHash();

  @$internal
  @override
  $FutureProviderElement<Dashboard?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Dashboard?> create(Ref ref) {
    return dashboard(ref);
  }
}

String _$dashboardHash() => r'9ea2edb48917b2968b9bf637fcdd1f9936e68450';
