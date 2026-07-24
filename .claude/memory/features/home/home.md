# `home` — business logic

| | |
|---|---|
| **unit** | `lib/features/home` |
| **kind** | `feature` |
| **status** | `live` |
| **last_updated** | `2026-07-24` |

**Source paths**

- [`data/dashboard_providers.dart`](../../../../lib/features/home/data/dashboard_providers.dart) — the async `dashboard` provider (`GET /dashboard`)
- [`data/dashboard_repository.dart`](../../../../lib/features/home/data/dashboard_repository.dart) — the Dio call + `dashboardRepository` provider
- [`data/current_providers.dart`](../../../../lib/features/home/data/current_providers.dart) — the async `current` provider (`GET /program/current`)
- [`data/current_repository.dart`](../../../../lib/features/home/data/current_repository.dart) — the Dio call + `currentRepository` provider
- [`models/current.dart`](../../../../lib/features/home/models/current.dart) — `Current` wire model + `SessionSummary` + `fromJson`
- [`models/dashboard.dart`](../../../../lib/features/home/models/dashboard.dart) — `Dashboard` wire model + `fromJson`
- [`data/session_log_controller.dart`](../../../../lib/features/home/data/session_log_controller.dart) — `nowProvider` + the in-memory `SessionLog` fallback seed
- [`data/access_controller.dart`](../../../../lib/features/home/data/access_controller.dart) — `AccessTier` enum + the local `Access` toggle (dev/fallback)
- [`models/session_log.dart`](../../../../lib/features/home/models/session_log.dart) — `SessionLog`/`LoggedDay` + the local derivations (`streakAsOf`, `adherenceAsOf`, `weekOf`)
- [`presentation/screens/home_screen.dart`](../../../../lib/features/home/presentation/screens/home_screen.dart) — screen 11, reads the dashboard and renders

---

## 1. Purpose

The post-onboarding home dashboard: the next session to do, the training week strip, streak/adherence stats, the Progress card (paywalled), and the most recent session. Its numbers come from the backend's `GET /dashboard` aggregate; a local seed keeps the screen alive before that resolves.

---

## 2. Flow

```
HomeScreen.build
  1. watch dashboardProvider (GET /dashboard) + currentProvider (GET /program/current), both via `.value` (nullable)
  2. server present → dashboard gives SessionLog, accessTier, streak, adherence, due, done, recent, programProgress;
       current gives the hero's actionable session (today or next-to-train-ahead)
     server null (in flight / signed out / request failed) → fall back to the
       local SessionLog seed + local Access + SessionLog.*AsOf derivations
  3. render hero (current session, HOME-6) / week strip + program bar / stat tiles / progress / recent
```

The screen never blocks on the request — it renders on the first frame with whatever is available and rebuilds when the dashboard resolves.

---

## 3. Business logic

### `HOME-1` — the dashboard is the source of truth for the headline metrics

