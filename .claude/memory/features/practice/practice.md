# `practice` — business logic

| | |
|---|---|
| **unit** | `lib/features/practice` |
| **kind** | `feature` |
| **status** | `live` |
| **last_updated** | `2026-07-24` |

**Source paths**

- [`presentation/controller/practice_controller.dart`](../../../../lib/features/practice/presentation/controller/practice_controller.dart) — stage machine, timers, session lifecycle
- [`data/practice_repository.dart`](../../../../lib/features/practice/data/practice_repository.dart) — the six session calls
- [`data/practice_mapper.dart`](../../../../lib/features/practice/data/practice_mapper.dart) — **the wire contract**
- [`models/session_models.dart`](../../../../lib/features/practice/models/session_models.dart) — execution snapshot types
- [`presentation/screens/readiness_screen.dart`](../../../../lib/features/practice/presentation/screens/readiness_screen.dart) — the safety gate (pure form)
- [`presentation/screens/readiness_route.dart`](../../../../lib/features/practice/presentation/screens/readiness_route.dart) — hosts the gate, owns `beginSession`→`loadExecution`→navigate
- [`data/session_launch.dart`](../../../../lib/features/practice/data/session_launch.dart) — the `pendingSession` handoff between Home and the gate
- [`presentation/widgets/`](../../../../lib/features/practice/presentation/widgets/) — set/cardio surfaces, sheets

---

## 1. Purpose

Runs a live workout: the exercise list, the per-set runner with its timers, the cardio runners, and everything the user reports back (sets performed, how it felt, pain).

---

## 2. Flow

```
Home hero "Start"  → arm pendingSession from dashboard.nextSession
                   → /readiness

Readiness gate  → POST /session/create   (programRevisionId + plannedSessionId)
                → POST /session/:id/readiness
                  ↳ any verdict (incl. hold) → still proceed; reasons are shown
                → POST /session/:id/execution   (immutable snapshot, exercises hydrated)
                → /practice

Set runner (per exercise, per set)
  reps: tap ✓            → POST /session/:id/sets → rest
  timed: countdown to 0  → POST /session/:id/sets → rest
  rest ends → next SET of the same exercise until targetSets is reached,
              only then the next exercise

Feedback (any time)  → POST /session/:id/feedback
  pain → halt immediately, then optionally ask where/how bad

Finish → POST /session/:id/complete  (carries sessionRpe)
```

---

## 3. Business logic

### `PRACTICE-1` — the readiness gate runs before any training, and can reduce it

- **Trigger** — starting a session (the readiness route, reached from the Home hero).
- **Effect** — answers post to `/readiness`; the backend returns a verdict. A `hold` does **not** cancel the session client-side (`SESSION-2`): the execution snapshot already has the modifications applied, so the runner loads normally and surfaces the backend's own Vietnamese reasons (`ReadinessResult.reasons`) in a coral banner on the overview.
- **Edge cases** — skipping the gate sends `answered: false`, which the backend treats as its conservative "unknown" branch and **caps volume at 70%**. That is a real cost, not a no-op — a skip is a choice, not an absence.
- **Why** — `affectsNormalMovement` on a discomfort is the single answer most likely to escalate the verdict to `hold`, which is why it is a separate switch and not folded into severity. Client-side blocking would double-enforce what the snapshot already reflects and could hide items the backend deemed safe.
- **Code** — [`readiness_route.dart`](../../../../lib/features/practice/presentation/screens/readiness_route.dart) — `_begin`; [`practice_controller.dart`](../../../../lib/features/practice/presentation/controller/practice_controller.dart) — `beginSession`; [`set_overview_view.dart`](../../../../lib/features/practice/presentation/widgets/set_overview_view.dart) — `_ReadinessBanner`

### `PRACTICE-12` — a session is launched from Home with the dashboard's next-session ids

- **Trigger** — the Home hero "Start" for a day that is due.
- **Effect** — `dashboard.nextSession` (which the backend picks, `DASHBOARD-4`) supplies `programRevisionId` + `plannedSessionId`; Home arms `pendingSession` with them and routes to `/readiness`. The readiness route reads it, begins the session, loads the snapshot, then navigates to `/practice` and clears the handoff. Which day is "today" is the **backend's** decision — the client never matches weekdays.
- **Edge cases** — if `dashboard.nextSession` is null (still loading, or no plan), Home falls back to opening `/practice` in its standalone demo. Opening `/readiness` with nothing armed bounces to `/home`.
- **Why** — `POST /session/create` needs `programRevisionId`, which only the dashboard carries; threading it through avoids a second program fetch and keeps day-selection server-owned.
- **Code** — [`session_launch.dart`](../../../../lib/features/practice/data/session_launch.dart) — `PendingSession`; [`home_screen.dart`](../../../../lib/features/home/presentation/screens/home_screen.dart) — `_start`; [`readiness_route.dart`](../../../../lib/features/practice/presentation/screens/readiness_route.dart)

