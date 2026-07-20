import 'package:freezed_annotation/freezed_annotation.dart';

import 'enums.dart';

part 'onboarding_data.freezed.dart';
part 'onboarding_data.g.dart';

@freezed
sealed class Account with _$Account {
  const factory Account({@Default('') String email}) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}

/// What the user typed in their own words, before any structuring.
@freezed
sealed class RawInput with _$RawInput {
  const factory RawInput({
    @Default('') String story,
    @Default('') String statedGoal,
  }) = _RawInput;

  factory RawInput.fromJson(Map<String, dynamic> json) =>
      _$RawInputFromJson(json);
}

@freezed
sealed class Injury with _$Injury {
  const factory Injury({
    @Default(InjuryArea.knee) InjuryArea area,
    @Default(InjurySeverity.mild) InjurySeverity severity,
    @Default('') String notes,
    @Default(true) bool active,
  }) = _Injury;

  factory Injury.fromJson(Map<String, dynamic> json) => _$InjuryFromJson(json);
}

@freezed
sealed class Schedule with _$Schedule {
  const Schedule._();

  const factory Schedule({
    @Default({Weekday.mon, Weekday.wed, Weekday.fri}) Set<Weekday> preferredDays,
    @Default(45) int minutesPerSession,
    @Default('18:30') String preferredTime,
  }) = _Schedule;

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);

  /// Derived, never stored — the prototype kept these in sync by hand.
  int get daysPerWeek => preferredDays.length;
}

@freezed
sealed class Diet with _$Diet {
  const factory Diet({
    @Default(DietType.omnivore) DietType type,
    @Default(<String>[]) List<String> allergies,
    @Default(<String>[]) List<String> restrictions,
  }) = _Diet;

  factory Diet.fromJson(Map<String, dynamic> json) => _$DietFromJson(json);
}

/// Hard constraints the plan must respect.
@freezed
sealed class Constraint with _$Constraint {
  const Constraint._();

  const factory Constraint({
    @Default(Sex.male) Sex sex,
    @Default(26) int age,
    @Default(172) double heightCm,
    @Default(49) double weightKg,
    @Default(ExperienceLevel.beginner) ExperienceLevel experienceLevel,
    @Default(false) bool hasInjury,
    @Default(<Injury>[]) List<Injury> injuries,
    @Default(<MobilityLimit>{}) Set<MobilityLimit> mobilityLimits,
    @Default(<Equipment>{}) Set<Equipment> equipment,
    @Default(TrainingSpace.home) TrainingSpace space,
    @Default(BudgetWillingness.none) BudgetWillingness budgetWillingness,
    @Default(Schedule()) Schedule schedule,
    @Default(Diet()) Diet diet,
  }) = _Constraint;

  factory Constraint.fromJson(Map<String, dynamic> json) =>
      _$ConstraintFromJson(json);

  /// Computed rather than stored, so it can never drift from its inputs.
  double? get bmi {
    if (heightCm <= 0 || weightKg <= 0) return null;
    final m = heightCm / 100;
    return weightKg / (m * m);
  }

  /// Only injuries still causing symptoms constrain programming.
  Iterable<Injury> get activeInjuries =>
      hasInjury ? injuries.where((i) => i.active) : const [];
}

/// Goals as stated by the user. `problems`, `inferredNeeds` and `goalPriority`
/// are populated by the plan pipeline, not by the onboarding form.
@freezed
sealed class Target with _$Target {
  const factory Target({
    @Default(<String>[]) List<String> statedGoals,
  }) = _Target;

  factory Target.fromJson(Map<String, dynamic> json) => _$TargetFromJson(json);
}

/// Root of everything collected across the 8 onboarding steps.
@freezed
sealed class OnboardingData with _$OnboardingData {
  const OnboardingData._();

  const factory OnboardingData({
    @Default(Account()) Account account,
    @Default(RawInput()) RawInput raw,
    @Default(Constraint()) Constraint constraint,
    @Default(Target()) Target target,
    @Default(false) bool confirmed,
  }) = _OnboardingData;

  factory OnboardingData.fromJson(Map<String, dynamic> json) =>
      _$OnboardingDataFromJson(json);

  /// One goal per line, blank lines dropped.
  List<String> get goalLines => raw.statedGoal
      .split('\n')
      .map((line) => line.trim())
      .where((line) => line.isNotEmpty)
      .toList();
}
