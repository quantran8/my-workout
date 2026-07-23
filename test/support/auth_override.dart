import 'package:mobile/features/auth/data/auth_controller.dart';
import 'package:mobile/features/auth/models/auth_session.dart';
import 'package:mobile/features/onboarding/data/profile_repository.dart';
import 'package:mobile/features/onboarding/models/onboarding_data.dart';

/// A signed-in session for widget tests.
///
/// The router gates every screen behind authentication, so a test that walks
/// the onboarding or home flow must start authenticated or it lands on
/// `/login`.
///
/// Overriding `build` also keeps [TokenStore] out of the picture — the real one
/// reaches for the platform keychain, which no test binding provides.
// Type inferred: riverpod 3 does not export `Override` from its barrel.
final signedInOverrides = [
  authProvider.overrideWith(_SignedInAuth.new),
  // The review screen saves the profile before generating a plan; without a
  // backend that request would throw and the flow would stop there.
  profileRepositoryProvider.overrideWithValue(_FakeProfileRepository()),
];

const testUser = AuthUser(id: 'test-user', email: 'test@example.com');

class _SignedInAuth extends Auth {
  @override
  Future<AuthSession?> build() async => const AuthSession(
    user: testUser,
    accessToken: 'test-access-token',
    refreshToken: 'test-refresh-token',
  );
}

/// Accepts any save and reports no red flags, so the flow proceeds to the plan.
class _FakeProfileRepository implements ProfileRepository {
  @override
  Future<SavedProfile> save(OnboardingData data, {DateTime? now}) async =>
      const SavedProfile(bmi: 22, redFlags: []);

  @override
  Future<SavedProfile?> fetch() async => null;
}
