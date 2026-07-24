import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/logging/app_logger.dart';
import '../presentation/controller/onboarding_controller.dart';
import 'profile_repository.dart';

part 'profile_submit_controller.g.dart';

/// Drives `PUT /profile` from the review screen.
///
/// Separate from [Onboarding] (which holds the answers) so the form state is
/// never coupled to request state: a failed save leaves every entered value
/// intact for a retry.
@riverpod
class ProfileSubmit extends _$ProfileSubmit {
  /// Null until a save has been attempted.
  @override
  Future<SavedProfile?> build() async => null;

  Future<SavedProfile> submit() async {
    state = const AsyncValue.loading();
    try {
      final saved = await ref
          .read(profileRepositoryProvider)
          .save(ref.read(onboardingProvider));
      state = AsyncValue.data(saved);
      return saved;
    } catch (error, stack) {
      AppLogger.apiError('profile.save', error, stack);
      state = AsyncValue.error(error, stack);
      rethrow;
    }
  }
}
