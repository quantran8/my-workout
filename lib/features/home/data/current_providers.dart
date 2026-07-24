import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth/data/auth_controller.dart';
import '../models/current.dart';
import 'current_repository.dart';

part 'current_providers.g.dart';

/// The current actionable session (`GET /program/current`).
///
/// Consumed via `.value` (nullable) so Home renders immediately and the hero
/// falls back while this resolves. Returns null when signed out so it never hits
/// the network without a session.
@riverpod
Future<Current?> current(Ref ref) async {
  final session = await ref.watch(authProvider.future);
  if (session == null) return null;
  return ref.watch(currentRepositoryProvider).fetch();
}
