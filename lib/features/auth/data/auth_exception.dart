import 'package:dio/dio.dart';

/// A failure surfaced to the auth screens as a toast message.
///
/// Carries a [code] so the UI can localize the common cases rather than showing
/// the backend's raw English string.
class AuthException implements Exception {
  const AuthException(this.code, [this.rawMessage]);

  final AuthFailure code;
  final String? rawMessage;

  /// Maps a Dio error onto a failure code. The backend answers 401 for bad
  /// credentials and 400 with a Supabase message for everything else.
  factory AuthException.fromDio(DioException error) {
    final status = error.response?.statusCode;
    final data = error.response?.data;
    final message = data is Map && data['message'] is String
        ? data['message'] as String
        : (data is Map && data['message'] is List
              ? (data['message'] as List).join(', ')
              : null);

    if (error.type == DioExceptionType.connectionError ||
        error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      return AuthException(AuthFailure.network, message);
    }
    if (status == 401) {
      return AuthException(AuthFailure.invalidCredentials, message);
    }
    if (status == 400 || status == 422) {
      // Supabase phrases a duplicate signup as "User already registered".
      final lower = message?.toLowerCase() ?? '';
      if (lower.contains('already registered') ||
          lower.contains('already been registered')) {
        return AuthException(AuthFailure.emailTaken, message);
      }
      if (lower.contains('password')) {
        return AuthException(AuthFailure.weakPassword, message);
      }
      return AuthException(AuthFailure.badRequest, message);
    }
    return AuthException(AuthFailure.unknown, message);
  }

  @override
  String toString() => 'AuthException(${code.name}: $rawMessage)';
}

enum AuthFailure {
  invalidCredentials,
  emailTaken,
  weakPassword,
  badRequest,
  network,
  unknown,
}
