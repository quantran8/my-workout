# Visual Design System

Design principles, tokens and component specs for the AI Fitness Coach app. True-black iOS-flavoured surfaces with a single acid-lime accent. Mobile-first (390–430px).

Tokens live in [lib/core/theme/tokens.dart](lib/core/theme/tokens.dart) and [lib/core/theme/typography.dart](lib/core/theme/typography.dart); this document is the rationale behind them.

---

## 1. Design & interaction principles

- **Narrative before forms.** People describe their situation in their own words before any structured input appears. Being heard precedes data entry.
- **Forms confirm, they don't interrogate.** Fields arrive prefilled where possible and are framed as _checking and correcting_, not filling from blank.
- **Ask, don't assume.** Anything that matters is asked explicitly with its own control. Absence of a mention is never rendered as an answer.
- **Confirm before consequence.** Before an action with real consequences, the user reviews their inputs and explicitly confirms. No silent skip on that step.
- **One concern per screen.** Each step covers a single topic, led by a two-line display headline.
- **Few words.** Copy is short enough to read at a glance; no internal jargon (no "protocol", "phase 2 hypertrophy", "RPE" without explanation).
- **Show state honestly.** The UI is transparent about what has and hasn't happened; fine print reassures rather than hides.
- **Calm, low-chrome surfaces.** Black surfaces, one dominant accent, restrained borders. Colour marks what is actionable.

---

## 2. Color

### Surfaces & neutrals

| Token      | Hex       | Role                                     |
| ---------- | --------- | ---------------------------------------- |
| `bg`       | `#000000` | App background — true black              |
| `stage`    | `#070707` | Page behind the device frame (web demo)  |
| `surface`  | `#1C1C1E` | Card, field and chip surface             |
| `surface2` | `#242426` | Raised surface — dropdown menus          |
| `line`     | `rgba(255,255,255,.09)` | Hairline borders           |

### Text

Fixed greys rather than white-at-opacity, so contrast is predictable over any surface.

| Token      | Hex       | Use                        |
| ---------- | --------- | -------------------------- |
| `text`     | `#FFFFFF` | Primary                    |
| `textSoft` | `#D1D1D6` | Body copy on cards         |
| `muted`    | `#8E8E93` | Secondary, captions        |
| `muted2`   | `#636366` | Fine print, hints          |

### Accents

| Token    | Hex       | Meaning                                          |
| -------- | --------- | ------------------------------------------------ |
| `lime`   | `#D7FF45` | Primary — CTAs, active/selected, progress        |
| `pink`   | `#FF375F` | Warning / safety / destructive                   |
| `cyan`   | `#63E6D5` | Secondary accent                                 |
| `violet` | `#A78BFA` | AI / inference                                   |
| `green`  | `#30D158` | Switch "on" (iOS system green)                   |

**Selection reads as inversion.** A selected chip or segment fills **white with black text** — not an accent tint. Lime is reserved for the primary CTA, the active day, and progress, so it never competes with selection state.

---

## 3. Typography

**Family:** platform default — SF Pro on iOS, Roboto on Android. Both cover Vietnamese diacritics; no font is bundled.

| Style           | Size | Weight | Tracking   | Notes                                    |
| --------------- | ---- | ------ | ---------- | ---------------------------------------- |
| Screen title    | 36px | 700    | −0.052em   | line-height 1.04, two lines with a break |
| Plan hero       | 25px | 700    | −0.035em   | line-height 1.1                          |
| Loading title   | 28px | 700    | −0.04em    |                                          |
| Eyebrow         | 12px | 700    | +0.12em    | uppercase, coloured by section           |
| Subtitle        | 15px | 400    | —          | line-height 1.5, `muted`, max 355px      |
| Body            | 14px | 400    | —          | line-height 1.5, `textSoft`              |
| Section title   | 13px | 700    | —          | group heading between cards              |
| Field label     | 13px | 600    | —          | sentence case, **not** uppercase         |
| Input           | 16px | 400    | —          | 16px avoids iOS zoom-on-focus            |
| Fine print      | 11px | 400    | —          | `muted2`                                 |

