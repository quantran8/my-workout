# `plan` — business logic

| | |
|---|---|
| **unit** | `lib/features/plan` |
| **kind** | `feature` |
| **status** | `live` |
| **last_updated** | `2026-07-24` |

**Source paths**

- [`data/plan_providers.dart`](../../../../lib/features/plan/data/plan_providers.dart) — the seam + the two providers (`plan`, `ProgramGenerate`)
- [`data/plan_repository.dart`](../../../../lib/features/plan/data/plan_repository.dart) — the `generatePlan` / `fetchPlan` interface
- [`data/api_plan_repository.dart`](../../../../lib/features/plan/data/api_plan_repository.dart) — live: `POST /program/generate`, `GET /program/active`
- [`data/mock_plan_repository.dart`](../../../../lib/features/plan/data/mock_plan_repository.dart) — offline fallback, builds a plan from the answers
- [`data/program_mapper.dart`](../../../../lib/features/plan/data/program_mapper.dart) — `ProgramResponse` → `WorkoutPlan`
- [`data/plan_messages.dart`](../../../../lib/features/plan/data/plan_messages.dart) — generation error → localized toast
- [`models/program_response.dart`](../../../../lib/features/plan/models/program_response.dart) — the backend `Program` wire DTO
- [`models/workout_plan.dart`](../../../../lib/features/plan/models/workout_plan.dart) — the presentation model screen 10 renders
- [`presentation/screens/loading_screen.dart`](../../../../lib/features/plan/presentation/screens/loading_screen.dart) — screen 9
- [`presentation/screens/plan_screen.dart`](../../../../lib/features/plan/presentation/screens/plan_screen.dart) — screen 10

---

## 1. Purpose

Turns the saved profile into the training plan the user sees: triggers the backend's LLM program generation, then renders the resulting program as the plan screen.

---

## 2. Flow

```
review submit (ONB-7)
  1. PUT /profile          (awaited — a save failure stays on review)
  2. ProgramGenerate.generate() → POST /program/generate   (NOT awaited here)
  3. → /generating
/generating (loading screen)
  4. watches ProgramGenerate
       success → /plan      (after a 260ms beat so the last stage registers)
       error   → back to /review with a localized toast
/plan
  5. planProvider → fetchPlan → GET /program/active → map → render
```

The generate call is what runs the LLM; `GET /program/active` on the plan screen only reads the already-persisted result.

---

## 3. Business logic

### `PLAN-1` — the seam is a repository interface, swapped in one place

- **Effect** — `planRepositoryProvider` returns `ApiPlanRepository` (live). Replacing it with `const MockPlanRepository()` runs the whole feature offline with **no screen changes** — both satisfy `PlanRepository`.
- **Why** — the demo and the backend must be interchangeable; tests inject the mock this way.
- **Code** — [`plan_providers.dart`](../../../../lib/features/plan/data/plan_providers.dart) — `planRepository`

### `PLAN-2` — generation and reading are two separate calls

- **Effect** — `generatePlan` = `POST /program/generate` (runs the LLM, persists); `fetchPlan` = `GET /program/active` (reads, no regeneration). The review submit calls the first (via `ProgramGenerate`); the plan screen calls the second (via `plan`).
- **Edge cases** — the backend generates from the **stored profile**, so neither call carries the answers in its body (`ONB-7`). But `POST /program/generate` must still send an **empty JSON object** `{}`, not nothing: the shared Dio client sets `content-type: application/json` and the backend's body parser rejects an empty body under that header ("Body cannot be empty…"). The mock has no persistence, so its `fetchPlan` just regenerates.
- **Why** — regenerating every time the plan screen rebuilt would re-run the LLM and archive the program on each visit.
- **Code** — [`api_plan_repository.dart`](../../../../lib/features/plan/data/api_plan_repository.dart)

### `PLAN-3` — `ProgramGenerate` is keepAlive and starts exactly once

- **Trigger** — `ensureStarted()` — called by the review submit **and** by the loading screen's post-frame callback, whichever runs first.
- **Effect** — the notifier is `@Riverpod(keepAlive: true)` so it survives the review→generating navigation. `ensureStarted` guards on a `_started` flag so the two callers fire the request exactly once. `generate()` records the outcome in `state` and never rethrows (callers fire-and-forget). `reset()` clears `_started` so a fresh submit re-runs. On success it invalidates `hasActivePlanProvider` and `planProvider` so the gate and the plan screen re-read.
- **Edge cases** — as an autoDispose provider it would be torn down when the review route left, and writing `state` after the await throws `UnmountedRefException`. The loading screen owning a `ensureStarted` trigger is what makes a **reload directly onto `/generating`** (or a missed review-screen kick-off) still generate — the earlier listen-only design hung because it never started the request itself.
- **Code** — [`plan_providers.dart`](../../../../lib/features/plan/data/plan_providers.dart) — `ProgramGenerate`

### `PLAN-4` — the loading screen owns the generation trigger and its outcome

- **Trigger** — screen 9 `initState`: a post-frame callback calls `ensureStarted()` and reacts to the already-current state; `ref.listen(programGenerateProvider)` handles later changes.
- **Effect** — a value → navigate to `/plan`; an error → toast (`planErrorMessage`) and back to `/review`. A `_navigated` guard makes this fire once.
- **Edge cases** — reading the **current** state on mount (not only listening) is essential: a request that resolved before the screen mounted would otherwise never be acted on and the screen would hang. Stage checks advance on a timer faster than the backend, so a slow LLM holds on the final stage. The backend's 422 (empty pool / LLM failing validation) and 503 (bad LLM key/quota) carry their own message, surfaced verbatim.
- **Code** — [`loading_screen.dart`](../../../../lib/features/plan/presentation/screens/loading_screen.dart)

