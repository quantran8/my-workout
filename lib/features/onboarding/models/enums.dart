/// Structured choices captured during onboarding.
///
/// These carry no display text — labels are localized and live in
/// `core/l10n/enum_labels.dart`, because a `const` enum cannot reach an
/// `AppLocalizations` instance.
library;

enum Sex { male, female, other }

enum ExperienceLevel { beginner, intermediate, advanced }

enum InjuryArea { knee, shoulder, lowerBack, ankle, wrist, other }

enum InjurySeverity { mild, moderate, severe }

enum MobilityLimit { deepSquat, overhead, hipHinge, running }

enum Equipment { dumbbell, resistanceBand, pullupBar, fullGym }

enum TrainingSpace { home, gym, outdoor, minimal }

enum BudgetWillingness { none, minimal, invest }

enum DietType { omnivore, vegetarian, vegan, pescatarian, other }

/// Weekday, Monday-first to match the T2…CN grid on screen 6.
enum Weekday { mon, tue, wed, thu, fri, sat, sun }
