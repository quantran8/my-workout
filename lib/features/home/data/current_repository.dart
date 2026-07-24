import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/logging/app_logger.dart';
import '../../../core/network/dio_provider.dart';
import '../models/current.dart';

part 'current_repository.g.dart';

/// Reads the current actionable session from `GET /program/current`.
///
/// The backend resolves the schedule (today's session / rest / complete) and
/// bundles the next unlogged session + progress; this repository only parses.
/// Auth is attached by the shared [AuthInterceptor].
class CurrentRepository {
  const CurrentRepository(this._dio);

  final Dio _dio;

  Future<Current> fetch() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/program/current');
      return Current.fromJson(response.data!);
    } on DioException catch (error, stack) {
      AppLogger.apiError('program.current', error, stack);
      rethrow;
    }
  }
}

@Riverpod(keepAlive: true)
CurrentRepository currentRepository(Ref ref) =>
    CurrentRepository(ref.watch(dioProvider));
