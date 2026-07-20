import '../../features/onboarding/models/enums.dart';
import '../../l10n/app_localizations.dart';

/// Localized display text for the onboarding enums.
///
/// The enums themselves are bare — a `const` enum can't reach an
/// [AppLocalizations] instance, so labels resolve here at the call site. Each
/// switch is exhaustive, so adding an enum value is a compile error until it is
/// translated.

extension SexL10n on Sex {
  String label(AppLocalizations t) => switch (this) {
    Sex.male => t.sexMale,
    Sex.female => t.sexFemale,
    Sex.other => t.sexOther,
  };
}

extension ExperienceLevelL10n on ExperienceLevel {
  String label(AppLocalizations t) => switch (this) {
    ExperienceLevel.beginner => t.experienceBeginner,
    ExperienceLevel.intermediate => t.experienceIntermediate,
    ExperienceLevel.advanced => t.experienceAdvanced,
  };
}

extension InjuryAreaL10n on InjuryArea {
  String label(AppLocalizations t) => switch (this) {
    InjuryArea.knee => t.injuryAreaKnee,
    InjuryArea.shoulder => t.injuryAreaShoulder,
    InjuryArea.lowerBack => t.injuryAreaLowerBack,
    InjuryArea.ankle => t.injuryAreaAnkle,
    InjuryArea.wrist => t.injuryAreaWrist,
    InjuryArea.other => t.injuryAreaOther,
  };
}

extension InjurySeverityL10n on InjurySeverity {
  String label(AppLocalizations t) => switch (this) {
    InjurySeverity.mild => t.severityMild,
    InjurySeverity.moderate => t.severityModerate,
    InjurySeverity.severe => t.severitySevere,
  };
}

extension MobilityLimitL10n on MobilityLimit {
  String label(AppLocalizations t) => switch (this) {
    MobilityLimit.deepSquat => t.mobilityDeepSquat,
    MobilityLimit.overhead => t.mobilityOverhead,
    MobilityLimit.hipHinge => t.mobilityHipHinge,
    MobilityLimit.running => t.mobilityRunning,
  };
}

extension EquipmentL10n on Equipment {
  String label(AppLocalizations t) => switch (this) {
    Equipment.dumbbell => t.equipmentDumbbell,
    Equipment.resistanceBand => t.equipmentResistanceBand,
    Equipment.pullupBar => t.equipmentPullupBar,
    Equipment.fullGym => t.equipmentFullGym,
  };
}

extension TrainingSpaceL10n on TrainingSpace {
  String label(AppLocalizations t) => switch (this) {
    TrainingSpace.home => t.spaceHome,
    TrainingSpace.gym => t.spaceGym,
    TrainingSpace.outdoor => t.spaceOutdoor,
    TrainingSpace.minimal => t.spaceMinimal,
  };
}

extension BudgetWillingnessL10n on BudgetWillingness {
  String label(AppLocalizations t) => switch (this) {
    BudgetWillingness.none => t.budgetNone,
    BudgetWillingness.minimal => t.budgetMinimal,
    BudgetWillingness.invest => t.budgetInvest,
  };
}

extension DietTypeL10n on DietType {
  String label(AppLocalizations t) => switch (this) {
    DietType.omnivore => t.dietOmnivore,
    DietType.vegetarian => t.dietVegetarian,
    DietType.vegan => t.dietVegan,
    DietType.pescatarian => t.dietPescatarian,
    DietType.other => t.dietOther,
  };
}

extension WeekdayL10n on Weekday {
  /// Short form for the 7-across grid (T2…CN / Mon…Sun).
  String shortLabel(AppLocalizations t) => switch (this) {
    Weekday.mon => t.weekdayMonShort,
    Weekday.tue => t.weekdayTueShort,
    Weekday.wed => t.weekdayWedShort,
    Weekday.thu => t.weekdayThuShort,
    Weekday.fri => t.weekdayFriShort,
    Weekday.sat => t.weekdaySatShort,
    Weekday.sun => t.weekdaySunShort,
  };
}

extension BudgetWillingnessShortL10n on BudgetWillingness {
  /// Condensed label for the segmented control, where the full sentence used
  /// in the review summary would not fit.
  String shortLabel(AppLocalizations t) => switch (this) {
    BudgetWillingness.none => t.budgetNoneShort,
    BudgetWillingness.minimal => t.budgetMinimalShort,
    BudgetWillingness.invest => t.budgetInvestShort,
  };
}
