import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

/// Shared HTTP client. Unused while the plan repository is mocked; here so the
/// swap to a live backend needs no new wiring.
@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  final client = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 60),
      headers: {'content-type': 'application/json'},
    ),
  );
  ref.onDispose(client.close);
  return client;
}
