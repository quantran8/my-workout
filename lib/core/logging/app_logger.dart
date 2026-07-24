import 'dart:developer' as developer;

import 'package:dio/dio.dart';

/// A tiny, dependency-free logger over `dart:developer`. Shows up in the Dart
/// DevTools logging view and the run console; a no-op cost in release-mode
/// terms is negligible for our volume.
///
/// The house rule (CLAUDE.md — "add log for every catch in an API call"): every
/// `catch` around a network request calls [AppLogger.apiError] with a stable
/// [operation] tag, the error, and its stack, *before* it swallows or rethrows.
/// Nothing should fail silently at the network boundary.
class AppLogger {
  const AppLogger._();

  static const String _apiTag = 'api';

  /// Log a failure caught around an API call. [operation] is a stable,
  /// greppable label for the call site (e.g. `auth.login`, `program.current`),
  /// not the user-facing message. Always pass the [error]; pass [stackTrace]
  /// when the catch captured one.
  static void apiError(
    String operation,
    Object error, [
    StackTrace? stackTrace,
  ]) {
    // Surface the backend's actual response — a bare "status 400" hides the
    // message the server sent, which is what actually explains the failure.
    var detail = '';
    if (error is DioException) {
      final res = error.response;
      detail =
          ' [${error.requestOptions.method} ${error.requestOptions.uri}]'
          ' status=${res?.statusCode} body=${res?.data}';
    }
    developer.log(
      'API call failed: $operation$detail',
      name: _apiTag,
      level: 1000, // SEVERE
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Generic error log for non-API failures we still want visibility into.
  static void error(
    String message,
    Object error, [
    StackTrace? stackTrace,
  ]) {
    developer.log(
      message,
      name: 'app',
      level: 1000,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