Two Flutter-specific notes:
- CSS tracking is in `em`; `letterSpacing` is logical pixels, so `letterSpacing = em × fontSize`.
- Display styles set `leadingDistribution: TextLeadingDistribution.even` — at line-height 1.04, Vietnamese diacritics (ạ, ộ, ế) clip without it.

---

## 4. Shape & spacing

| Property         | Value                                    |
| ---------------- | ---------------------------------------- |
| Card radius      | 22px (24px for the plan hero)            |
| Field radius     | 18px                                     |
| Button radius    | 17px                                     |
| Segment track    | 16px outer, 12px per item                |
| Chip / switch    | 999px (full pill)                        |
| Day toggle       | Circle (`aspect-ratio: 1`)               |
| Card padding     | 16px                                     |
| Screen padding   | 20px horizontal, 24px top                |
| Scroll bottom    | 132px, clearing the floating footer      |

**Borders:** 1px `line`. Accent-tinted borders (`lime/60` when selected, `lime/18` on the plan hero) mark state and category.

**No ambient glows.** Earlier revisions layered radial gradients on the app background; surfaces are now flat, and colour is reserved for accents.

---

## 5. Motion

| Animation             | Spec                                                     |
| --------------------- | -------------------------------------------------------- |
| Screen enter          | fade + 12px slide from the right, 280ms `cubic-bezier(.22,.8,.3,1)` |
| Card cascade          | 450ms rise, staggered 60ms per card                      |
| Loader ring           | conic lime→cyan→violet, spin 1.25s linear                |
| Loading dots          | 3 dots, 1.2s bob, staggered 0 / .125 / .25               |
| Stage complete        | border/bg flip to lime tint, filled tick, 250ms          |
| Progress bar          | width 350ms ease                                         |
| Switch                | 200ms track colour + knob slide                          |
| Button press          | `scale(.985)`, 150ms                                     |

Staggered entrances extend the controller's duration and hold at zero through an `Interval` rather than scheduling a `Future.delayed` — a free-standing timer leaks if the widget is torn down mid-delay, which surfaces as a pending-timer failure in tests.

---

## 6. Components

| Component        | Spec                                                                             |
| ---------------- | -------------------------------------------------------------------------------- |
| Primary button   | Full width, min 54px, radius 17, lime bg / black text, weight 700. Disabled = 28% opacity. Variants: `lime` (default), `white` (Apple sign-in), `surface` (secondary). |
| Back button      | 44px hit target, transparent, chevron; 8% white wash while pressed.               |
| Floating footer  | Gradient scrim (transparent → black), padding `14px 20px`, respects the home-indicator inset. Content scrolls under it. |
| Segmented control| Surface track, 4px padding, 42px items. Active = **white fill, black text**.      |
| Chip             | Pill, min 42px, 14px horizontal. Selected = **white fill, black text**.           |
| Chip group       | Multi-select with a mutually exclusive "none" option — selecting it clears the rest; emptying the set falls back to it. |
| Choice row       | Icon tile + title + subtitle, min 62px. Selected = lime tint + `lime/60` border. Used where a dropdown would hide meaningful differences between options. |
| Day toggle       | 7 circles across, `aspect-ratio: 1`. Active = lime fill, black text, weight 800.  |
| Switch           | 50×30 track, 24px knob. On = system green.                                        |
| Field            | Surface fill, radius 18, 16px text. Focus = `lime/55` border + 4px `lime/08` ring. |
| Unit input       | Number field with a trailing unit label inside the field's right padding.         |
| Summary group    | Bordered card of label/value rows with internal hairlines; value right-aligned, weight 600. |
| Stage check      | Pipeline row that flips to lime-tinted with a filled tick on completion.           |
| Metric tile      | Centred number over a caption on a `black/28` fill.                               |
| Toast            | Bottom white pill, slides up, auto-hides at 1.8s. Hosted once above the router.   |
