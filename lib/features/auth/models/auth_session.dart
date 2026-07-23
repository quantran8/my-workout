import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_session.freezed.dart';
part 'auth_session.g.dart';

/// The authenticated user, mirroring the backend's `AuthUser` entity.
@freezed
abstract class AuthUser with _$AuthUser {
  const factory AuthUser({
    required String id,
    String? email,
    String? fullName,
    String? displayName,
    String? avatarUrl,
    @Default('email') String provider,
  }) = _AuthUser;

  factory AuthUser.fromJson(Map<String, dynamic> json) =>
      _$AuthUserFromJson(json);
}

/// A live session: the user plus the tokens needed to call protected routes.
///
/// `expiresAt` is the backend's Supabase claim — seconds since epoch, not
/// milliseconds.
@freezed
abstract class AuthSession with _$AuthSession {
  const factory AuthSession({
    required AuthUser user,
    required String accessToken,
    required String refreshToken,
    int? expiresAt,
    @Default('bearer') String tokenType,
  }) = _AuthSession;

  factory AuthSession.fromJson(Map<String, dynamic> json) =>
      _$AuthSessionFromJson(json);
}

/// Result of `POST /auth/register`. When the Supabase project has "Confirm
/// email" enabled the backend returns a user with no tokens, so registration
/// cannot sign the user straight in.
sealed class RegisterResult {
  const RegisterResult();
}

/// Registration returned tokens — the user is signed in.
final class RegisteredWithSession extends RegisterResult {
  const RegisteredWithSession(this.session);

  final AuthSession session;
}

/// Registration succeeded but the address must be confirmed by email first.
final class RegisteredNeedsConfirm extends RegisterResult {
  const RegisteredNeedsConfirm(this.user);

  final AuthUser user;
}