- **Trigger** — every `HomeScreen.build`.
- **Condition** — when `dashboardProvider.value` is non-null, `streak`, `adherence`, `due`, `done`, `programProgress`, `accessTier`, and the `SessionLog` (`days` + `baselineSessions`) are read straight off it. The local `SessionLog.streakAsOf/adherenceAsOf` derivations are used **only** as the fallback when it is null.
- **Effect** — the stat tiles, adherence caption, and paywall reflect server-computed values, not a client recomputation.
- **Why** — the backend owns these definitions (see peer `DASHBOARD-2`/`DASHBOARD-3`); recomputing them here would risk two answers drifting apart.
- **Code** — [`home_screen.dart`](../../../../lib/features/home/presentation/screens/home_screen.dart#L54) — `dashboard?.streak ?? log.streakAsOf(now)` etc.

### `HOME-2` — Home renders from a local seed until the dashboard resolves

- **Trigger** — first frame, signed-out, or a failed `GET /dashboard`.
- **Condition** — `dashboardProvider` returns null when signed out (it awaits `authProvider.future` and short-circuits), and `.value` is null while loading or on error.
- **Effect** — `log` falls back to `sessionLogControllerProvider` (the in-memory Mon/Wed/Fri seed) and `access` to the local `Access` notifier, so the screen is never blank or broken.
- **Edge cases** — a request error surfaces as `.value == null`, indistinguishable from loading here; Home simply shows seed data rather than an error state (deliberate — this is a glanceable dashboard, not a blocking flow).
- **Code** — [`home_screen.dart`](../../../../lib/features/home/presentation/screens/home_screen.dart#L40); [`dashboard_providers.dart`](../../../../lib/features/home/data/dashboard_providers.dart#L18)

### `HOME-3` — the Recent row uses server volume/exercises, seed only signals presence

- **Trigger** — rendering the Recent section.
- **Condition** — the row shows when either `dashboard.recent` exists or the local log has a completed day. Name, `volumeKg`, and `exercises` come from `dashboard.recent`; the local fallback has no per-session figures, so it renders `0`/`0`.
- **Effect** — no more hardcoded `100 kg · 6 exercises`; real figures when the server has them.
- **Code** — [`home_screen.dart`](../../../../lib/features/home/presentation/screens/home_screen.dart) — `_RecentRow`

### `HOME-6` — the hero's session comes from `GET /program/current`, and a rest day is still startable

- **Trigger** — every `HomeScreen.build`.
- **Condition** — `currentProvider` (`GET /program/current`) is the authoritative source for the hero. Its `status` decides the state and `actionable` (today's `session` when `training`, else `nextSession`) is the session offered:
  - `training` → `_HeroState.today` (Start enabled, shows today's session);
  - `rest` / `before_start` / `unknown` **with** an actionable session → `_HeroState.restStartable` (eyebrow "Rest day · Train ahead", Start still enabled — the user chooses to train ahead);
  - `program_complete` / `no_program` (or rest with nothing actionable) → `_HeroState.allDone` (Start disabled).
  Fallbacks, in order: if `current` is still resolving but `dashboard.nextSession` exists, use it as today; else if the dashboard is in with no next, allDone; else the local seed's day-by-day derivation.
- **Effect** — a freshly generated program (no logs yet) shows the real first session with an enabled Start, **not** "Recovery day". Rest days never dead-end. `_start` launches `heroSession` via `pendingSessionProvider` → readiness gate.
- **Why** — the bug this fixes: the hero derived "next" from `sessionLog.days`, which holds only *completed* days, so an empty log always fell through to the rest/allDone state. `/program/current` resolves the calendar server-side (peer `PROGRAM-13`) and bundles `nextSession` so the client needs one call.
- **Edge cases** — `heroSession.programRevisionId` empty (should not happen for a server session) → `_start` falls back to the standalone runner. `unknown` status (a wire value this build doesn't know) is treated as "offer the next session if there is one", never a crash.
- **Code** — [`home_screen.dart`](../../../../lib/features/home/presentation/screens/home_screen.dart) — the hero-state block, `_HeroCard`, `_start`; [`current.dart`](../../../../lib/features/home/models/current.dart) — `Current.actionable`

### `HOME-5` — whole-program "X of M sessions" bar under the week head

- **Trigger** — rendering the week section, when `dashboard.programProgress.total > 0`.
- **Condition** — `programProgress = { completed, total }` comes straight off the dashboard (peer `DASHBOARD-7`). The bar shows the `homeWeekSessions(completed, total)` label ("4/36 sessions") and a `LinearProgressIndicator` at `completed / total`. Hidden entirely when `total == 0` (no active program yet) — never "X of 0".
- **Effect** — the user sees how far through the *whole* program they are, distinct from the streak/adherence tiles (which are a reach-based window, `HOME-1`).
- **Edge cases** — `total == 0` from the fallback path (no server dashboard) also hides it, since the local seed carries no `programProgress`. `completed` is clamped to `total` server-side, so the bar never overfills.
- **Code** — [`home_screen.dart`](../../../../lib/features/home/presentation/screens/home_screen.dart) — the `programProgress` guard + `_ProgramProgressBar`; [`dashboard.dart`](../../../../lib/features/home/models/dashboard.dart) — `ProgramProgress`

### `HOME-4` — `Dashboard.fromJson` maps the wire contract; tier defaults to free

- **Trigger** — parsing the `GET /dashboard` response.
- **Condition** — `sessionLog.days[]` map into `LoggedDay` (which has no `fromJson` of its own); `accessTier` is the lower-case wire string (`free`/`paid`), and any unknown/missing value falls back to `AccessTier.free`.
- **Effect** — a stray or absent tier never unlocks paid surfaces.
- **Code** — [`dashboard.dart`](../../../../lib/features/home/models/dashboard.dart) — `Dashboard.fromJson`, `_tierFromWire`

---

## 4. State held

`SessionLogController` (fallback seed) and `Access` (fallback tier) are local keep-alive notifiers, mutated only in the offline/dev path (`completeToday`, `toggle`). The authoritative state is the immutable `Dashboard` from the provider.

---

## 5. Dependencies

- **Memory** — [`plan`](../plan/plan.md) — the hero/recent session labels come from `planProvider` (`PlanSession`).
- **Services** — `dashboardRepositoryProvider` → Dio `GET /dashboard`; `authProvider` (gates the request).
- **Cross-repo** — `GET /api/v1/dashboard` ← backend `dashboard` feature (`my-workout-backend/.claude/memory/features/dashboard/dashboard.md`). `Dashboard` mirrors `DashboardResponse`; the `free`/`paid` tier vocabulary, the `nextSession.programRevisionId` field, and the `programProgress { completed, total }` object are the contract points. `GET /api/v1/program/current` ← backend `program` feature (peer `PROGRAM-13`); `Current`/`SessionSummary` mirror `CurrentResponse`/`SessionPointer`. The hero starts from `/program/current` (`HOME-6`), which bundles today's session + the next-to-train-ahead + `programRevisionId`.

---

## 6. Known gotchas

- **`SessionLog`/`LoggedDay` have no `fromJson`** — they are pure freezed with computed methods, so `Dashboard.fromJson` maps the day rows by hand (`_dayFromJson`). Adding a wire field to the log means editing that mapper, not adding a `@JsonKey`.
- **`AccessTier` lives in `access_controller.dart`**, not a model file; `dashboard.dart` imports it with `show AccessTier`. The local `Access` notifier is now only the offline/dev fallback — the real tier arrives on the dashboard.
- **The mobile derivations in `SessionLog` (`streakAsOf`, `adherenceAsOf`) are fallback-only.** They still exist and are still tested, but the server's numbers win when present (`HOME-1`). Do not "fix" a discrepancy between them by changing the client — the backend is authoritative.

---

## 7. Change log

- `2026-07-24` — Claude — initial version: wired Home to `GET /dashboard` (server-computed streak/adherence/tier/recent), with the local `SessionLog` seed retained as the pre-resolve fallback.
- `2026-07-24` — Claude — `HOME-5`: whole-program "X of M sessions" bar under the week head, from the new `Dashboard.programProgress` (peer backend `DASHBOARD-7`/`PROGRAM-14`). Hidden when `total == 0`.
- `2026-07-24` — Claude — `HOME-6`: hero now sources its session from `GET /program/current` (`Current`/`SessionSummary`, peer `PROGRAM-13`). Fixes the empty-log "Recovery day" bug and makes rest days startable (train-ahead). Old `sessionLog.days`-derived hero state retired to the offline-only fallback.
