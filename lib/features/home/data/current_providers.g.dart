// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The current actionable session (`GET /program/current`).
///
/// Consumed via `.value` (nullable) so Home renders immediately and the hero
/// falls back while this resolves. Returns null when signed out so it never hits
/// the network without a session.

@ProviderFor(current)
final currentProvider = CurrentProvider._();

/// The current actionable session (`GET /program/current`).
///
/// Consumed via `.value` (nullable) so Home renders immediately and the hero
/// falls back while this resolves. Returns null when signed out so it never hits
/// the network without a session.

final class CurrentProvider
    extends
        $FunctionalProvider<AsyncValue<Current?>, Current?, FutureOr<Current?>>
    with $FutureModifier<Current?>, $FutureProvider<Current?> {
  /// The current actionable session (`GET /program/current`).
  ///
  /// Consumed via `.value` (nullable) so Home renders immediately and the hero
  /// falls back while this resolves. Returns null when signed out so it never hits
  /// the network without a session.
  CurrentProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentHash();

  @$internal
  @override
  $FutureProviderElement<Current?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Current?> create(Ref ref) {
    return current(ref);
  }
}

String _$currentHash() => r'a1ea8ea60ccd33b2e082c7c7db65cdb4e6180626';