### `PLAN-5` — the mapper bridges two very different shapes

- **Effect** — `ProgramResponse` (prescriptions, week/day numbers, slugs) → `WorkoutPlan` (headline, hero metrics, timeline, sessions). Server free text (goal summary, exercise names, phase focus) becomes `PlanText.raw` (already localized); fields the backend does not send (metric captions, the health notice) stay `PlanText.key` so they localize.
- **Edge cases** —
  - `dayNumber` (1..7) → `Weekday.name`; out of range falls back to Monday.
  - `targetReps` is `int | [min,max] | null` on the wire; a timed movement with no reps renders its duration (`45s`) instead — see `ProgramPrescription.repsLabel`.
  - The "weeks" hero tile reads the max week in `phasePlan`, defaulting to 8 for a plan with no phases.
  - Session **duration** comes from the client's `rules.minutesPerSession`, not the program response (the backend does not return per-session minutes). After a reload the in-memory onboarding state is gone, so this falls back to the `45`-minute default — a sane value, not a broken one. Weekday labels and the weeks tile come from the program response, so those stay correct across reloads.
- **Why** — the UI must never know the server speaks in prescriptions and week numbers; keeping the transport DTO separate from `WorkoutPlan` localizes that knowledge to one file.
- **Code** — [`program_mapper.dart`](../../../../lib/features/plan/data/program_mapper.dart)

### `PLAN-6` — nutrition is server-computed and optional

- **Effect** — the plan shows the nutrition card only when `WorkoutPlan.nutrition != null`. The client never computes calories/protein itself — the value comes from the backend (`PROGRAM-10`), honouring `API-3`.
- **Edge cases** — the backend returns `null` nutrition when it lacks body data; the card is then hidden rather than showing invented numbers. The timeline and needs cards are likewise hidden when empty.
- **Code** — [`plan_screen.dart`](../../../../lib/features/plan/presentation/screens/plan_screen.dart) — `_PlanBody.build`; [`program_mapper.dart`](../../../../lib/features/plan/data/program_mapper.dart) — `_nutrition`

### `PLAN-7` — the router gates the post-onboarding surfaces on a plan existing

- **Trigger** — any navigation to a route in `Routes.requiresPlan` (`/home`, `/plan`, `/profile`, `/practice`) while signed in.
- **Effect** — the router reads `hasActivePlanProvider` (`GET /program/active`, `404` → false). No plan yet → redirect to `/generating`, which generates it (`PLAN-3`). This is what stops a user who saved their profile but never finished generation from landing on an empty home after a reload.
- **Edge cases** — while the check is `loading` the redirect returns null (holds position, no flash of `/generating`); an **errored** check (offline/401) does **not** divert, so a flaky network shows the surface's own error instead of looping into generation. `hasActivePlan` **awaits `authProvider.future`** (the resolved session), not `authProvider.value`: reading `.value` during session restore sees `null`, mistakes it for signed-out, short-circuits to `true`, and the router caches that — so the gate silently never fires. Awaiting the future suspends until restore finishes, so signed-out still short-circuits to `true` (no network, inert at boot / in tests) but a restored session correctly triggers the `GET /program/active` check. The redirect re-runs when the check resolves because `_AuthListenable` also listens to it.
- **Code** — [`router.dart`](../../../../lib/router.dart) — `createRouter` redirect, `_AuthListenable`; [`plan_providers.dart`](../../../../lib/features/plan/data/plan_providers.dart) — `hasActivePlan`

---

## 4. State held

| Provider | Tracks | Notes |
|---|---|---|
| `plan` (`AsyncValue<WorkoutPlan>`) | the plan the screen renders | autoDispose; reads via `fetchPlan` |
| `ProgramGenerate` (`AsyncValue<WorkoutPlan?>`) | the generation request | keepAlive; `ensureStarted`/`generate`/`reset` (`PLAN-3`) |
| `hasActivePlan` (`AsyncValue<bool>`) | whether a program exists | keepAlive; the router's reload gate (`PLAN-7`) |

---

## 5. Dependencies

- **Services** — `dioProvider`; `onboardingProvider` + `computedRulesProvider` (mapper inputs only).
- **Cross-repo** — `/program/generate`, `/program/active` → [backend program memory](../../../../../my-workout-backend/.claude/memory/features/program/program.md) (`PROGRAM-10`, `PROGRAM-11` are the fields this feature consumes).

---

## 6. Known gotchas

- The backend calls this a **program** (`/program/*`), the app a **plan**. The mapper is the only place both vocabularies meet.
- `WorkoutPlan.inferredNeeds` and the per-phase `detail` are thin: the backend does not model them, so needs is empty and detail is the humanized phase name. If the backend gains richer copy, map it here.
- Exercise names arrive as a single string (`Exercise.name`), not bilingual — they render as `PlanText.raw` in whatever language the catalogue holds.

---

## 7. Change log

- `2026-07-24` — Claude — initial version: live program API wired (generate + active), `ProgramResponse` DTO, `program_mapper`, generation flow across the review and loading screens; replaced the mock-only plan.
- `2026-07-24` — Claude — hardened the generation flow: loading screen now owns the `ensureStarted` trigger and reads current state (fixes the "stuck on loading" hang); added the reload gate `PLAN-7` (`hasActivePlan`) so a signed-in user without a program is routed to `/generating` instead of an empty home.
- `2026-07-24` — Claude — `PLAN-7` fix: `hasActivePlan` awaits `authProvider.future` instead of reading `.value`, which during session restore was seen as signed-out, short-circuited to `true`, and left the gate permanently open (user stuck on home despite a 404).
