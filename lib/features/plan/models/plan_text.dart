import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../l10n/app_localizations.dart';

part 'plan_text.freezed.dart';
part 'plan_text.g.dart';

/// Text inside a generated plan, which can come from two very different places.
///
/// The mock repository returns ARB [PlanText.key]s so the sample plan is fully
/// localized. A real LLM backend returns free text with no key, as
/// [PlanText.raw]. Encoding that in the type stops a bare `String` from meaning
/// "key" under mock and "display text" under the API — a difference that would
/// otherwise surface as raw keys rendered on screen 10 the day the seam is
/// swapped.
@freezed
sealed class PlanText with _$PlanText {
  const factory PlanText.key(String key) = PlanTextKey;

  const factory PlanText.raw(String text) = PlanTextRaw;

  factory PlanText.fromJson(Map<String, dynamic> json) =>
      _$PlanTextFromJson(json);
}

extension PlanTextResolve on PlanText {
  String resolve(AppLocalizations t) => switch (this) {
    PlanTextKey(:final key) => planLookup(t, key),
    PlanTextRaw(:final text) => text,
  };
}

/// Maps a plan ARB key to its localized string.
///
/// gen_l10n emits getters rather than a lookup table, so this bridge is written
/// by hand. An unknown key returns itself, which makes a missing translation
/// visible in the UI instead of crashing.
String planLookup(AppLocalizations t, String key) => switch (key) {
  'planMetricSessions' => t.planMetricSessions,
  'planMetricMinutes' => t.planMetricMinutes,
  'planMetricWeeks' => t.planMetricWeeks,
  'planHeadlineStrength' => t.planHeadlineStrength,
  'planHeadlineGeneral' => t.planHeadlineGeneral,
  'planSummaryUnderweight' => t.planSummaryUnderweight,
  'planSummaryGeneral' => t.planSummaryGeneral,
  'planRationaleBody' => t.planRationaleBody,
  'planPhase1Range' => t.planPhase1Range,
  'planPhase1Focus' => t.planPhase1Focus,
  'planPhase1Detail' => t.planPhase1Detail,
  'planPhase2Range' => t.planPhase2Range,
  'planPhase2Focus' => t.planPhase2Focus,
  'planPhase2Detail' => t.planPhase2Detail,
  'planNeedStrength' => t.planNeedStrength,
  'planNeedEndurance' => t.planNeedEndurance,
  'planNeedWeightGain' => t.planNeedWeightGain,
  'planNeedMobility' => t.planNeedMobility,
  'planNeedInjuryCare' => t.planNeedInjuryCare,
  'planNutritionSurplus' => t.planNutritionSurplus,
  'planNutritionMaintain' => t.planNutritionMaintain,
  'planHealthNote' => t.planHealthNote,
  'planSessionFullBody' => t.planSessionFullBody,
  'planSessionLower' => t.planSessionLower,
  'planSessionUpper' => t.planSessionUpper,
  'exerciseGobletSquat' => t.exerciseGobletSquat,
  'exerciseSplitSquat' => t.exerciseSplitSquat,
  'exerciseHipHinge' => t.exerciseHipHinge,
  'exerciseGluteBridge' => t.exerciseGluteBridge,
  'exercisePushup' => t.exercisePushup,
  'exerciseInclinePushup' => t.exerciseInclinePushup,
  'exerciseRow' => t.exerciseRow,
  'exerciseOverheadPress' => t.exerciseOverheadPress,
  'exercisePlank' => t.exercisePlank,
  'exerciseDeadBug' => t.exerciseDeadBug,
  'exerciseCalfRaise' => t.exerciseCalfRaise,
  'exerciseStepUp' => t.exerciseStepUp,
  'noteLowImpact' => t.noteLowImpact,
  'noteControlledRange' => t.noteControlledRange,
  _ => key,
};
