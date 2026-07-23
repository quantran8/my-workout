// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_submit_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Drives `PUT /profile` from the review screen.
///
/// Separate from [Onboarding] (which holds the answers) so the form state is
/// never coupled to request state: a failed save leaves every entered value
/// intact for a retry.

@ProviderFor(ProfileSubmit)
final profileSubmitProvider = ProfileSubmitProvider._();

/// Drives `PUT /profile` from the review screen.
///
/// Separate from [Onboarding] (which holds the answers) so the form state is
/// never coupled to request state: a failed save leaves every entered value
/// intact for a retry.
final class ProfileSubmitProvider
    extends $AsyncNotifierProvider<ProfileSubmit, SavedProfile?> {
  /// Drives `PUT /profile` from the review screen.
  ///
  /// Separate from [Onboarding] (which holds the answers) so the form state is
  /// never coupled to request state: a failed save leaves every entered value
  /// intact for a retry.
  ProfileSubmitProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileSubmitProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileSubmitHash();

  @$internal
  @override
  ProfileSubmit create() => ProfileSubmit();
}

String _$profileSubmitHash() => r'c1b762c990ab0e013205ccf69cea8c4bcef0c418';

/// Drives `PUT /profile` from the review screen.
///
/// Separate from [Onboarding] (which holds the answers) so the form state is
/// never coupled to request state: a failed save leaves every entered value
/// intact for a retry.

abstract class _$ProfileSubmit extends $AsyncNotifier<SavedProfile?> {
  FutureOr<SavedProfile?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<SavedProfile?>, SavedProfile?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SavedProfile?>, SavedProfile?>,
              AsyncValue<SavedProfile?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
