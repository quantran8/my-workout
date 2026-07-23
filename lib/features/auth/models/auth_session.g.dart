// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthUser _$AuthUserFromJson(Map<String, dynamic> json) => _AuthUser(
  id: json['id'] as String,
  email: json['email'] as String?,
  fullName: json['fullName'] as String?,
  displayName: json['displayName'] as String?,
  avatarUrl: json['avatarUrl'] as String?,
  provider: json['provider'] as String? ?? 'email',
);

Map<String, dynamic> _$AuthUserToJson(_AuthUser instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'fullName': instance.fullName,
  'displayName': instance.displayName,
  'avatarUrl': instance.avatarUrl,
  'provider': instance.provider,
};

_AuthSession _$AuthSessionFromJson(Map<String, dynamic> json) => _AuthSession(
  user: AuthUser.fromJson(json['user'] as Map<String, dynamic>),
  accessToken: json['accessToken'] as String,
  refreshToken: json['refreshToken'] as String,
  expiresAt: (json['expiresAt'] as num?)?.toInt(),
  tokenType: json['tokenType'] as String? ?? 'bearer',
);

Map<String, dynamic> _$AuthSessionToJson(_AuthSession instance) =>
    <String, dynamic>{
      'user': instance.user,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'expiresAt': instance.expiresAt,
      'tokenType': instance.tokenType,
    };
