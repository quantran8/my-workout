import 'package:dio/dio.dart';

import '../../../l10n/app_localizations.dart';

/// Localizes a profile-save failure for the toast.
///
/// The auth layer has its own mapper because it distinguishes credential
/// failures; here the only cases worth separating are "offline" and "the
/// server rejected the payload", the latter carrying the backend's own
/// validation message.
String profileErrorMessage(AppLocalizations t, Object error) {
  if (error is! DioException) return t.profileSaveErrorUnknown;

  switch (error.type) {
    case DioExceptionType.connectionError:
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.sendTimeout:
      return t.profileSaveErrorNetwork;
    default:
      break;
  }

  final status = error.response?.statusCode;
  if (status == 401) return t.profileSaveErrorUnauthorized;

  // NestJS's ValidationPipe answers 400 with `message` as a string array.
  final data = error.response?.data;
  if (data is Map && data['message'] != null) {
    final message = data['message'];
    if (message is List && message.isNotEmpty) return message.join(', ');
    if (message is String && message.isNotEmpty) return message;
  }
  return t.profileSaveErrorUnknown;
}
