import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/auth_session.dart';

part 'token_store.g.dart';

/// Persists the session across app launches.
///
/// Secure storage rather than shared preferences: the refresh token is a
/// long-lived credential, so it belongs in the Keychain / Keystore.
class TokenStore {
  const TokenStore(this._storage);

  static const _key = 'auth_session';

  final FlutterSecureStorage _storage;

  Future<AuthSession?> read() async {
    final raw = await _storage.read(key: _key);
    if (raw == null) return null;
    try {
      return AuthSession.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    } on FormatException {
      // A stored blob from an older schema — drop it and start clean rather
      // than trapping the user on a launch-time crash.
      await clear();
      return null;
    }
  }

  Future<void> write(AuthSession session) =>
      _storage.write(key: _key, value: jsonEncode(session.toJson()));

  Future<void> clear() => _storage.delete(key: _key);
}

@Riverpod(keepAlive: true)
TokenStore tokenStore(Ref ref) => const TokenStore(FlutterSecureStorage());
