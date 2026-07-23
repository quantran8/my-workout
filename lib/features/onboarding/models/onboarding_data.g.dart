// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Account _$AccountFromJson(Map<String, dynamic> json) =>
    _Account(email: json['email'] as String? ?? '');

Map<String, dynamic> _$AccountToJson(_Account instance) => <String, dynamic>{
  'email': instance.email,
};

_RawInput _$RawInputFromJson(Map<String, dynamic> json) => _RawInput(
  story: json['story'] as String? ?? '',
  statedGoal: json['statedGoal'] as String? ?? '',
);

Map<String, dynamic> _$RawInputToJson(_RawInput instance) => <String, dynamic>{
  'story': instance.story,
  'statedGoal': instance.statedGoal,
};

_Injury _$InjuryFromJson(Map<String, dynamic> json) => _Injury(
  area:
      $enumDecodeNullable(_$InjuryAreaEnumMap, json['area']) ?? InjuryArea.knee,
  severity:
      $enumDecodeNullable(_$InjurySeverityEnumMap, json['severity']) ??
      InjurySeverity.mild,
  notes: json['notes'] as String? ?? '',
  active: json['active'] as bool? ?? true,
);

Map<String, dynamic> _$InjuryToJson(_Injury instance) => <String, dynamic>{
  'area': _$InjuryAreaEnumMap[instance.area]!,
  'severity': _$InjurySeverityEnumMap[instance.severity]!,
  'notes': instance.notes,
  'active': instance.active,
};

const _$InjuryAreaEnumMap = {
  InjuryArea.knee: 'knee',
  InjuryArea.shoulder: 'shoulder',
  InjuryArea.lowerBack: 'lowerBack',
  InjuryArea.ankle: 'ankle',
  InjuryArea.wrist: 'wrist',
  InjuryArea.other: 'other',
};

const _$InjurySeverityEnumMap = {
  InjurySeverity.mild: 'mild',
  InjurySeverity.moderate: 'moderate',
  InjurySeverity.severe: 'severe',
};

_Schedule _$ScheduleFromJson(Map<String, dynamic> json) => _Schedule(
  preferredDays:
      (json['preferredDays'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$WeekdayEnumMap, e))
          .toSet() ??
      const {Weekday.mon, Weekday.wed, Weekday.fri},
  minutesPerSession: (json['minutesPerSession'] as num?)?.toInt() ?? 45,
  preferredTime: json['preferredTime'] as String? ?? '18:30',
);

Map<String, dynamic> _$ScheduleToJson(_Schedule instance) => <String, dynamic>{
  'preferredDays': instance.preferredDays
      .map((e) => _$WeekdayEnumMap[e]!)
      .toList(),
  'minutesPerSession': instance.minutesPerSession,
  'preferredTime': instance.preferredTime,
};

const _$WeekdayEnumMap = {
  Weekday.mon: 'mon',
  Weekday.tue: 'tue',
  Weekday.wed: 'wed',
  Weekday.thu: 'thu',
  Weekday.fri: 'fri',
  Weekday.sat: 'sat',
  Weekday.sun: 'sun',
};

