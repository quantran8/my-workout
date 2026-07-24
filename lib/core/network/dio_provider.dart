import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'api_config.dart';
import 'auth_interceptor.dart';

part 'dio_provider.g.dart';

/// Shared HTTP client, pointed at the backend and carrying the bearer token
/// for authenticated routes.
@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  final client = Dio(
    BaseOptions(
      baseUrl: apiBaseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 60),
      headers: {'content-type': 'application/json'},
      // 4xx bodies carry the backend's error message, which the auth layer
      // parses — so let Dio raise them as DioException rather than throwing on
      // a missing body.
    ),
  );
  // The content-type above is always `application/json`, so a bodyless POST
  // (e.g. `POST /session/:id/execution`) would send no body under that header —
  // and the backend's Fastify parser rejects that with a 400 "Body cannot be
  // empty when content-type is set to 'application/json'". Default such requests
  // to an empty JSON object so the header stays honest. GET/HEAD keep no body.
  client.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        final method = options.method.toUpperCase();
        final bodyless = method != 'GET' && method != 'HEAD';
        if (bodyless && options.data == null) {
          options.data = const <String, dynamic>{};
        }
        handler.next(options);
      },
    ),
  );
  client.interceptors.add(AuthInterceptor(ref));
  ref.onDispose(client.close);
  return client;
}
