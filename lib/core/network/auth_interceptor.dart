import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/data/auth_controller.dart';

/// Attaches the bearer token to every request and transparently retries once
/// after a 401 with a refreshed token.
///
/// Reads the session lazily from [Ref] rather than holding it: the token
/// changes on every refresh, and a captured copy would go stale.
class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._ref);

  final Ref _ref;

  /// Routes that must not carry a token or trigger a refresh — sending an
  /// expired token to `/auth/refresh` would recurse.
  static const _publicPaths = {
    '/auth/login',
    '/auth/register',
    '/auth/refresh',
  };

  static bool _isPublic(String path) =>
      _publicPaths.any((public) => path.endsWith(public));

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (!_isPublic(options.path)) {
      final token = _ref.read(authProvider).value?.accessToken;
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final options = err.requestOptions;
    final alreadyRetried = options.extra['authRetried'] == true;

    if (err.response?.statusCode != 401 ||
        alreadyRetried ||
        _isPublic(options.path)) {
      handler.next(err);
      return;
    }

    final token = await _ref.read(authProvider.notifier).refreshTokens();
    if (token == null) {
      // Session is gone; surface the original 401 so the caller can react.
      handler.next(err);
      return;
    }

    options.extra['authRetried'] = true;
    options.headers['Authorization'] = 'Bearer $token';

    try {
      // A bare Dio avoids re-entering this interceptor on the retry.
      final retry = Dio(BaseOptions(baseUrl: options.baseUrl));
      final response = await retry.fetch<dynamic>(options);
      handler.resolve(response);
    } on DioException catch (error) {
      handler.next(error);
    }
  }
}
