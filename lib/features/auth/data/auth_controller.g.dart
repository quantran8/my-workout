// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authRepository)
final authRepositoryProvider = AuthRepositoryProvider._();

final class AuthRepositoryProvider
    extends $FunctionalProvider<AuthRepository, AuthRepository, AuthRepository>
    with $Provider<AuthRepository> {
  AuthRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryHash();

  @$internal
  @override
  $ProviderElement<AuthRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthRepository create(Ref ref) {
    return authRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRepository>(value),
    );
  }
}

String _$authRepositoryHash() => r'db2af787db29448bbd1e90a106db17e6822b703e';

/// The app's authentication state: the current [AuthSession], or null when
/// signed out.
///
/// keepAlive so the session survives route changes — every protected call reads
/// its token from here.

@ProviderFor(Auth)
final authProvider = AuthProvider._();

/// The app's authentication state: the current [AuthSession], or null when
/// signed out.
///
/// keepAlive so the session survives route changes — every protected call reads
/// its token from here.
final class AuthProvider extends $AsyncNotifierProvider<Auth, AuthSession?> {
  /// The app's authentication state: the current [AuthSession], or null when
  /// signed out.
  ///
  /// keepAlive so the session survives route changes — every protected call reads
  /// its token from here.
  AuthProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authHash();

  @$internal
  @override
  Auth create() => Auth();
}

String _$authHash() => r'ad1f2e2f34524e19b3f1e921acae42a53707fba7';

/// The app's authentication state: the current [AuthSession], or null when
/// signed out.
///
/// keepAlive so the session survives route changes — every protected call reads
/// its token from here.

abstract class _$Auth extends $AsyncNotifier<AuthSession?> {
  FutureOr<AuthSession?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<AuthSession?>, AuthSession?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AuthSession?>, AuthSession?>,
              AsyncValue<AuthSession?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// True once a session exists. Screens and the router redirect on this.

@ProviderFor(isSignedIn)
final isSignedInProvider = IsSignedInProvider._();

/// True once a session exists. Screens and the router redirect on this.

final class IsSignedInProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// True once a session exists. Screens and the router redirect on this.
  IsSignedInProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isSignedInProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isSignedInHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isSignedIn(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isSignedInHash() => r'34e18a002f4b77e7566d2fc3800612c78cea1ec5';
