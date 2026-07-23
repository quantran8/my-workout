import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/dio_provider.dart';
import '../models/auth_session.dart';
import 'auth_repository.dart';
import 'token_store.dart';

part 'auth_controller.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) => AuthRepository(ref.watch(dioProvider));

/// The app's authentication state: the current [AuthSession], or null when
/// signed out.
///
/// keepAlive so the session survives route changes — every protected call reads
/// its token from here.
@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  /// Restores a persisted session on launch. The stored access token may
  /// already be expired, so it is refreshed rather than trusted.
  @override
  Future<AuthSession?> build() async {
    final stored = await ref.watch(tokenStoreProvider).read();
    if (stored == null) return null;

    try {
      final refreshed = await ref
          .read(authRepositoryProvider)
          .refresh(stored.refreshToken);
      await ref.read(tokenStoreProvider).write(refreshed);
      return refreshed;
    } on Object {
      // Refresh token revoked or expired — treat as signed out.
      await ref.read(tokenStoreProvider).clear();
      return null;
    }
  }

  Future<void> login({required String email, required String password}) async {
    state = const AsyncValue.loading();
    // Rethrows on failure so the screen can toast a specific message; the
    // guard still records the error into `state` for any listener.
    state = await AsyncValue.guard(() async {
      final session = await ref
          .read(authRepositoryProvider)
          .login(email: email, password: password);
      await ref.read(tokenStoreProvider).write(session);
      return session;
    });
    state.maybeWhen(error: Error.throwWithStackTrace, orElse: () {});
  }

  /// Returns the register outcome so the screen can distinguish "signed in" from
  /// "check your inbox".
  Future<RegisterResult> register({
    required String email,
    required String password,
    String? fullName,
  }) async {
    state = const AsyncValue.loading();
    try {
      final result = await ref
          .read(authRepositoryProvider)
          .register(email: email, password: password, fullName: fullName);

      switch (result) {
        case RegisteredWithSession(:final session):
          await ref.read(tokenStoreProvider).write(session);
          state = AsyncValue.data(session);
        case RegisteredNeedsConfirm():
          // No tokens issued — the user stays signed out until they confirm.
          state = const AsyncValue.data(null);
      }
      return result;
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
      rethrow;
    }
  }

  Future<void> logout() async {
    await ref.read(authRepositoryProvider).logout();
    await ref.read(tokenStoreProvider).clear();
    state = const AsyncValue.data(null);
  }

  /// Called by the Dio interceptor after a 401. Returns the new access token,
  /// or null when the session is unrecoverable.
  Future<String?> refreshTokens() async {
    final current = state.value;
    if (current == null) return null;

    try {
      final refreshed = await ref
          .read(authRepositoryProvider)
          .refresh(current.refreshToken);
      await ref.read(tokenStoreProvider).write(refreshed);
      state = AsyncValue.data(refreshed);
      return refreshed.accessToken;
    } on Object {
      await ref.read(tokenStoreProvider).clear();
      state = const AsyncValue.data(null);
      return null;
    }
  }
}

/// True once a session exists. Screens and the router redirect on this.
@Riverpod(keepAlive: true)
bool isSignedIn(Ref ref) =>
    ref.watch(authProvider).value != null;
