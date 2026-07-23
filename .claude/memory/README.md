# `.claude/memory/` — Business-Logic Memory

The persistent **business-logic memory** for this repo. It stores the "what should this do" for every feature and flow whose behaviour is non-trivial.

Each entry captures **two things**:

1. **The business logic** — the rules the unit owns, in plain language: trigger, condition, effect, edge cases. Written so a non-engineer can read it.
2. **The business-to-code mapping** — for each rule, the file and symbol where it lives *today*. So when a rule changes, you know exactly which code to touch — and when code changes, which rule to re-check.

This is the source of truth an agent reads at the start of any task touching the unit, and writes back to after a behaviour change.

---

## Why this folder exists

The rules in this app are spread thin and are easy to lose:

- The wire contract between app enums and the backend's snake_case unions lives only in [profile_mapper.dart](../../lib/features/onboarding/data/profile_mapper.dart) and [practice_mapper.dart](../../lib/features/practice/data/practice_mapper.dart). Get it wrong and the request still *validates* — it just silently does the wrong thing.
- Safety-critical defaults (skipping the readiness gate caps volume at 70%) live in the backend but are *triggered* by a choice on a mobile screen.
- Derivations like "3–12 months since training → 13 weeks" encode a backend threshold (`LONG_DETRAINING_WEEKS = 12`) that nothing in the mobile code names.

Without a memory layer every task starts by re-deriving these from two codebases. The rules that only ever existed in someone's head get lost.

**Rule of thumb:** if a bullet would take 300+ lines of reading (or a trip into the *other* repo) to rediscover, it belongs here. If `grep` finds it in seconds, it does not.

---

## What goes here (and what doesn't)

### ✅ Goes here

- **Business rules** — every trigger / condition / effect / edge case.
- **Flow** — the order of steps in a multi-screen or multi-request sequence, and what happens when one step fails.
- **Cross-repo contracts** — the exact shape and vocabulary the backend expects, and *why* it differs from the app's own types.
- **Domain invariants** — "a pain-stop halts the session whether or not the user describes the pain".
- **The code mapping** — for each rule, where it lives today.

### ❌ Does not go here

- File paths or function signatures on their own (those are in source).
- Project conventions, commands, environment (those are in [CLAUDE.md](../../CLAUDE.md)).
- Architectural rules (those are in [.claude/rules/](../rules/)).
- In-flight task state (use a plan file or the PR description).

---

## Folder layout

One folder per unit; the live spec inside is `<unit>.md`.

```
.claude/memory/
├── README.md            # this file
├── TEMPLATE.md          # start any new memory file from this
├── features/
│   ├── auth/auth.md
│   ├── onboarding/onboarding.md
│   └── practice/practice.md
└── cross-cutting/
    └── api_contract/api_contract.md   # rules spanning features
```

- The folder name matches the feature directory under [lib/features/](../../lib/features/) where reasonable.
- `cross-cutting/` holds rules that no single feature owns — the API contract, networking, navigation gating.

---

## File format

Every file follows [TEMPLATE.md](TEMPLATE.md). Required sections, in order:

1. **Header** — `unit`, `kind`, `status`, `source_paths`, `last_updated`.
2. **Purpose** — one or two sentences.
3. **Flow** — the step sequence, when the unit spans more than one screen or request.
4. **Business logic** — the most important section. One numbered rule per entry, each with Trigger / Condition / Effect / Edge cases / Code mapping. Numbered (`AUTH-1`, `AUTH-2`, …) so tests and other memory files can cite them.
5. **State held** — for stateful units: what each field tracks and who mutates it.
6. **Dependencies** — other memory files, repositories, services this unit talks to.
7. **Known gotchas** — hacks, dead branches, behaviour that looks like a bug but is not.
8. **Change log** — append-only `YYYY-MM-DD — who — what changed and why`.

Rules are numbered because they are the unit of citation. A test, a code comment, or a backend memory file can say "enforces AUTH-4" and that is unambiguous.

---

## How it is used

**Starting a task that touches a unit:** read `<unit>.md` first. Treat its business-logic section as the working hypothesis, then verify against the source:

- Rule matches code → proceed on it.
- Rule drifted → the code is the truth; fix the memory as part of the change.
- Memory has a rule the code does not → either dead memory or a lost feature. Ask.

**Finishing a task:** if behaviour or mapping changed, update the file in the same commit. See [.claude/rules/memory_file_sync.md](../rules/memory_file_sync.md) — this is not optional.

**Finding a rule:** `grep -r "readiness" .claude/memory/` should find every place it is documented, in either repo.

---

## Relationship to the backend's memory

[my-workout-backend](../../../my-workout-backend/.claude/memory/) has the same structure. The two are peers, not copies:

- The mobile file owns what the **user sees and chooses**.
- The backend file owns what the **server computes and enforces**.
- Where a rule spans both (the readiness gate, the profile wire contract), each file states its own half and links to the other.

When a rule moves between them — logic pushed from client to server or back — both files change in the same PR.
