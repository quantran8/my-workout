import 'package:dio/dio.dart';

import '../../../core/logging/app_logger.dart';
import '../models/auth_session.dart';
import 'auth_exception.dart';

/// Talks to the backend's `/auth` routes. Every failure is normalized into an
/// [AuthException] so the controller never has to know about Dio.
class AuthRepository {
  const AuthRepository(this._dio);

  final Dio _dio;

  Future<RegisterResult> register({
    required String email,
    required String password,
    String? fullName,
  }) async {
    final json = await _post('/auth/register', {
      'email': email,
      'password': password,
      if (fullName != null && fullName.isNotEmpty) 'fullName': fullName,
    });

    // The backend omits the tokens and sets this flag when the project
    // requires email confirmation.
    if (json['needsEmailConfirm'] == true) {
      return RegisteredNeedsConfirm(
        AuthUser.fromJson(json['user'] as Map<String, dynamic>),
      );
    }
    return RegisteredWithSession(AuthSession.fromJson(json));
  }

  Future<AuthSession> login({
    required String email,
    required String password,
  }) async {
    final json = await _post('/auth/login', {
      'email': email,
      'password': password,
    });
    return AuthSession.fromJson(json);
  }

  Future<AuthSession> refresh(String refreshToken) async {
    final json = await _post('/auth/refresh', {'refreshToken': refreshToken});
    return AuthSession.fromJson(json);
  }

  /// Best-effort revoke. A failure here must not block the local sign-out, so
  /// the caller is expected to clear its state regardless.
  Future<void> logout() async {
    try {
      await _dio.post<Map<String, dynamic>>('/auth/logout');
    } on DioException catch (error, stack) {
      // Ignored on purpose (see doc comment) — but logged, never silent.
      AppLogger.apiError('auth.logout', error, stack);
    }
  }

  Future<AuthUser> me() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/auth/me');
      return AuthUser.fromJson(response.data!);
    } on DioException catch (error, stack) {
      AppLogger.apiError('auth.me', error, stack);
      throw AuthException.fromDio(error);
    }
  }

  Future<Map<String, dynamic>> _post(
    String path,
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(path, data: body);
      return response.data!;
    } on DioException catch (error, stack) {
      AppLogger.apiError('POST $path', error, stack);
      throw AuthException.fromDio(error);
    }
  }
}
