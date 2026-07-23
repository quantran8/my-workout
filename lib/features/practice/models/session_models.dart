import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_models.freezed.dart';
part 'session_models.g.dart';

/// What a movement is measured in — mirrors the backend's `ExerciseType`.
enum ExerciseType { resistance, cardio, mobility }

/// One block of a structured cardio prescription (interval / circuit).
/// Mirrors `PrescriptionBlock`; `phase` is the backend's `WorkoutBlockPhase`.
enum BlockPhase { warmup, work, recovery, cooldown }

/// Why an execution item is not being performed as planned.
enum ExecutionItemStatus { planned, skipped, held }

/// The backend's readiness verdict. `hold` blocks part or all of the session.
enum ReadinessVerdict { ready, modify, hold, unknown }

/// The exercise library row, as returned by `GET /exercises` and joined into
/// each execution item.
@freezed
abstract class ExerciseDetail with _$ExerciseDetail {
  const ExerciseDetail._();

  const factory ExerciseDetail({
    required String id,
    required String slug,
    required String name,
    @Default(ExerciseType.resistance) ExerciseType exerciseType,
    @Default(<String>[]) List<String> primaryMuscles,
    @Default(<String>[]) List<String> secondaryMuscles,
    @Default(<String>[]) List<String> equipment,
    @Default(1) int difficulty,
    String? movementPattern,
    /// Step-by-step cues for the guide sheet. Never sent to the LLM.
    @Default(<String>[]) List<String> instructions,
    Map<String, dynamic>? media,
  }) = _ExerciseDetail;

  factory ExerciseDetail.fromJson(Map<String, dynamic> json) =>
      _$ExerciseDetailFromJson(json);

  /// Comma-joined target muscles, for the overview row's subtitle.
  String get targetSummary => primaryMuscles.join(', ');
}

/// The prescription actually being asked of the user, after readiness
/// modifications. Progress and tolerance are judged against this, never against
/// the planned values.
@freezed
abstract class EffectiveRx with _$EffectiveRx {
  const EffectiveRx._();

  const factory EffectiveRx({
    @Default(1) int targetSets,
    /// `int` or `[min, max]` on the wire — see [repsLabel].
    @JsonKey(name: 'targetReps') dynamic rawTargetReps,
    double? targetWeightKg,
    int? targetDurationSec,
    int? targetDistanceM,
    int? targetRpe,
    @Default(60) int restSec,
  }) = _EffectiveRx;

  factory EffectiveRx.fromJson(Map<String, dynamic> json) =>
      _$EffectiveRxFromJson(json);

  /// Lower bound of the rep target, or null for a duration-based movement.
  int? get targetReps => switch (rawTargetReps) {
    final int reps => reps,
    final List<dynamic> range when range.isNotEmpty => range.first as int?,
    _ => null,
  };

  /// "12" or "8-12"; null when the movement is timed rather than counted.
  String? get repsLabel => switch (rawTargetReps) {
    final int reps => '$reps',
    final List<dynamic> range when range.length >= 2 =>
      '${range[0]}-${range[1]}',
    final List<dynamic> range when range.isNotEmpty => '${range.first}',
    _ => null,
  };

  /// Timed when there is a duration and no rep target — drives whether the
  /// practice screen shows a countdown or a rep count.
  bool get isTimed => targetReps == null && (targetDurationSec ?? 0) > 0;
}

/// One item of the immutable execution snapshot (§5.3).
@freezed
abstract class ExecutionItem with _$ExecutionItem {
  const ExecutionItem._();

  const factory ExecutionItem({
    required String id,
    required String exerciseId,
    required int order,
    required EffectiveRx effectiveRx,
    EffectiveRx? plannedRx,
    String? movementPattern,
    @Default(ExecutionItemStatus.planned) ExecutionItemStatus status,
    /// ReadinessMod codes applied to this item, e.g. `reduce_volume`.
    @Default(<String>[]) List<String> appliedModifications,
    /// Null when the movement is missing or no longer PT-reviewed.
    ExerciseDetail? exercise,
    /// Interval steps for a structured cardio prescription; empty for a simple
    /// one, which is then driven by [effectiveRx] alone.
    @Default(<CardioBlock>[]) List<CardioBlock> blocks,
  }) = _ExecutionItem;

  factory ExecutionItem.fromJson(Map<String, dynamic> json) =>
      _$ExecutionItemFromJson(json);

  /// True when this is an interval/circuit rather than a plain effort.
  bool get isStructured => blocks.isNotEmpty;

  /// Items the user actually performs; held and skipped ones are shown as
  /// context but never entered.
  bool get isPerformed => status == ExecutionItemStatus.planned;

  /// Falls back to the id so a row is never blank if hydration missed.
  String get displayName => exercise?.name ?? exerciseId;
}

/// One step of a structured cardio prescription, as stored in
/// `PrescriptionBlock`. Rounds are flattened server-side into a plain sequence,
/// so the runner only walks `order` ascending.
@freezed
abstract class CardioBlock with _$CardioBlock {
  const CardioBlock._();

  const factory CardioBlock({
    required int order,
    @Default(BlockPhase.work) BlockPhase phase,
    int? durationSec,
    int? distanceM,
    int? targetRpeMin,
    int? targetRpeMax,
    double? targetPaceSecPerKm,
    @Default('') String instruction,
  }) = _CardioBlock;

  factory CardioBlock.fromJson(Map<String, dynamic> json) =>
      _$CardioBlockFromJson(json);

  /// Relative width in the segmented progress bar. Distance-bounded steps have
  /// no duration, so they fall back to an even share.
  int get flex => ((durationSec ?? 60) / 60).round().clamp(1, 20);
}

/// Response of `POST /session/:id/execution`.
@freezed
abstract class ExecutionSnapshot with _$ExecutionSnapshot {
  const factory ExecutionSnapshot({
    @Default(<ExecutionItem>[]) List<ExecutionItem> items,
    String? ruleVersion,
  }) = _ExecutionSnapshot;

  factory ExecutionSnapshot.fromJson(Map<String, dynamic> json) =>
      _$ExecutionSnapshotFromJson(json);
}

/// One discomfort reported at the readiness gate.
@freezed
abstract class Discomfort with _$Discomfort {
  const factory Discomfort({
    required String bodyArea,
    required String severity,
    @Default(false) bool affectsNormalMovement,
  }) = _Discomfort;

  factory Discomfort.fromJson(Map<String, dynamic> json) =>
      _$DiscomfortFromJson(json);
}

/// Result of `POST /session/:id/readiness`.
@freezed
abstract class ReadinessResult with _$ReadinessResult {
  const ReadinessResult._();

  const factory ReadinessResult({
    @Default(ReadinessVerdict.unknown) ReadinessVerdict verdict,
    @Default(<Map<String, dynamic>>[]) List<Map<String, dynamic>> modifications,
    String? ruleVersion,
  }) = _ReadinessResult;

  factory ReadinessResult.fromJson(Map<String, dynamic> json) =>
      _$ReadinessResultFromJson(json);

  /// A `hold` verdict means at least part of the session must not be trained.
  bool get blocksSession => verdict == ReadinessVerdict.hold;

  /// Backend-supplied Vietnamese reasons, shown verbatim — they explain *why*
  /// the session was modified, which the client cannot re-derive.
  List<String> get reasons => [
    for (final mod in modifications)
      if (mod['reason'] case final String reason) reason,
  ];
}
