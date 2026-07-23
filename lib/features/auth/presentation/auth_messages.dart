import '../../../l10n/app_localizations.dart';
import '../data/auth_exception.dart';

/// Minimum accepted by the backend's `RegisterDto`.
const kMinPasswordLength = 8;

bool isValidEmail(String value) =>
    RegExp(r'^[^@\s]+@[^@\s.]+\.[^@\s]+$').hasMatch(value);

/// Turns a thrown auth error into a localized toast message. Anything that is
/// not an [AuthException] falls back to the generic string rather than leaking
/// a stack trace into the UI.
String authErrorMessage(AppLocalizations t, Object error) {
  if (error is! AuthException) return t.authErrorUnknown;

  return switch (error.code) {
    AuthFailure.invalidCredentials => t.authErrorInvalidCredentials,
    AuthFailure.emailTaken => t.authErrorEmailTaken,
    AuthFailure.weakPassword => t.authErrorWeakPassword,
    AuthFailure.network => t.authErrorNetwork,
    // The backend's validation message is more specific than anything we could
    // guess here, so it is shown as-is when present.
    AuthFailure.badRequest => error.rawMessage ?? t.authErrorUnknown,
    AuthFailure.unknown => t.authErrorUnknown,
  };
}
