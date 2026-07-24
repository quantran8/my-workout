import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/dio_provider.dart';
import '../models/dashboard.dart';

part 'dashboard_repository.g.dart';

/// Reads the Home screen aggregate from `GET /dashboard`.
///
/// The backend computes every headline metric (streak, adherence, due/done) and
/// returns them alongside the raw day rows; this repository only parses. Auth is
/// attached by the shared [AuthInterceptor], so no token handling here.
class DashboardRepository {
  const DashboardRepository(this._dio);

  final Dio _dio;

  Future<Dashboard> fetch() async {
    final response = await _dio.get<Map<String, dynamic>>('/dashboard');
    return Dashboard.fromJson(response.data!);
  }
}

@Riverpod(keepAlive: true)
DashboardRepository dashboardRepository(Ref ref) =>
    DashboardRepository(ref.watch(dioProvider));
