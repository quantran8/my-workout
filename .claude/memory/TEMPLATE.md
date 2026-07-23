<!--
  Start every new memory file from this template. Delete this comment and any
  section that genuinely does not apply (say so explicitly rather than leaving
  an empty heading).

  Naming: .claude/memory/features/<feature>/<feature>.md
  Rule ids: <FEATURE>-<n>, uppercase, e.g. AUTH-1. Never renumber an existing
  rule — retire it instead (see below), because tests and other memory files
  cite these ids.

  Language: English prose. Keep code identifiers, file paths and wire values
  verbatim.
-->

# `<unit name>` — business logic

| | |
|---|---|
| **unit** | `<feature path, e.g. lib/features/auth>` |
| **kind** | `<feature \| cross-cutting \| component>` |
| **status** | `live` |
| **last_updated** | `YYYY-MM-DD` |

**Source paths**

- [`<path/to/main.dart>`](../../../<path/to/main.dart>) — `<what it holds>`
- [`<path/to/other.dart>`](../../../<path/to/other.dart>) — `<what it holds>`

---

## 1. Purpose

One or two sentences: what this unit does *in the product*, not how it is built.

---

## 2. Flow

The step sequence, when the unit spans more than one screen or request. Say what
happens when a step fails or is skipped — that is usually the part nobody
remembers.

```
1. <step>            → <what it produces>
2. <step>            → <what it produces>
   ↳ on failure:     <what the user sees, what state survives>
```

Omit this section for a single-screen unit with no sequence, and say so.

---

## 3. Business logic

One entry per rule. **Trigger / Condition / Effect** are mandatory; the rest are
included when they apply.

### `<FEATURE>-1` — one-sentence statement of the rule

- **Trigger** — what starts it (UI event, request, lifecycle, timer).
- **Condition** — when it applies; when it does not.
- **Effect** — what changes: state, navigation, persistence, a network call.
- **Edge cases** — empty / null / error / offline / expired / permission denied /
  race. One bullet each.
- **Why** — only when the rule would look arbitrary otherwise (a threshold, a
  deliberate asymmetry, a workaround for another system's behaviour).
- **Code** — `` [`<file>.dart:42`](<relative path to lib/.../file.dart>#L42) `` — `symbolName`

### `<FEATURE>-2` — …

**Retiring a rule:** keep the id and heading, prefix the heading with
`[RETIRED YYYY-MM-DD]`, and replace the body with one line saying what replaced
it. Never reuse the number.

---

## 4. State held

Only for stateful units.

| Field | Tracks | Mutated by |
|---|---|---|
| `<name>` | `<what it means>` | `<method / event>` |

---

## 5. Dependencies

- **Memory** — [`<other unit>`](../<other>/<other>.md) — `<what it relies on it for>`
- **Services** — `<repository / provider / client>` — `<what it calls>`
- **Cross-repo** — `<endpoint or contract>` — link to the peer repo's memory file

---

## 6. Known gotchas

Things a future reader would otherwise rediscover the hard way: hacks, dead
branches, behaviour that looks like a bug but is not, and traps that cost time
once already.

---

## 7. Change log

Append-only. Newest last.

- `YYYY-MM-DD` — `<who>` — initial version.
