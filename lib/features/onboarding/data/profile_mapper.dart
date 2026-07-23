import '../models/enums.dart';
import '../models/onboarding_data.dart';

/// Maps [OnboardingData] onto the backend's `Profile` wire shape
/// (`profile.types.ts`).
///
/// A raw `toJson()` would not do: the app serializes enums in camelCase
/// (`lowerBack`), while the backend's unions are snake_case (`lower_back`), and
/// several fields it reads (`daysPerWeek`, `bmi`, `injuries[].status`) are
/// derived rather than stored.
///
/// Fields the backend computes itself — `bmi`, `redFlags`, `target.problems`,
/// `target.inferredNeeds` — are deliberately not sent as authoritative: the
/// service recomputes them and ignores anything the client claims.
abstract final class ProfileMapper {
  /// [now] is injected rather than read from the clock so the payload is
  /// reproducible in tests; it only anchors `lastConsistentTrainingAt`.
  static Map<String, dynamic> constraintToJson(Constraint c, DateTime now) => {
    'sex': _sex(c.sex),
    'age': c.age,
    'heightCm': c.heightCm,
    'weightKg': c.weightKg,
    'experienceLevel': _experience(c.experienceLevel),
    // §1.2 — kept separate from experienceLevel on purpose: these three drive
    // the adaptation phase, which caps volume and difficulty for someone
    // returning after a long break regardless of how skilled they are.
    'recentActivityLevel': _recentActivity(c.recentActivityLevel),
    'detrainingDurationWeeks': c.detrainingDurationWeeks,
    'lastConsistentTrainingAt': c.lastConsistentTrainingAt(now),
    // Only injuries the user marked as still symptomatic constrain the plan.
    // `hasInjury: false` clears the list, so this reads empty in that case.
    'injuries': [
      for (final injury in c.hasInjury ? c.injuries : const <Injury>[])
        _injuryToJson(injury),
    ],
    'mobilityLimits': [for (final m in c.mobilityLimits) _mobility(m)],
    'equipment': [for (final e in c.equipment) _equipment(e)],
    'space': _space(c.space),
    'budgetWillingness': _budget(c.budgetWillingness),
    'schedule': {
      // Derived on the client — the backend reads it but never receives it
      // from the form directly.
      'daysPerWeek': c.schedule.daysPerWeek,
      'minutesPerSession': c.schedule.minutesPerSession,
      'preferredDays': [for (final d in c.schedule.preferredDays) _weekday(d)],
      'preferredTime': c.schedule.preferredTime,
    },
    'diet': {
      'type': _diet(c.diet.type),
      'allergies': c.diet.allergies,
      'restrictions': c.diet.restrictions,
    },
  };

  static Map<String, dynamic> targetToJson(OnboardingData data) => {
    'statedGoals': data.goalLines,
    // Required by the backend's `TargetDto`, which validates them as arrays
    // even when empty. Both are filled in by the extraction pipeline.
    'problems': <String>[],
    'inferredNeeds': <Map<String, dynamic>>[],
  };

  static Map<String, dynamic> profileToJson(
    OnboardingData data, {
    required DateTime now,
  }) => {
    'constraint': constraintToJson(data.constraint, now),
    'target': targetToJson(data),
  };

  static Map<String, dynamic> _injuryToJson(Injury injury) => {
    'area': _injuryArea(injury.area),
    'severity': _severity(injury.severity),
    'notes': injury.notes,
    'active': injury.active,
    // §1.2 — the backend prefers `status` over the `active` boolean. The form
    // only asks "still bothering you?", so it can distinguish these two.
    'status': injury.active ? 'active' : 'historical',
  };

  static String _sex(Sex value) => switch (value) {
    Sex.male => 'male',
    Sex.female => 'female',
    Sex.other => 'other',
  };

  static String _experience(ExperienceLevel value) => switch (value) {
    ExperienceLevel.beginner => 'beginner',
    ExperienceLevel.intermediate => 'intermediate',
    ExperienceLevel.advanced => 'advanced',
  };

  static String _recentActivity(RecentActivityLevel value) => switch (value) {
    RecentActivityLevel.veryLow => 'very_low',
    RecentActivityLevel.low => 'low',
    RecentActivityLevel.moderate => 'moderate',
    RecentActivityLevel.high => 'high',
  };

  /// The backend's `InjuryArea` union is snake_case and has no `other` member,
  /// so an unclassified injury is sent as a free-text-ish `other` — the flags
  /// code only compares it for equality when blocking areas.
  static String _injuryArea(InjuryArea value) => switch (value) {
    InjuryArea.knee => 'knee',
    InjuryArea.shoulder => 'shoulder',
    InjuryArea.lowerBack => 'lower_back',
    InjuryArea.ankle => 'ankle',
    InjuryArea.wrist => 'wrist',
    InjuryArea.other => 'other',
  };

  static String _severity(InjurySeverity value) => switch (value) {
    InjurySeverity.mild => 'mild',
    InjurySeverity.moderate => 'moderate',
    InjurySeverity.severe => 'severe',
  };

  /// `mobilityLimits` is a free-form `string[]` on the backend; snake_case
  /// keeps it consistent with the typed unions beside it.
  static String _mobility(MobilityLimit value) => switch (value) {
    MobilityLimit.deepSquat => 'deep_squat',
    MobilityLimit.overhead => 'overhead',
    MobilityLimit.hipHinge => 'hip_hinge',
    MobilityLimit.running => 'running',
  };

  static String _equipment(Equipment value) => switch (value) {
    Equipment.dumbbell => 'dumbbell',
    Equipment.resistanceBand => 'resistance_band',
    Equipment.pullupBar => 'pullup_bar',
    Equipment.fullGym => 'full_gym',
  };

  static String _space(TrainingSpace value) => switch (value) {
    TrainingSpace.home => 'home',
    TrainingSpace.gym => 'gym',
    TrainingSpace.outdoor => 'outdoor',
    TrainingSpace.minimal => 'minimal',
  };

  static String _budget(BudgetWillingness value) => switch (value) {
    BudgetWillingness.none => 'none',
    BudgetWillingness.minimal => 'minimal',
    BudgetWillingness.invest => 'invest',
  };

  static String _diet(DietType value) => switch (value) {
    DietType.omnivore => 'omnivore',
    DietType.vegetarian => 'vegetarian',
    DietType.vegan => 'vegan',
    DietType.pescatarian => 'pescatarian',
    DietType.other => 'other',
  };

  static String _weekday(Weekday value) => switch (value) {
    Weekday.mon => 'mon',
    Weekday.tue => 'tue',
    Weekday.wed => 'wed',
    Weekday.thu => 'thu',
    Weekday.fri => 'fri',
    Weekday.sat => 'sat',
    Weekday.sun => 'sun',
  };
}
