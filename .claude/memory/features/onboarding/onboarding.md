# `onboarding` — business logic

| | |
|---|---|
| **unit** | `lib/features/onboarding` |
| **kind** | `feature` |
| **status** | `live` |
| **last_updated** | `2026-07-24` |

**Source paths**

- [`models/onboarding_data.dart`](../../../../lib/features/onboarding/models/onboarding_data.dart) — the answers + derivations
- [`models/enums.dart`](../../../../lib/features/onboarding/models/enums.dart) — structured choices
- [`data/profile_mapper.dart`](../../../../lib/features/onboarding/data/profile_mapper.dart) — **the wire contract**
- [`data/profile_repository.dart`](../../../../lib/features/onboarding/data/profile_repository.dart) — `PUT /profile`
- [`presentation/screens/`](../../../../lib/features/onboarding/presentation/screens/) — 8 steps
- [`presentation/controller/onboarding_controller.dart`](../../../../lib/features/onboarding/presentation/controller/onboarding_controller.dart) — the form state

---

## 1. Purpose

Collects the user's constraints and goals across 8 steps, then persists them as the profile the whole training program is derived from.

---

## 2. Flow

```
/welcome → story → basics → safety → context → diet → review
                                                        │
  review: tick the confirm box (CTA inert until then)
    → PUT /profile   ← the program is derived server-side from the stored profile,
    │                  so the save must land before generation starts
    ↳ save failure: stay on review, toast, every answer intact
    → kick off POST /program/generate (not awaited here)
    → /generating   ← awaits generation, shows stage checks (PLAN-4)
    │   ↳ generation failure: back to review with a toast
    → /plan          ← reads GET /program/active (PLAN-2)
```

The six steps between `story` and `review` show a progress hairline; `Routes.progressFor` drives it.

---

## 3. Business logic

### `ONB-1` — form state is `keepAlive`, so backing out never loses an answer