### `PRACTICE-13` — the practice controller is keepAlive across the launch hop

- **Effect** — `Practice` is `@Riverpod(keepAlive: true)`. `beginSession`/`loadExecution` run on the readiness route; the loaded session must survive the navigation to `/practice`. `reset()` returns it to the empty state after a session completes (`_openFinish`), so a keepAlive provider does not carry a finished session's exercises into the next launch.
- **Edge cases** — an autoDispose provider would be torn down between the two routes, dropping the loaded session and bouncing the runner to its demo state (`PRACTICE-10`).
- **Code** — [`practice_controller.dart`](../../../../lib/features/practice/presentation/controller/practice_controller.dart) — `Practice`, `reset`; [`practice_screen.dart`](../../../../lib/features/practice/presentation/screens/practice_screen.dart) — `_openFinish`

### `PRACTICE-2` — the runner performs the *effective* prescription, not the planned one

- **Trigger** — `POST /session/:id/execution` returns the snapshot.
- **Effect** — every target comes from `effectiveRx` (post-readiness-modification). Items with status `held` or `skipped` are dropped from the runner entirely.
- **Edge cases** — `plannedRx` is kept for display but must never drive the runner; progress and tolerance are judged against `effectiveRx`.
- **Code** — [`practice_controller.dart:64`](../../../../lib/features/practice/presentation/controller/practice_controller.dart#L64) — `Exercise.fromExecutionItem`; [`session_models.dart`](../../../../lib/features/practice/models/session_models.dart) — `ExecutionItem.isPerformed`

### `PRACTICE-3` — rest advances the set, not the exercise, until the sets are done

- **Trigger** — rest countdown reaching zero, or "skip rest".
- **Condition** — `setNumber < targetSets`.
- **Effect** — stays on the same exercise and increments `setNumber`; only when the sets are exhausted does it move on and reset to 1.
- **Edge cases** — moving between exercises with the footer arrows always resets `setNumber` to 1.
- **Why** — the prototype always advanced the exercise, so a 3-set prescription logged exactly one set.
- **Code** — [`practice_controller.dart:692`](../../../../lib/features/practice/presentation/controller/practice_controller.dart#L692) — `skipRest`

### `PRACTICE-4` — rest length comes from the prescription

- **Effect** — the countdown uses `effectiveRx.restSec`; the 30s constant is only the fallback for the offline demo.
- **Code** — [`practice_controller.dart:669`](../../../../lib/features/practice/presentation/controller/practice_controller.dart#L669) — `_startRest`

### `PRACTICE-5` — logging a set never blocks the workout

- **Trigger** — completing a set (reps tapped, or a timed hold reaching zero).
- **Effect** — the POST is fire-and-forget; the rest timer starts immediately and a failed post is swallowed.
- **Edge cases** — offline, or in the demo state where there is no `sessionId`, the call is skipped entirely and the timers still run.
- **Why** — a slow network must never stall a workout in progress.
- **Code** — [`practice_controller.dart:527`](../../../../lib/features/practice/presentation/controller/practice_controller.dart#L527) — `_logCurrentSet`

### `PRACTICE-6` — pain halts the session first, asks questions second

- **Trigger** — "dừng vì đau" in the feedback sheet.
- **Effect** — `painStop()` runs immediately (timers cancelled, CTA locked). *Then* the detail sheet asks body area and severity 1–5, and the `pain_stop` event is posted with whatever was supplied.
- **Edge cases** — dismissing the detail sheet still stops the session and still posts the event, just without `bodyArea`/`severity`. Those fields let the backend block the affected movement pattern later, so their absence is a real loss of signal — but never a reason to keep training.
- **Code** — [`practice_screen.dart:165`](../../../../lib/features/practice/presentation/screens/practice_screen.dart#L165) — `_openFeedback`; [`pain_detail_sheet.dart`](../../../../lib/features/practice/presentation/widgets/pain_detail_sheet.dart)

### `PRACTICE-7` — `pain_stop` is an event, never a set flag

- **Effect** — `PracticeMapper.setFeedbackFlag` returns **null** for pain; only `ok`/`too_easy`/`too_hard`/`uncomfortable` are valid `LoggedSet.feedbackFlag` values. Pain goes through `POST /feedback` as its own event.
- **Why** — the two DTOs have different unions. Sending `pain_stop` as a set flag fails validation.
- **Code** — [`practice_mapper.dart:24`](../../../../lib/features/practice/data/practice_mapper.dart#L24)

### `PRACTICE-8` — session RPE is collected on the finish sheet and sent with `complete`

- **Trigger** — saving on the finish sheet.
- **Effect** — the 1–10 rating travels as `sessionRpe` on `POST /session/:id/complete`.
- **Edge cases** — saving without picking a number sends nothing rather than a default.
- **Why** — whole-session effort is distinct from a set's `actualRpe` and can only be asked at the end. The sheet used to collect it and throw it away, and the endpoint had no field to receive it.
- **Code** — [`finish_sheet.dart`](../../../../lib/features/practice/presentation/widgets/finish_sheet.dart) — `FinishResult`; [`practice_controller.dart:574`](../../../../lib/features/practice/presentation/controller/practice_controller.dart#L574) — `completeSession`

### `PRACTICE-9` — every wire enum is mapped by hand

- **Effect** — `easy`→`too_easy`, `pain`→`pain_stop`, `lowerBack`→`lower_back`, `smartTrainer`→`smart_trainer`, `veryLow`→`very_low`.
- **Why** — same hazard as `ONB-2`: the DTOs pin these with `@IsIn([...])`, so a camelCase value is rejected outright — or worse, mis-bucketed where the union is loose.
- **Code** — [`practice_mapper.dart`](../../../../lib/features/practice/data/practice_mapper.dart); test: [`practice_mapper_test.dart`](../../../../test/features/practice/practice_mapper_test.dart)

### `PRACTICE-10` — the screens fall back to a demo when no session is loaded

- **Condition** — `sessionId == null`.
- **Effect** — `exercises` and `structuredSteps` serve `demoExercises` / `demoStructuredSteps`, the overview shows its localized placeholder rows, and every network call no-ops.
- **Why** — the practice screens stay runnable standalone without a backend.
- **Edge cases** — `isLive` is the flag everything branches on; do not test `loadedExercises != null` directly.
- **Code** — [`practice_controller.dart:339`](../../../../lib/features/practice/presentation/controller/practice_controller.dart#L339) — `PracticeState.exercises`

### `PRACTICE-11` — `distanceSource` is honestly `none` until GPS exists

- **Effect** — cardio sessions are created with `distanceSource: 'none'`.
- **Why** — the app has no geolocation; the green "GPS" dot on the cardio runner is decoration. Claiming `gps` would tell the backend the distance is more trustworthy than it is.
- **Code** — [`practice_repository.dart:82`](../../../../lib/features/practice/data/practice_repository.dart#L82)

---

## 4. State held

| Field | Tracks | Mutated by |
|---|---|---|
| `stage` | which surface is shown (overview / active / rest / cardio) | `enterMode`, `start*`, `show*` |
| `exerciseIndex`, `setNumber` | position within the session | `_showExercise`, `skipRest` |
| `timedSeconds`, `restSeconds`, `elapsedSeconds`, `structuredSeconds` | live countdowns | the four `Timer.periodic`s |
| `painStopped` | halts the flow, locks the CTA | `painStop` |
| `sessionId`, `programRevisionId` | server-side session identity; null ⇒ demo | `beginSession` |
| `loadedExercises`, `loadedStructuredSteps` | the projected snapshot | `loadExecution` |
| `readiness` | verdict + reasons, for display | `beginSession` |

All four timers are cancelled in `ref.onDispose`.

---

## 5. Dependencies

- **Memory** — [`auth`](../auth/auth.md) (token), [`onboarding`](../onboarding/onboarding.md) (the profile the program derives from).
- **Cross-repo** — the `/session/*` lifecycle and `GET /exercises` → [backend session memory](../../../../../my-workout-backend/.claude/memory/features/session/session.md).

---

## 6. Known gotchas

- The set runner's exercise list comes from the execution snapshot, but **cardio structured steps come from the same snapshot's `blocks`** — the first item with blocks wins. A session with two structured cardio prescriptions would only run the first.
- `CardioStep.phase` keeps the string form `step:n:total` because [`cardio_structured_view.dart`](../../../../lib/features/practice/presentation/widgets/cardio_structured_view.dart) parses it. Changing the projection means changing that parser.
- `cardioTargetKm` / `cardioDistanceKm` are still hardcoded in `PracticeState` — the continuous cardio runner is not wired to real distance yet.
- `POST /session/:id/execution` is idempotent server-side, so re-entering a session returns the existing snapshot instead of duplicating it.

---

## 7. Change log

- `2026-07-23` — Claude — initial version: session lifecycle, readiness gate, set/rest rules, pain-stop, wire mapping, interval blocks.
- `2026-07-24` — Claude — wired the launch flow that was previously unreachable: Home hero → `/readiness` (armed from `dashboard.nextSession`) → `beginSession`/`loadExecution` → `/practice`. `PRACTICE-1` updated (hold no longer blocks client-side; SESSION-2), added `PRACTICE-12` (launch handoff) and `PRACTICE-13` (keepAlive). Cross-repo: backend `DASHBOARD-4` now carries `programRevisionId`.