_Diet _$DietFromJson(Map<String, dynamic> json) => _Diet(
  type:
      $enumDecodeNullable(_$DietTypeEnumMap, json['type']) ?? DietType.omnivore,
  allergies:
      (json['allergies'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  restrictions:
      (json['restrictions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
);

Map<String, dynamic> _$DietToJson(_Diet instance) => <String, dynamic>{
  'type': _$DietTypeEnumMap[instance.type]!,
  'allergies': instance.allergies,
  'restrictions': instance.restrictions,
};

const _$DietTypeEnumMap = {
  DietType.omnivore: 'omnivore',
  DietType.vegetarian: 'vegetarian',
  DietType.vegan: 'vegan',
  DietType.pescatarian: 'pescatarian',
  DietType.other: 'other',
};

_Constraint _$ConstraintFromJson(Map<String, dynamic> json) => _Constraint(
  sex: $enumDecodeNullable(_$SexEnumMap, json['sex']) ?? Sex.male,
  age: (json['age'] as num?)?.toInt() ?? 26,
  heightCm: (json['heightCm'] as num?)?.toDouble() ?? 172,
  weightKg: (json['weightKg'] as num?)?.toDouble() ?? 49,
  experienceLevel:
      $enumDecodeNullable(_$ExperienceLevelEnumMap, json['experienceLevel']) ??
      ExperienceLevel.beginner,
  recentActivityLevel:
      $enumDecodeNullable(
        _$RecentActivityLevelEnumMap,
        json['recentActivityLevel'],
      ) ??
      RecentActivityLevel.low,
  detrainingGap:
      $enumDecodeNullable(_$DetrainingGapEnumMap, json['detrainingGap']) ??
      DetrainingGap.none,
  hasInjury: json['hasInjury'] as bool? ?? false,
  injuries:
      (json['injuries'] as List<dynamic>?)
          ?.map((e) => Injury.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Injury>[],
  mobilityLimits:
      (json['mobilityLimits'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$MobilityLimitEnumMap, e))
          .toSet() ??
      const <MobilityLimit>{},
  equipment:
      (json['equipment'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$EquipmentEnumMap, e))
          .toSet() ??
      const <Equipment>{},
  space:
      $enumDecodeNullable(_$TrainingSpaceEnumMap, json['space']) ??
      TrainingSpace.home,
  budgetWillingness:
      $enumDecodeNullable(
        _$BudgetWillingnessEnumMap,
        json['budgetWillingness'],
      ) ??
      BudgetWillingness.none,
  schedule: json['schedule'] == null
      ? const Schedule()
      : Schedule.fromJson(json['schedule'] as Map<String, dynamic>),
  diet: json['diet'] == null
      ? const Diet()
      : Diet.fromJson(json['diet'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ConstraintToJson(
  _Constraint instance,
) => <String, dynamic>{
  'sex': _$SexEnumMap[instance.sex]!,
  'age': instance.age,
  'heightCm': instance.heightCm,
  'weightKg': instance.weightKg,
  'experienceLevel': _$ExperienceLevelEnumMap[instance.experienceLevel]!,
  'recentActivityLevel':
      _$RecentActivityLevelEnumMap[instance.recentActivityLevel]!,
  'detrainingGap': _$DetrainingGapEnumMap[instance.detrainingGap]!,
  'hasInjury': instance.hasInjury,
  'injuries': instance.injuries,
  'mobilityLimits': instance.mobilityLimits
      .map((e) => _$MobilityLimitEnumMap[e]!)
      .toList(),
  'equipment': instance.equipment.map((e) => _$EquipmentEnumMap[e]!).toList(),
  'space': _$TrainingSpaceEnumMap[instance.space]!,
  'budgetWillingness': _$BudgetWillingnessEnumMap[instance.budgetWillingness]!,
  'schedule': instance.schedule,
  'diet': instance.diet,
};

const _$SexEnumMap = {
  Sex.male: 'male',
  Sex.female: 'female',
  Sex.other: 'other',
};

const _$ExperienceLevelEnumMap = {
  ExperienceLevel.beginner: 'beginner',
  ExperienceLevel.intermediate: 'intermediate',
  ExperienceLevel.advanced: 'advanced',
};

const _$RecentActivityLevelEnumMap = {
  RecentActivityLevel.veryLow: 'veryLow',
  RecentActivityLevel.low: 'low',
  RecentActivityLevel.moderate: 'moderate',
  RecentActivityLevel.high: 'high',
};

const _$DetrainingGapEnumMap = {
  DetrainingGap.none: 'none',
  DetrainingGap.underMonth: 'underMonth',
  DetrainingGap.oneToThreeMonths: 'oneToThreeMonths',
  DetrainingGap.threeToTwelveMonths: 'threeToTwelveMonths',
  DetrainingGap.overYear: 'overYear',
};

const _$MobilityLimitEnumMap = {
  MobilityLimit.deepSquat: 'deepSquat',
  MobilityLimit.overhead: 'overhead',
  MobilityLimit.hipHinge: 'hipHinge',
  MobilityLimit.running: 'running',
};

const _$EquipmentEnumMap = {
  Equipment.dumbbell: 'dumbbell',
  Equipment.resistanceBand: 'resistanceBand',
  Equipment.pullupBar: 'pullupBar',
  Equipment.fullGym: 'fullGym',
};

const _$TrainingSpaceEnumMap = {
  TrainingSpace.home: 'home',
  TrainingSpace.gym: 'gym',
  TrainingSpace.outdoor: 'outdoor',
  TrainingSpace.minimal: 'minimal',
};

const _$BudgetWillingnessEnumMap = {
  BudgetWillingness.none: 'none',
  BudgetWillingness.minimal: 'minimal',
  BudgetWillingness.invest: 'invest',
};

_Target _$TargetFromJson(Map<String, dynamic> json) => _Target(
  statedGoals:
      (json['statedGoals'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
);

Map<String, dynamic> _$TargetToJson(_Target instance) => <String, dynamic>{
  'statedGoals': instance.statedGoals,
};

_OnboardingData _$OnboardingDataFromJson(Map<String, dynamic> json) =>
    _OnboardingData(
      account: json['account'] == null
          ? const Account()
          : Account.fromJson(json['account'] as Map<String, dynamic>),
      raw: json['raw'] == null
          ? const RawInput()
          : RawInput.fromJson(json['raw'] as Map<String, dynamic>),
      constraint: json['constraint'] == null
          ? const Constraint()
          : Constraint.fromJson(json['constraint'] as Map<String, dynamic>),
      target: json['target'] == null
          ? const Target()
          : Target.fromJson(json['target'] as Map<String, dynamic>),
      confirmed: json['confirmed'] as bool? ?? false,
    );

Map<String, dynamic> _$OnboardingDataToJson(_OnboardingData instance) =>
    <String, dynamic>{
      'account': instance.account,
      'raw': instance.raw,
      'constraint': instance.constraint,
      'target': instance.target,
      'confirmed': instance.confirmed,
    };
