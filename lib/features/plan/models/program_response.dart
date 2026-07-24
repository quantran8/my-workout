import 'package:freezed_annotation/freezed_annotation.dart';

part 'program_response.freezed.dart';
part 'program_response.g.dart';

/// The backend's `Program` contract — the raw wire shape returned by
/// `POST /program/generate` and `GET /program/active`.
///
/// This is a **transport DTO**, not a display model: it mirrors the server's
/// structure (revisions, planned sessions, prescriptions) one-to-one.
/// [program_mapper.dart] turns it into the presentation-oriented `WorkoutPlan`
/// the plan screen renders. Keeping the two separate means the UI never has to
/// know the server speaks in prescriptions and week/day numbers.
@freezed
sealed class ProgramResponse with _$ProgramResponse {
  const factory ProgramResponse({
    required String programId,
    required String goalSummary,
    @Default([]) List<ProgramPhase> phasePlan,
    ProgramNutrition? nutrition,
    required ProgramRevision revision,
  }) = _ProgramResponse;

  factory ProgramResponse.fromJson(Map<String, dynamic> json) =>
      _$ProgramResponseFromJson(json);
}

/// A phasing block — `{phase, weeks: [from, to], focus}`.
@freezed
sealed class ProgramPhase with _$ProgramPhase {
  const factory ProgramPhase({
    required String phase,
    @Default([]) List<int> weeks,
    required String focus,
  }) = _ProgramPhase;

  factory ProgramPhase.fromJson(Map<String, dynamic> json) =>
      _$ProgramPhaseFromJson(json);
}

/// Server-computed calorie/protein target (`PROGRAM-10`). Absent when the
/// backend lacks body data to compute it safely — the plan screen then hides
/// the nutrition card rather than showing invented numbers.
@freezed
sealed class ProgramNutrition with _$ProgramNutrition {
  const factory ProgramNutrition({
    required int calorieLow,
    required int calorieHigh,
    required int proteinLow,
    required int proteinHigh,
    /// 'surplus' when underweight, 'maintain' otherwise.
    required String intent,
  }) = _ProgramNutrition;

  factory ProgramNutrition.fromJson(Map<String, dynamic> json) =>
      _$ProgramNutritionFromJson(json);
}

@freezed
sealed class ProgramRevision with _$ProgramRevision {
  const factory ProgramRevision({
    required String revisionId,
    required int revisionNumber,
    @Default([]) List<ProgramPlannedSession> sessions,
  }) = _ProgramRevision;

  factory ProgramRevision.fromJson(Map<String, dynamic> json) =>
      _$ProgramRevisionFromJson(json);
}

@freezed
sealed class ProgramPlannedSession with _$ProgramPlannedSession {
  const factory ProgramPlannedSession({
    required String plannedSessionId,
    required int weekNumber,
    required int dayNumber,
    required String focus,
    @Default([]) List<ProgramPrescription> prescriptions,
  }) = _ProgramPlannedSession;

  factory ProgramPlannedSession.fromJson(Map<String, dynamic> json) =>
      _$ProgramPlannedSessionFromJson(json);
}

@freezed
sealed class ProgramPrescription with _$ProgramPrescription {
  const factory ProgramPrescription({
    required String prescriptionId,
    required String exerciseId,
    @Default('') String exerciseSlug,
    /// Display name the server stitched in (`PROGRAM-11`).
    @Default('') String exerciseName,
    required int order,
    required int targetSets,
    /// `int | [min, max] | null` on the wire — read via [repsLabel].
    @JsonKey(name: 'targetReps') Object? targetRepsRaw,
    int? targetDurationSec,
    int? restSec,
  }) = _ProgramPrescription;

  const ProgramPrescription._();

  factory ProgramPrescription.fromJson(Map<String, dynamic> json) =>
      _$ProgramPrescriptionFromJson(json);

  /// Reps as a display string: a single count, a `min–max` range, or a duration
  /// (`45s`) for a timed/cardio movement when no rep target is set.
  String repsLabel() {
    final reps = targetRepsRaw;
    if (reps is num) return '${reps.round()}';
    if (reps is List && reps.length == 2) {
      return '${(reps[0] as num).round()}–${(reps[1] as num).round()}';
    }
    if (targetDurationSec case final s?) return '${s}s';
    return '—';
  }
}
