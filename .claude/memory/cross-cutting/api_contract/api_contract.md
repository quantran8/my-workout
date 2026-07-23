# `api_contract` — business logic

| | |
|---|---|
| **unit** | `cross-cutting` |
| **kind** | `cross-cutting` |
| **status** | `live` |
| **last_updated** | `2026-07-23` |

**Source paths**

- [`lib/core/network/api_config.dart`](../../../../lib/core/network/api_config.dart) — base URL
- [`lib/core/network/dio_provider.dart`](../../../../lib/core/network/dio_provider.dart) — the shared client
- [`lib/core/network/auth_interceptor.dart`](../../../../lib/core/network/auth_interceptor.dart) — token + 401 retry
- [`lib/features/*/data/*_mapper.dart`](../../../../lib/features/) — the per-feature wire vocabulary

---

## 1. Purpose

The rules governing every request this app makes: where it goes, how it is authenticated, and — most importantly — the vocabulary mismatch between the app's Dart enums and the backend's string unions.

---

## 2. Flow

Not a sequence. These rules apply to every request.

---

## 3. Business logic

### `API-1` — Dart enums and backend unions do not share a vocabulary

- **Effect** — the app writes camelCase (`lowerBack`, `tooEasy`, `resistanceBand`); the backend's unions are snake_case (`lower_back`, `too_easy`, `resistance_band`). Every outbound enum passes through a hand-written mapper.
- **Edge cases** — the two repos fail differently, and the quiet one is worse:
  - **Loud** — a DTO pinned with `@IsIn([...])` (feedback type, readiness severity, `environment`) rejects a wrong value with 400.
  - **Silent** — `UpdateProfileDto.constraint` is typed only `@IsObject()`. A wrong value **passes validation**, is stored, and is then ignored by [`flags.ts`](../../../../../my-workout-backend/src/profile/flags.ts), which matches `injuries[].area` by string equality. The user's injury is recorded and never blocks a single exercise.
- **Why** — this is why mappers exist at all and why every one has a test asserting the literal wire string. A raw `toJson()` would compile, pass analysis, pass validation, and be wrong.
- **Code** — [`profile_mapper.dart`](../../../../lib/features/onboarding/data/profile_mapper.dart), [`practice_mapper.dart`](../../../../lib/features/practice/data/practice_mapper.dart)

### `API-2` — adding an enum value is a four-file change

- **Trigger** — a new injury area, feedback type, equipment item, etc.
- **Effect** — all four, or the value is broken in one direction:
  1. the Dart enum,
  2. the mapper case (the switch is exhaustive, so this one is compiler-enforced),
  3. the backend's union / DTO `@IsIn`,
  4. a mapper test asserting the wire string.
- **Code** — see `API-1`

### `API-3` — the client never sends server-computed values as authoritative

- **Effect** — `bmi`, `redFlags`, readiness verdicts and `inferredNeeds` are recomputed server-side from the inputs; anything the client claims is ignored.
- **Why** — one source of truth for every safety-relevant number.
- **Code** — [`profile_mapper.dart:55`](../../../../lib/features/onboarding/data/profile_mapper.dart#L55)

### `API-4` — the base URL is build-time, with an Android-emulator special case

- **Effect** — `--dart-define=API_BASE_URL=…` wins. Otherwise `localhost:5000/api/v1`, except on Android where it is `10.0.2.2:5000/api/v1`.
- **Why** — on the Android emulator `localhost` is the emulator itself, not the host.
- **Edge cases** — the `api/v1` prefix is part of the base URL (set by `app.setGlobalPrefix` server-side), so repository paths are written without it.
- **Code** — [`api_config.dart`](../../../../lib/core/network/api_config.dart)

### `API-5` — auth is transparent to every feature

- **Effect** — features call Dio directly; [`AuthInterceptor`](../../../../lib/core/network/auth_interceptor.dart) attaches the bearer token and handles the 401 refresh-and-retry (see `AUTH-4`).
- **Edge cases** — the interceptor skips `/auth/login`, `/auth/register` and `/auth/refresh`, matched with `endsWith` so the base-URL prefix does not matter.
- **Why** — flipping any repository from mock to live needs no auth wiring.
- **Code** — [`auth_interceptor.dart`](../../../../lib/core/network/auth_interceptor.dart)

### `API-6` — 404 means "not set up yet", not an error

- **Trigger** — `GET /profile` for a user who has not finished onboarding.
- **Effect** — the repository maps 404 to `null`; other statuses rethrow.
- **Code** — [`profile_repository.dart:61`](../../../../lib/features/onboarding/data/profile_repository.dart#L61) — `fetch`

---

## 4. Dependencies

- **Memory** — [`auth`](../../features/auth/auth.md), [`onboarding`](../../features/onboarding/onboarding.md), [`practice`](../../features/practice/practice.md).
- **Cross-repo** — [backend memory index](../../../../../my-workout-backend/.claude/memory/README.md).

---

## 5. Known gotchas

- NestJS's `ValidationPipe` returns `message` as a **string array** for validation failures and a plain string elsewhere. Error mappers handle both.
- `ValidationPipe` runs with `whitelist: true`: a field the DTO does not declare is silently stripped, not rejected. A typo'd key therefore looks like it worked.
- The plan feature still uses `MockPlanRepository`; [`ApiPlanRepository`](../../../../lib/features/plan/data/api_plan_repository.dart) exists but is not wired.

---

## 6. Change log

- `2026-07-23` — Claude — initial version: enum vocabulary contract, base URL, interceptor, 404 semantics.
