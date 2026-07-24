import 'package:dio/dio.dart';

import '../../../l10n/app_localizations.dart';

/// Localizes a program-generation failure for the toast on the loading screen.
///
/// The backend can answer `POST /program/generate` with a 422 (empty exercise
/// pool, or the LLM failing to produce a valid program after retries), carrying
/// its own message — surfaced verbatim, as with profile-save errors.
String planErrorMessage(AppLocalizations t, Object error) {
  if (error is! DioException) return t.planGenerateErrorUnknown;

  switch (error.type) {
    case DioExceptionType.connectionError:
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.sendTimeout:
      return t.planGenerateErrorNetwork;
    default:
      break;
  }

  final status = error.response?.statusCode;
  if (status == 401) return t.profileSaveErrorUnauthorized;

  final data = error.response?.data;
  if (data is Map && data['message'] != null) {
    final message = data['message'];
    if (message is List && message.isNotEmpty) return message.join(', ');
    if (message is String && message.isNotEmpty) return message;
  }
  return t.planGenerateErrorUnknown;
}
