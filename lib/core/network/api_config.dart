import 'dart:io';

import 'package:flutter/foundation.dart';

/// Base URL for the backend, including the `api/v1` prefix set in `main.ts`.
///
/// Override at build time:
/// `flutter run --dart-define=API_BASE_URL=https://api.example.com/api/v1`
///
/// Without the override, points at a locally running backend — and on the
/// Android emulator `localhost` is the emulator itself, so it needs 10.0.2.2.
String get apiBaseUrl {
  const override = String.fromEnvironment('API_BASE_URL');
  if (override.isNotEmpty) return override;

  const port = 5000;
  if (!kIsWeb && Platform.isAndroid) {
    return 'http://10.0.2.2:$port/api/v1';
  }
  return 'http://localhost:$port/api/v1';
}
