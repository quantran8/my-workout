# mobile — AI Fitness Coach (Flutter)

Flutter client for the AI fitness coach. Talks to [my-workout-backend](../my-workout-backend/) over REST.

## Business-logic memory — read this first

**[.claude/memory/](.claude/memory/) holds the business logic and flow of every feature.** Read the relevant `features/<feature>/<feature>.md` *before* changing a feature, and treat its numbered rules as the working hypothesis about what the code does.

**[.claude/rules/memory_file_sync.md](.claude/rules/memory_file_sync.md) is mandatory:** if a change alters business logic or flow, the memory file is updated in the same commit. A code change that leaves the memory stale is a process violation.

Rules are numbered (`AUTH-1`, `PRACTICE-3`) and cited from tests and from the backend's memory files — never renumber or reuse an id.

## Stack

- **State** — Riverpod 3 with codegen (`@riverpod`). Note: `AsyncValue.value`, not `valueOrNull` (renamed in v3).
- **Routing** — go_router. The router is a provider ([routerProvider](lib/router.dart)) so it can watch auth state; it redirects every route to `/login` when signed out.
- **Models** — freezed + json_serializable.
- **HTTP** — Dio, with [AuthInterceptor](lib/core/network/auth_interceptor.dart) attaching the bearer token and retrying once on 401.
- **l10n** — ARB files in [lib/l10n/](lib/l10n/), `vi` is the template. Every user-visible string is localized in both `vi` and `en`.

## Commands

```bash
fvm flutter analyze                       # must be clean
fvm dart run build_runner build           # after touching @freezed / @riverpod
fvm flutter gen-l10n                      # after touching .arb files
fvm flutter test
fvm flutter run --dart-define=API_BASE_URL=http://localhost:5000/api/v1
```

Use `fvm` — the bare `flutter` on PATH is an older SDK and fails on this project's constraints.

## Conventions

- **Never send a raw `toJson()` to the backend.** App enums are camelCase; the backend's unions are snake_case (`lowerBack` → `lower_back`, `pain_stop`). Go through the feature's mapper — [profile_mapper.dart](lib/features/onboarding/data/profile_mapper.dart), [practice_mapper.dart](lib/features/practice/data/practice_mapper.dart) — and add a test asserting the wire value. A mismatch here still validates server-side and silently does the wrong thing.
- Widget tests that mount the app need `signedInOverrides` from [test/support/auth_override.dart](test/support/auth_override.dart), or the router lands them on `/login`.
- Localized strings go in both `app_vi.arb` and `app_en.arb`. English is usually the longer of the two — check layouts at 390px.
- **Never let an API call fail silently.** Every `catch` around a network request logs via [`AppLogger.apiError`](lib/core/logging/app_logger.dart) — with a stable operation tag (`auth.login`, `program.current`), the error, and its stack — *before* it swallows or rethrows. The log belongs at the network boundary (repository/interceptor): a `catch` in a UI layer whose underlying repository already logged does not re-log. A repository method with no `try/catch` that awaits `_dio` directly is a gap — wrap it (see `PracticeRepository._call`). `AppLogger.apiError` unpacks a `DioException` to log `status=` and `body=`, so an opaque "status 400" shows the backend's real message.
- **Bodyless POSTs must still send a JSON body.** The shared Dio client always sets `content-type: application/json` ([dio_provider.dart](lib/core/network/dio_provider.dart)); the backend's Fastify parser then rejects an *empty* body with a 400 `"Body cannot be empty when content-type is set to 'application/json'"`. A request interceptor defaults any bodyless POST/PUT/etc. to `{}` so this never bites — but if you see that exact 400, a request is bypassing it or sending an explicit `null` body.
