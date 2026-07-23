# `auth` — business logic

| | |
|---|---|
| **unit** | `lib/features/auth` |
| **kind** | `feature` |
| **status** | `live` |
| **last_updated** | `2026-07-23` |

**Source paths**

- [`data/auth_controller.dart`](../../../../lib/features/auth/data/auth_controller.dart) — session state, restore/refresh/logout
- [`data/auth_repository.dart`](../../../../lib/features/auth/data/auth_repository.dart) — the five `/auth` calls
- [`data/token_store.dart`](../../../../lib/features/auth/data/token_store.dart) — Keychain/Keystore persistence
- [`data/auth_exception.dart`](../../../../lib/features/auth/data/auth_exception.dart) — Dio error → typed failure
- [`presentation/screens/`](../../../../lib/features/auth/presentation/screens/) — login, register
- [`../../core/network/auth_interceptor.dart`](../../../../lib/core/network/auth_interceptor.dart) — token attach + 401 retry
- [`../../router.dart`](../../../../lib/router.dart) — route gating

---

## 1. Purpose

Email/password sign-in and sign-up against Supabase (proxied through our backend), plus the session that every other feature's API call depends on.

---

## 2. Flow

```
Launch
  1. Auth.build() reads the stored session      → none    → signed out, router sends to /login
                                                → present → refresh it against the backend
     ↳ refresh fails (revoked/expired):           clear storage, signed out

Register
  1. POST /auth/register
  2a. backend returns tokens        → store, go to /welcome (onboarding)
  2b. backend returns needsEmailConfirm → NO tokens, stay signed out, go to /login with a toast

Login
  1. POST /auth/login → store session → go to /home

Any authenticated request
  1. AuthInterceptor attaches the access token
  2. on 401 → refresh once → retry the original request
     ↳ refresh fails: clear session; router redirects to /login
```

---

## 3. Business logic

### `AUTH-1` — a stored session is refreshed at launch, never trusted as-is

- **Trigger** — `Auth.build()`, once per app start.
- **Condition** — a session exists in secure storage.
- **Effect** — calls `POST /auth/refresh` with the stored refresh token and replaces the stored session with the result.
- **Edge cases** — refresh failure of *any* kind (revoked, expired, offline) clears storage and lands signed out. A stored blob that fails to parse is deleted rather than crashing the launch.
- **Why** — the stored *access* token is very likely expired by the next launch; using it would fail the first real request instead of the cheap one we control.
- **Code** — [`auth_controller.dart:23`](../../../../lib/features/auth/data/auth_controller.dart#L23) — `Auth.build`

### `AUTH-2` — registration does not always sign the user in

- **Trigger** — `POST /auth/register` returns 201.
- **Condition** — the Supabase project has "Confirm email" enabled, so the backend replies `{ user, needsEmailConfirm: true }` with no tokens.
- **Effect** — the app stays **signed out** and routes to `/login` with "check your inbox". When tokens *are* returned, it stores them and routes to `/welcome` to begin onboarding.
- **Edge cases** — with confirmation disabled the second branch never fires. The sealed `RegisterResult` forces both to be handled.
- **Code** — [`auth_controller.dart:56`](../../../../lib/features/auth/data/auth_controller.dart#L56) — `Auth.register`; [`register_screen.dart`](../../../../lib/features/auth/presentation/screens/register_screen.dart) — branch on `RegisteredWithSession` / `RegisteredNeedsConfirm`

### `AUTH-3` — login failures never distinguish wrong-email from wrong-password

- **Trigger** — `POST /auth/login` returns 401.
- **Effect** — one message: "Incorrect email or password".
- **Why** — distinguishing them turns the login form into a user-enumeration oracle. The backend deliberately collapses both cases before we see them; do not "improve" this into two messages.
- **Code** — [`auth_messages.dart`](../../../../lib/features/auth/presentation/auth_messages.dart) — `AuthFailure.invalidCredentials`

### `AUTH-4` — an expired access token is refreshed transparently, once

- **Trigger** — any non-public request returns 401.
- **Condition** — the request has not already been retried (`extra['authRetried']`) and is not itself an auth route.
- **Effect** — refresh, then replay the original request with the new token. On refresh failure the original 401 is surfaced and the session is cleared.
- **Edge cases** — `/auth/login`, `/auth/register` and `/auth/refresh` are excluded, otherwise a failing refresh would recurse. The retry uses a bare `Dio` so it cannot re-enter the interceptor.
- **Code** — [`auth_interceptor.dart:39`](../../../../lib/core/network/auth_interceptor.dart#L39) — `AuthInterceptor.onError`

### `AUTH-5` — every route except the auth screens requires a session

- **Trigger** — any navigation, plus any change to auth state (the router listens).
- **Condition** — `Routes.public` = `{/, /login, /register}`.
- **Effect** — signed out on a private route → `/login`. Signed in on `/login` or `/register` → `/home`.
- **Edge cases** — while the session is still being restored (`isLoading`) the redirect returns null, holding position rather than flashing the login screen and bouncing back.
- **Code** — [`router.dart:71`](../../../../lib/router.dart#L71) — `createRouter` redirect

### `AUTH-6` — sign-out succeeds locally even if the server call fails

- **Trigger** — sign-out from the account sheet.
- **Effect** — `POST /auth/logout` (best effort), then storage is cleared and state set to signed out regardless of the outcome.
- **Why** — a user asking to sign out on a flaky network must not stay signed in.
- **Code** — [`auth_repository.dart:52`](../../../../lib/features/auth/data/auth_repository.dart#L52) — `logout`

### `AUTH-7` — the refresh token lives in the platform keychain, not preferences

- **Effect** — the whole session blob is stored via `flutter_secure_storage` (Keychain / Keystore).
- **Why** — the refresh token is long-lived; `SharedPreferences` is plain text on disk.
- **Code** — [`token_store.dart`](../../../../lib/features/auth/data/token_store.dart) — `TokenStore`

---

## 4. State held

| Field | Tracks | Mutated by |
|---|---|---|
| `AsyncValue<AuthSession?>` | current session, or null when signed out | `build`, `login`, `register`, `logout`, `refreshTokens` |

`authProvider` is `keepAlive` — the session must outlive any single route.

---

## 5. Dependencies

- **Services** — `dioProvider`; `flutter_secure_storage`.
- **Cross-repo** — `/auth/{register,login,refresh,logout,me}` → [backend auth memory](../../../../../my-workout-backend/.claude/memory/features/auth/auth.md).

---

## 6. Known gotchas

- Riverpod 3 renamed `AsyncValue.valueOrNull` to `.value`. Using the old name does not compile.
- `AuthInterceptor` matches public routes with `endsWith`, so it works whether or not the base URL carries the `api/v1` prefix.
- The legacy `AccountGateScreen` is still routed at `/` but nothing navigates to it — login superseded it. It collects an email into onboarding state that registration now supplies.
- Widget tests that mount the app must inject `signedInOverrides` ([test/support/auth_override.dart](../../../../test/support/auth_override.dart)) or `AUTH-5` sends them to `/login` and every finder fails.

---

## 7. Change log

- `2026-07-23` — Claude — initial version: email/password auth, session restore, 401 retry, route gating.
