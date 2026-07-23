/// Structured choices captured during onboarding.
///
/// These carry no display text — labels are localized and live in
/// `core/l10n/enum_labels.dart`, because a `const` enum cannot reach an
/// `AppLocalizations` instance.
library;

enum Sex { male, female, other }

enum ExperienceLevel { beginner, intermediate, advanced }

/// How much the user has actually moved *recently* — deliberately separate from
/// [ExperienceLevel], because someone with good technique who has not trained
/// in a year still needs an adaptation phase.
enum RecentActivityLevel { veryLow, low, moderate, high }

/// How long since the user last trained consistently.
///
/// A band rather than a free number: people cannot recall "17 weeks", and the
/// backend only tests one threshold (>= 12 weeks triggers a long-detraining
/// adaptation phase), so the extra precision would be false.
enum DetrainingGap {
  /// Currently training — no gap.
  none,
  underMonth,
  oneToThreeMonths,
  threeToTwelveMonths,
  overYear,
}

enum InjuryArea { knee, shoulder, lowerBack, ankle, wrist, other }

enum InjurySeverity { mild, moderate, severe }

enum MobilityLimit { deepSquat, overhead, hipHinge, running }

enum Equipment { dumbbell, resistanceBand, pullupBar, fullGym }

enum TrainingSpace { home, gym, outdoor, minimal }

enum BudgetWillingness { none, minimal, invest }

enum DietType { omnivore, vegetarian, vegan, pescatarian, other }

/// Weekday, Monday-first to match the T2…CN grid on screen 6.
enum Weekday { mon, tue, wed, thu, fri, sat, sun }
