import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth/data/auth_controller.dart';
import '../models/dashboard.dart';
import 'dashboard_repository.dart';

part 'dashboard_providers.g.dart';

/// The Home screen aggregate (`GET /dashboard`).
///
/// Consumed via `.value` (nullable) so Home renders immediately and falls back
/// to its local defaults while this resolves — the same pattern the plan screen
/// uses for `planProvider`. Returns null when signed out so it never hits the
/// network without a session (the auth gate already handles routing).
@riverpod
Future<Dashboard?> dashboard(Ref ref) async {
  final session = await ref.watch(authProvider.future);
  if (session == null) return null;
  return ref.watch(dashboardRepositoryProvider).fetch();
}
