// APPROXIMATION — REVIEW BEFORE TRUSTING.
//
// The prototype's computeRules() was truncated in the source this was ported
// from, so everything below except the BMI banding is inference: the volume
// caps, the injury -> contraindication mapping, and the days-per-week clamp.
// The BMI bands are settled (WHO international cutoffs, 18.5 / 25 / 30).
//
// These values drive guardrails, so they should be checked by someone who knows
// the domain before this ships as anything more than a demo.

import 'enums.dart';
import 'onboarding_data.dart';

/// BMI band, using WHO international cutoffs.
enum BmiBand { underweight, normal, overweight, obese }

/// Safety conditions derived from the onboarding answers.
enum SafetyFlag {
  activeInjury,
  severeInjury,
  underweight,
  obese,
  lowMobility,
  noEquipment,
}

/// Movement patterns to avoid, derived from injuries and mobility limits.
enum MovementPattern {
  deepSquat,
  lunge,
  overheadPress,
  deadlift,
  goodMorning,
  running,
  jumping,
  pushup,
  pullup,
}

/// Code-derived guardrails the generated plan must respect.
///
/// Computed from [OnboardingData] rather than stored, so it can never drift
/// from the answers it came from.
class ComputedRules {
  const ComputedRules({
    required this.bmi,
    required this.band,
    required this.safetyFlags,
    required this.contraindicated,
    required this.weeklySetCap,
    required this.recommendedDaysPerWeek,
    required this.minutesPerSession,
  });

  final double? bmi;
  final BmiBand? band;
  final Set<SafetyFlag> safetyFlags;
  final Set<MovementPattern> contraindicated;

  /// Sets per muscle group per week.
  final int weeklySetCap;

  final int recommendedDaysPerWeek;
  final int minutesPerSession;

  bool get hasSafetyConcern => safetyFlags.isNotEmpty;
}

ComputedRules computeRules(OnboardingData data) {
  final c = data.constraint;
  final bmi = c.bmi;

  final band = switch (bmi) {
    null => null,
    final v when v < 18.5 => BmiBand.underweight,
    final v when v < 25 => BmiBand.normal,
    final v when v < 30 => BmiBand.overweight,
    _ => BmiBand.obese,
  };

  final flags = <SafetyFlag>{};
  final contraindicated = <MovementPattern>{};

  final active = c.activeInjuries.toList();
  if (active.isNotEmpty) flags.add(SafetyFlag.activeInjury);
  if (active.any((i) => i.severity == InjurySeverity.severe)) {
    flags.add(SafetyFlag.severeInjury);
  }

  for (final injury in active) {
    contraindicated.addAll(_patternsForArea(injury.area));
  }
  for (final limit in c.mobilityLimits) {
    contraindicated.addAll(_patternsForMobility(limit));
  }

  if (c.mobilityLimits.isNotEmpty) flags.add(SafetyFlag.lowMobility);
  if (c.equipment.isEmpty) flags.add(SafetyFlag.noEquipment);
  if (band == BmiBand.underweight) flags.add(SafetyFlag.underweight);
  if (band == BmiBand.obese) flags.add(SafetyFlag.obese);

  // Base volume by experience, reduced when injuries are in play.
  var setCap = switch (c.experienceLevel) {
    ExperienceLevel.beginner => 10,
    ExperienceLevel.intermediate => 16,
    ExperienceLevel.advanced => 22,
  };
  if (flags.contains(SafetyFlag.activeInjury)) setCap = (setCap * 0.7).round();
  if (flags.contains(SafetyFlag.severeInjury)) setCap = (setCap * 0.8).round();

  // Never schedule more days than experience supports, or than the user offered.
  final experienceCap = switch (c.experienceLevel) {
    ExperienceLevel.beginner => 3,
    ExperienceLevel.intermediate => 5,
    ExperienceLevel.advanced => 6,
  };
  final chosen = c.schedule.daysPerWeek;
  final days = chosen == 0 ? 0 : (chosen < experienceCap ? chosen : experienceCap);

  return ComputedRules(
    bmi: bmi,
    band: band,
    safetyFlags: flags,
    contraindicated: contraindicated,
    weeklySetCap: setCap,
    recommendedDaysPerWeek: days,
    minutesPerSession: c.schedule.minutesPerSession,
  );
}

Set<MovementPattern> _patternsForArea(InjuryArea area) => switch (area) {
  InjuryArea.knee => {
    MovementPattern.deepSquat,
    MovementPattern.lunge,
    MovementPattern.running,
    MovementPattern.jumping,
  },
  InjuryArea.shoulder => {
    MovementPattern.overheadPress,
    MovementPattern.pullup,
    MovementPattern.pushup,
  },
  InjuryArea.lowerBack => {
    MovementPattern.deadlift,
    MovementPattern.goodMorning,
    MovementPattern.deepSquat,
  },
  InjuryArea.ankle => {
    MovementPattern.running,
    MovementPattern.jumping,
    MovementPattern.lunge,
  },
  InjuryArea.wrist => {MovementPattern.pushup, MovementPattern.pullup},
  InjuryArea.other => const <MovementPattern>{},
};

Set<MovementPattern> _patternsForMobility(MobilityLimit limit) =>
    switch (limit) {
      MobilityLimit.deepSquat => {MovementPattern.deepSquat},
      MobilityLimit.overhead => {MovementPattern.overheadPress},
      MobilityLimit.hipHinge => {
        MovementPattern.deadlift,
        MovementPattern.goodMorning,
      },
      MobilityLimit.running => {
        MovementPattern.running,
        MovementPattern.jumping,
      },
    };