- **Trigger** — any navigation between steps, including the review screen's per-card "edit" links.
- **Effect** — `onboardingProvider` retains every entered value.
- **Why** — under autoDispose the state is discarded whenever no screen listens, silently emptying the form between steps.
- **Code** — [`onboarding_controller.dart:15`](../../../../lib/features/onboarding/presentation/controller/onboarding_controller.dart#L15) — `@Riverpod(keepAlive: true)`

### `ONB-2` — the wire payload is hand-mapped, never a raw `toJson()`

- **Trigger** — `PUT /profile`.
- **Effect** — [`ProfileMapper`](../../../../lib/features/onboarding/data/profile_mapper.dart) converts every enum to the backend's vocabulary: `lowerBack`→`lower_back`, `deepSquat`→`deep_squat`, `resistanceBand`→`resistance_band`, `veryLow`→`very_low`.
- **Edge cases** — the backend types `constraint` only as `@IsObject()`, so a wrong value **passes validation** and is then silently ignored by `flags.ts`, which matches `injuries[].area` by equality. A camelCase injury area therefore records an injury that never blocks any exercise.
- **Why** — this is the single highest-risk edit in the feature. Any new enum needs a mapper case *and* a test asserting the wire string.
- **Code** — [`profile_mapper.dart`](../../../../lib/features/onboarding/data/profile_mapper.dart); test: [`profile_mapper_test.dart`](../../../../test/features/onboarding/profile_mapper_test.dart)

### `ONB-3` — "no injuries" clears the list rather than hiding it

- **Trigger** — the safety screen's injury toggle, or the mapper at send time.
- **Condition** — `hasInjury == false`.
- **Effect** — `injuries` is emptied; the payload carries `[]`. Turning it back on seeds one blank row.
- **Edge cases** — removing the last row flips `hasInjury` to false, so the two can never disagree.
- **Code** — [`onboarding_controller.dart:63`](../../../../lib/features/onboarding/presentation/controller/onboarding_controller.dart#L63) — `setHasInjury`; [`profile_mapper.dart:32`](../../../../lib/features/onboarding/data/profile_mapper.dart#L32)

### `ONB-4` — recent activity is asked separately from experience

- **Trigger** — the basics step.
- **Effect** — `recentActivityLevel` (very low / low / moderate / high) is its own question, sent as its own field.
- **Why** — §1.2 of the data model forbids merging them: someone with advanced technique who has not trained in a year still needs an adaptation phase. `very_low` triggers one on its own, independent of `experienceLevel`.
- **Code** — [`basics_screen.dart`](../../../../lib/features/onboarding/presentation/screens/basics_screen.dart); backend: [`adaptation-phase.ts:63`](../../../../../my-workout-backend/src/profile/adaptation-phase.ts#L63)

### `ONB-5` — one question about the training gap produces two backend fields

- **Trigger** — the basics step's "last trained consistently" dropdown.
- **Effect** — the chosen band derives **both** `detrainingDurationWeeks` and `lastConsistentTrainingAt`:

  | Choice | weeks | triggers long-detraining? |
  |---|---|---|
  | Training now | `null` | no |
  | < 1 month | 2 | no |
  | 1–3 months | 6 | no |
  | 3–12 months | **13** | **yes** |
  | > 1 year | 52 | yes |

- **Edge cases** — "training now" sends `null`, which the backend reads as no detraining.
- **Why** — bands rather than a number field: nobody recalls "17 weeks", and the backend tests exactly one threshold (`LONG_DETRAINING_WEEKS = 12`). Each band maps to its **lower bound** so rounding always favours caution. 3–12 months maps to 13, the first value that crosses.
- **Code** — [`onboarding_data.dart:111`](../../../../lib/features/onboarding/models/onboarding_data.dart#L111) — `detrainingDurationWeeks`, `lastConsistentTrainingAt`

### `ONB-6` — the client never claims authority over computed values

- **Effect** — `bmi`, `redFlags`, `target.problems` and `target.inferredNeeds` are not sent as meaningful values (`problems`/`inferredNeeds` go as `[]` only because the DTO requires the arrays to exist).
- **Why** — the backend recomputes them from what it receives and ignores client claims. Sending a client-computed BMI would create two sources of truth for a safety input.
- **Code** — [`profile_mapper.dart:55`](../../../../lib/features/onboarding/data/profile_mapper.dart#L55) — `targetToJson`

### `ONB-7` — the profile must be saved before plan generation starts

- **Trigger** — the review screen's CTA, enabled only once the confirm box is ticked.
- **Effect** — awaits `PUT /profile`, then `reset()`s any prior attempt, kicks off generation, and navigates to `/generating`. Only the profile save is awaited before navigating: generation (`POST /program/generate`) is fire-and-forget. The loading screen **also** calls `ensureStarted()` (`PLAN-3`), so whichever runs first wins and the other is a no-op — this is what makes a reload straight onto `/generating` still generate. The button shows a saving label and is disabled while the save is in flight.
- **Edge cases** — a **save** failure keeps the user on review with every answer intact and a localized message (a 400 shows the backend's own validation text). A **generation** failure surfaces on the loading screen, which routes back to review — see `PLAN-4`. The server generates from the *stored* profile, so the save must land first; sending the answers in the generate request is not the contract.
- **Code** — [`raw_review_screen.dart`](../../../../lib/features/onboarding/presentation/screens/raw_review_screen.dart) — `_submit`

### `ONB-8` — `daysPerWeek` is derived from the selected days, never stored

- **Effect** — `Schedule.daysPerWeek` is `preferredDays.length`, computed at send time.
- **Why** — the prototype kept the two in sync by hand, which drifts.
- **Code** — [`onboarding_data.dart:54`](../../../../lib/features/onboarding/models/onboarding_data.dart#L54)

---

## 4. State held

| Field | Tracks | Mutated by |
|---|---|---|
| `OnboardingData.raw` | the story + goals as typed | `setStory`, `setStatedGoal` |
| `OnboardingData.constraint` | body, injuries, equipment, schedule, diet | the `set*` methods |
| `OnboardingData.target` | `statedGoals`, kept in step with the raw text | `setStatedGoal` |
| `OnboardingData.confirmed` | review checkbox; gates the CTA | `setConfirmed` |

---

## 5. Dependencies

- **Memory** — [`auth`](../auth/auth.md) — the save needs a session (`AUTH-4` supplies the token).
- **Cross-repo** — `PUT /profile` → [backend profile memory](../../../../../my-workout-backend/.claude/memory/features/profile/profile.md).

---

## 6. Known gotchas

- [`computed_rules.dart`](../../../../lib/features/onboarding/models/computed_rules.dart) carries a header warning that everything except the BMI banding is **inferred**, not ported from a spec. It drives client-side guardrail hints only; the backend recomputes authoritatively. Do not let it become a second source of truth.
- The backend's `InjuryArea` union has no `hip`/`elbow`/`neck`/`upper_back` equivalent in the app's `InjuryArea` enum (the readiness gate's `BodyArea` does). They are deliberately different enums.
- `preferredTime` is collected and sent but the backend currently ignores it; it survives in the JSON column.
- `target.problems` is accepted by the DTO but no screen collects it — it belongs to the LLM extraction pipeline.

---

## 7. Change log

- `2026-07-23` — Claude — initial version: 8-step flow, wire mapping, recent-activity/detraining fields, profile save gate.
- `2026-07-24` — Claude — `ONB-7`: submit now also kicks off `POST /program/generate` (awaited on the loading screen) after the profile save, wiring the live program API. See the `plan` memory file.
