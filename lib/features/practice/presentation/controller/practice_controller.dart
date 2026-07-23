import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/practice_mapper.dart';
import '../../data/practice_repository.dart';
import '../../models/session_models.dart';

part 'practice_controller.g.dart';

/// The two top-level workout kinds the practice flow can enter.
enum PracticeMode { set, cardio }

/// Where the flow currently is. Each mode has an overview list and one or more
/// active runners, plus the set flow's rest interlude.
enum PracticeStage {
  /// The set workout's exercise list, before starting.
  setOverview,

  /// An active set exercise (reps or timed).
  setActive,

  /// The between-exercise rest countdown.
  setRest,

  /// The cardio picker: continuous vs. structured.
  cardioOverview,

  /// The continuous-run runner (time / distance / pace).
  cardioContinuous,

  /// The structured interval runner (stepping through [structuredSteps]).
  cardioStructured,
}

/// The two cardio sub-types selectable on the cardio overview.
enum CardioCase { continuous, structured }

/// A set-mode exercise is either counted in reps or held for a duration.
enum ExerciseKind { reps, timed }

/// One exercise in the set flow, projected from the backend's execution
/// snapshot so the view layer never touches wire types.
class Exercise {
  const Exercise({
    required this.kind,
    required this.name,
    required this.reps,
    required this.seconds,
    required this.progress,
    this.executionItemId,
    this.exerciseId,
    this.prescriptionId,
    this.movementPattern,
    this.targetSets = 1,
    this.targetWeightKg,
    this.restSec = 30,
    this.detail,
  });

  /// Derives the runner's view of one execution item. [progress] is the
  /// header bar's fill: position within the session, which the prototype
  /// previously hardcoded per exercise.
  factory Exercise.fromExecutionItem(
    ExecutionItem item, {
    required int index,
    required int total,
  }) {
    final rx = item.effectiveRx;
    return Exercise(
      kind: rx.isTimed ? ExerciseKind.timed : ExerciseKind.reps,
      name: item.displayName,
      reps: rx.targetReps ?? 0,
      seconds: rx.targetDurationSec ?? 0,
      progress: total == 0 ? 0 : (index + 1) / total,
      executionItemId: item.id,
      exerciseId: item.exerciseId,
      movementPattern: item.movementPattern ?? item.exercise?.movementPattern,
      targetSets: rx.targetSets,
      targetWeightKg: rx.targetWeightKg,
      restSec: rx.restSec,
      detail: item.exercise,
    );
  }

  final ExerciseKind kind;
  final String name;

  /// Rep target, for [ExerciseKind.reps].
  final int reps;

  /// Hold duration in seconds, for [ExerciseKind.timed].
  final int seconds;

  /// Header progress-bar fill while this exercise is active, 0..1.
  final double progress;

  /// Identifiers needed to log against this item. Null in the offline demo
  /// state, where nothing is posted.
  final String? executionItemId;
  final String? exerciseId;
  final String? prescriptionId;
  final String? movementPattern;

  final int targetSets;
  final double? targetWeightKg;
  final int restSec;

  /// The library row — instructions and media for the guide sheet.
  final ExerciseDetail? detail;
}

/// One step of the structured interval run. `round`/`roundTotal` label the
/// interval cycles; `flex` weights the header's segmented progress bar.
class CardioStep {
  const CardioStep({
    required this.title,
    required this.phase,
    required this.duration,
    required this.target,
    required this.next,
    required this.flex,
    this.instruction,
  });

  /// Projects a backend interval block. `title` stays a symbolic key so
  /// `cardio_structured_view` can keep localizing it; `phase` keeps the
  /// "step:n:total" form that view already parses.
  factory CardioStep.fromBlock(
    CardioBlock block, {
    required int index,
    required int total,
  }) {
    final title = switch (block.phase) {
      BlockPhase.warmup => 'warmup',
      BlockPhase.work => 'fast',
      BlockPhase.recovery => 'recover',
      BlockPhase.cooldown => 'cooldown',
    };
    return CardioStep(
      title: title,
      phase: 'step:${index + 1}:$total',
      duration: block.durationSec ?? 0,
      target: title,
      next: index + 1 < total ? 'step:${index + 2}' : 'finish',
      flex: block.flex,
      instruction: block.instruction.isEmpty ? null : block.instruction,
    );
  }

  final String title;
  final String phase;

  /// Length of the step in seconds.
  final int duration;
  final String target;

  /// A one-line preview of what follows.
  final String next;

  /// Relative width in the header progress bar.
  final int flex;

  /// The coach's cue for this step, when the backend supplied one.
  final String? instruction;
}

/// Immutable snapshot of the active session, ported from the prototype's
/// mutable JS globals.
class PracticeState {
  const PracticeState({
    this.mode = PracticeMode.set,
    this.stage = PracticeStage.setOverview,
    this.exerciseIndex = 0,
    this.timedRunning = true,
    this.timedSeconds = _defaultTimed,
    this.restSeconds = _restDuration,
    this.painStopped = false,
    this.cardioCase = CardioCase.continuous,
    this.cardioRunning = true,
    this.elapsedSeconds = 24 * 60 + 16,
    this.cardioTargetKm = 5,
    this.cardioDistanceKm = 4.21,
    this.structuredIndex = 1,
    this.structuredSeconds = 138,
    this.structuredRunning = true,
    this.sessionId,
    this.programRevisionId,
    this.loadedExercises,
    this.loadedStructuredSteps,
    this.setNumber = 1,
    this.loading = false,
    this.readiness,
  });

  static const _restDuration = 30;
  static const _defaultTimed = 30;

  /// Fallback used before a session is loaded (and by the offline demo): the
  /// looping set-mode exercises reps → timed → reps → …
  static const demoExercises = [
    Exercise(
      kind: ExerciseKind.reps,
      name: 'Squat',
      reps: 15,
      seconds: 0,
      progress: 0.38,
    ),
    Exercise(
      kind: ExerciseKind.timed,
      name: 'Plank',
      reps: 0,
      seconds: 30,
      progress: 0.63,
    ),
  ];

  /// The structured interval run: warm-up, three fast/recovery cycles, cool-down.
  static const demoStructuredSteps = [
    CardioStep(
      title: 'warmup',
      phase: 'step:1:8',
      duration: 300,
      target: 'warmup',
      next: 'fast:3',
      flex: 5,
    ),
    CardioStep(
      title: 'fast',
      phase: 'round:1:3',
      duration: 180,
      target: 'fast',
      next: 'recover:2',
      flex: 3,
    ),
    CardioStep(
      title: 'recover',
      phase: 'round:1:3',
      duration: 120,
      target: 'recover',
      next: 'fast:3',
      flex: 2,
    ),
    CardioStep(
      title: 'fast',
      phase: 'round:2:3',
      duration: 180,
      target: 'fast',
      next: 'recover:2',
      flex: 3,
    ),
    CardioStep(
      title: 'recover',
      phase: 'round:2:3',
      duration: 120,
      target: 'recover',
      next: 'fast:3',
      flex: 2,
    ),
    CardioStep(
      title: 'fast',
      phase: 'round:3:3',
      duration: 180,
      target: 'fast',
      next: 'recover:2',
      flex: 3,
    ),
    CardioStep(
      title: 'recover',
      phase: 'round:3:3',
      duration: 120,
      target: 'recover',
      next: 'cooldown:10',
      flex: 2,
    ),
    CardioStep(
      title: 'cooldown',
      phase: 'step:8:8',
      duration: 600,
      target: 'cooldown',
      next: 'finish',
      flex: 10,
    ),
  ];

  final PracticeMode mode;
  final PracticeStage stage;

  /// Position in [exercises], wrapping. Even → reps, odd → timed.
  final int exerciseIndex;

  /// Whether a timed exercise's countdown is running (vs. paused).
  final bool timedRunning;
  final int timedSeconds;

  final int restSeconds;

  /// Set once the user reports pain: the set flow halts and the CTA locks.
  final bool painStopped;

  final CardioCase cardioCase;
  final bool cardioRunning;
  final int elapsedSeconds;
  final int cardioTargetKm;

  /// Distance covered so far, in km. Drives the header and footer goal rings.
  final double cardioDistanceKm;

  final int structuredIndex;
  final int structuredSeconds;
  final bool structuredRunning;

  /// Set once the session shell exists server-side; null in the offline demo,
  /// which is what every log call checks before posting.
  final String? sessionId;
  final String? programRevisionId;

  /// The execution snapshot projected into runner form. Null until loaded, when
  /// [exercises] falls back to [demoExercises].
  final List<Exercise>? loadedExercises;

  /// Interval steps from the session's structured cardio prescription. Null
  /// until loaded, when [structuredSteps] falls back to the demo sequence.
  final List<CardioStep>? loadedStructuredSteps;

  /// Which set of the current exercise is being performed, 1-based.
  final int setNumber;

  final bool loading;

  /// The readiness verdict, kept so the runner can surface *why* the session
  /// was reduced.
  final ReadinessResult? readiness;

  bool get resting => stage == PracticeStage.setRest;

  /// The live exercise list: the loaded session when there is one, otherwise
  /// the demo loop so the screens still render standalone.
  List<Exercise> get exercises {
    final loaded = loadedExercises;
    return loaded == null || loaded.isEmpty ? demoExercises : loaded;
  }

  /// True once the session came from the backend rather than the demo constant.
  bool get isLive => sessionId != null;

  Exercise get exercise => exercises[exerciseIndex % exercises.length];
  Exercise get nextExercise =>
      exercises[(exerciseIndex + 1) % exercises.length];

  /// The live interval sequence: the session's own steps when loaded, the demo
  /// sequence otherwise.
  List<CardioStep> get structuredSteps {
    final loaded = loadedStructuredSteps;
    return loaded == null || loaded.isEmpty ? demoStructuredSteps : loaded;
  }

  CardioStep get structuredStep =>
      structuredSteps[structuredIndex.clamp(0, structuredSteps.length - 1)];

  PracticeState copyWith({
    PracticeMode? mode,
    PracticeStage? stage,
    int? exerciseIndex,
    bool? timedRunning,
    int? timedSeconds,
    int? restSeconds,
    bool? painStopped,
    CardioCase? cardioCase,
    bool? cardioRunning,
    int? elapsedSeconds,
    int? structuredIndex,
    int? structuredSeconds,
    bool? structuredRunning,
    String? sessionId,
    String? programRevisionId,
    List<Exercise>? loadedExercises,
    List<CardioStep>? loadedStructuredSteps,
    int? setNumber,
    bool? loading,
    ReadinessResult? readiness,
  }) => PracticeState(
    mode: mode ?? this.mode,
    stage: stage ?? this.stage,
    exerciseIndex: exerciseIndex ?? this.exerciseIndex,
    timedRunning: timedRunning ?? this.timedRunning,
    timedSeconds: timedSeconds ?? this.timedSeconds,
    restSeconds: restSeconds ?? this.restSeconds,
    painStopped: painStopped ?? this.painStopped,
    cardioCase: cardioCase ?? this.cardioCase,
    cardioRunning: cardioRunning ?? this.cardioRunning,
    elapsedSeconds: elapsedSeconds ?? this.elapsedSeconds,
    cardioTargetKm: cardioTargetKm,
    cardioDistanceKm: cardioDistanceKm,
    structuredIndex: structuredIndex ?? this.structuredIndex,
    structuredSeconds: structuredSeconds ?? this.structuredSeconds,
    structuredRunning: structuredRunning ?? this.structuredRunning,
    sessionId: sessionId ?? this.sessionId,
    programRevisionId: programRevisionId ?? this.programRevisionId,
    loadedExercises: loadedExercises ?? this.loadedExercises,
    loadedStructuredSteps: loadedStructuredSteps ?? this.loadedStructuredSteps,
    setNumber: setNumber ?? this.setNumber,
    loading: loading ?? this.loading,
    readiness: readiness ?? this.readiness,
  );
}

/// Drives the whole practice flow: the set overview → exercise loop → rest, and
/// the cardio overview → continuous / structured runners. Every timer lives
/// here so they survive rebuilds and sheet opens, and are cancelled on dispose.
@riverpod
class Practice extends _$Practice {
  Timer? _timedTimer;
  Timer? _restTimer;
  Timer? _cardioTimer;
  Timer? _structuredTimer;

  @override
  PracticeState build() {
    ref.onDispose(() {
      _timedTimer?.cancel();
      _restTimer?.cancel();
      _cardioTimer?.cancel();
      _structuredTimer?.cancel();
    });
    return const PracticeState();
  }

  /// Sets the launch mode and lands on that mode's overview.
  void enterMode(PracticeMode mode) {
    _cancelAll();
    state = state.copyWith(
      mode: mode,
      stage: mode == PracticeMode.set
          ? PracticeStage.setOverview
          : PracticeStage.cardioOverview,
    );
  }

  // --- Session lifecycle --------------------------------------------------

  /// Creates the session shell and submits readiness, returning the verdict so
  /// the caller can stop before training when it is `hold`.
  ///
  /// The execution snapshot is built separately by [loadExecution], because a
  /// `hold` verdict means we never get that far.
  Future<ReadinessResult> beginSession({
    required String programRevisionId,
    String? plannedSessionId,
    required ReadinessAnswers readiness,
    TrainingEnvironment environment = TrainingEnvironment.unknown,
  }) async {
    state = state.copyWith(loading: true);
    try {
      final repository = ref.read(practiceRepositoryProvider);
      final sessionId = await repository.createSession(
        programRevisionId: programRevisionId,
        plannedSessionId: plannedSessionId,
        environment: environment,
      );
      final verdict = await repository.submitReadiness(sessionId, readiness);
      state = state.copyWith(
        sessionId: sessionId,
        programRevisionId: programRevisionId,
        readiness: verdict,
        loading: false,
      );
      return verdict;
    } catch (_) {
      state = state.copyWith(loading: false);
      rethrow;
    }
  }

  /// Fetches the execution snapshot and projects it into the runner's shape.
  /// Held and skipped items are dropped — they are not performed.
  Future<void> loadExecution() async {
    final sessionId = state.sessionId;
    if (sessionId == null) return;

    state = state.copyWith(loading: true);
    try {
      final snapshot = await ref
          .read(practiceRepositoryProvider)
          .buildExecution(sessionId);

      final performed = snapshot.items.where((item) => item.isPerformed).toList()
        ..sort((a, b) => a.order.compareTo(b.order));

      // A structured cardio prescription carries interval blocks; the first one
      // found drives the structured runner.
      final structured = performed
          .where((item) => item.isStructured)
          .firstOrNull;

      state = state.copyWith(
        loadedExercises: [
          for (final (index, item) in performed.indexed)
            Exercise.fromExecutionItem(
              item,
              index: index,
              total: performed.length,
            ),
        ],
        loadedStructuredSteps: structured == null
            ? null
            : [
                for (final (index, block) in structured.blocks.indexed)
                  CardioStep.fromBlock(
                    block,
                    index: index,
                    total: structured.blocks.length,
                  ),
              ],
        exerciseIndex: 0,
        setNumber: 1,
        loading: false,
      );
    } catch (_) {
      state = state.copyWith(loading: false);
      rethrow;
    }
  }

  /// Posts the set just finished. Silently no-ops offline so the demo flow and
  /// the timers keep working without a backend.
  Future<void> _logCurrentSet({int? reps, int? durationSec}) async {
    final sessionId = state.sessionId;
    final exercise = state.exercise;
    final exerciseId = exercise.exerciseId;
    if (sessionId == null || exerciseId == null) return;

    await ref.read(practiceRepositoryProvider).logSets(sessionId, [
      SetEntry(
        exerciseId: exerciseId,
        setNumber: state.setNumber,
        executionItemId: exercise.executionItemId,
        movementPattern: exercise.movementPattern,
        actualReps: reps,
        actualDurationSec: durationSec,
        actualWeightKg: exercise.targetWeightKg,
      ),
    ]);
  }

  /// Sends one feedback event. `pain_stop` additionally halts the flow through
  /// [painStop], which the caller invokes.
  Future<void> sendFeedback(
    String type, {
    String? bodyArea,
    int? severity,
    String? notes,
  }) async {
    final sessionId = state.sessionId;
    final exerciseId = state.exercise.exerciseId;
    if (sessionId == null || exerciseId == null) return;

    await ref
        .read(practiceRepositoryProvider)
        .recordFeedback(
          sessionId,
          exerciseId: exerciseId,
          type: type,
          executionItemId: state.exercise.executionItemId,
          movementPattern: state.exercise.movementPattern,
          bodyArea: bodyArea,
          severity: severity,
          notes: notes,
        );
  }

  /// Ends the session server-side. [sessionRpe] is the 1–10 effort rating from
  /// the finish sheet, which the prototype collected and discarded.
  Future<void> completeSession({int? sessionRpe}) async {
    final sessionId = state.sessionId;
    if (sessionId == null) return;

    _cancelAll();
    await ref
        .read(practiceRepositoryProvider)
        .complete(sessionId, sessionRpe: sessionRpe);
  }

  // --- Set flow -----------------------------------------------------------

  /// "Bắt đầu tập" — leave the overview and start the first exercise.
  void startSetWorkout() {
    state = state.copyWith(
      stage: PracticeStage.setActive,
      exerciseIndex: 0,
      timedRunning: true,
    );
  }

  /// Back from the set/rest screens to the exercise list.
  void showSetOverview() {
    _timedTimer?.cancel();
    _restTimer?.cancel();
    state = state.copyWith(stage: PracticeStage.setOverview);
  }

  /// The check button on a reps exercise: log the set, then rest.
  ///
  /// The log is fire-and-forget so a slow network never stalls the rest timer;
  /// a failed post is dropped rather than blocking the workout.
  void completeReps() {
    if (state.painStopped) return;
    unawaited(_logCurrentSet(reps: state.exercise.reps).catchError((_) {}));
    _startRest();
  }

  /// The pause/resume button on a timed exercise.
  void toggleTimed() {
    if (state.painStopped) return;
    final running = !state.timedRunning;
    state = state.copyWith(timedRunning: running);
    if (running) {
      _startTimedTimer();
    } else {
      _timedTimer?.cancel();
    }
  }

  /// Move directly between exercises from the active-session footer.
  void showPreviousExercise() => _showExercise(state.exerciseIndex - 1);

  void showNextExercise() => _showExercise(state.exerciseIndex + 1);

  void _showExercise(int index) {
    _timedTimer?.cancel();
    _restTimer?.cancel();
    final count = state.exercises.length;
    final wrappedIndex = index % count;
    final exercise = state.exercises[wrappedIndex];

    state = state.copyWith(
      stage: PracticeStage.setActive,
      exerciseIndex: wrappedIndex,
      // Moving to another exercise restarts its set counter.
      setNumber: 1,
      timedRunning: exercise.kind == ExerciseKind.timed,
      timedSeconds: exercise.seconds > 0
          ? exercise.seconds
          : PracticeState._defaultTimed,
    );

    if (exercise.kind == ExerciseKind.timed) _startTimedTimer();
  }

  void _startTimedTimer() {
    _timedTimer?.cancel();
    _timedTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!state.timedRunning) return;
      final next = state.timedSeconds - 1;
      if (next <= 0) {
        // A hold that ran to zero was completed for its full prescribed time.
        unawaited(
          _logCurrentSet(
            durationSec: state.exercise.seconds,
          ).catchError((_) {}),
        );
        _startRest();
      } else {
        state = state.copyWith(timedSeconds: next);
      }
    });
  }

  void _startRest() {
    _timedTimer?.cancel();
    _restTimer?.cancel();
    // The prescription owns the rest interval; the constant is only the
    // fallback for the demo state.
    final rest = state.exercise.restSec;
    state = state.copyWith(
      stage: PracticeStage.setRest,
      restSeconds: rest > 0 ? rest : PracticeState._restDuration,
    );
    _restTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      final next = state.restSeconds - 1;
      if (next <= 0) {
        skipRest();
      } else {
        state = state.copyWith(restSeconds: next);
      }
    });
  }

  /// End rest. Stays on the current exercise until its prescribed sets are
  /// done, then advances — the prototype always advanced, which would log a
  /// single set for a 3-set prescription.
  void skipRest() {
    _restTimer?.cancel();

    final current = state.exercise;
    final hasSetsLeft = state.setNumber < current.targetSets;
    final nextIndex = hasSetsLeft
        ? state.exerciseIndex
        : state.exerciseIndex + 1;
    final next = state.exercises[nextIndex % state.exercises.length];

    state = state.copyWith(
      stage: PracticeStage.setActive,
      exerciseIndex: nextIndex,
      setNumber: hasSetsLeft ? state.setNumber + 1 : 1,
      timedRunning: true,
      timedSeconds: next.seconds > 0
          ? next.seconds
          : PracticeState._defaultTimed,
    );
    if (next.kind == ExerciseKind.timed) _startTimedTimer();
  }

  /// Reports pain from the feedback sheet: halts the set flow and locks the CTA.
  void painStop() {
    _timedTimer?.cancel();
    _restTimer?.cancel();
    state = state.copyWith(painStopped: true, timedRunning: false);
  }

  // --- Cardio overview ----------------------------------------------------

  void selectCardioCase(CardioCase value) =>
      state = state.copyWith(cardioCase: value);

  /// "Bắt đầu chạy" — start the selected cardio case's runner.
  void startCardioCase() {
    if (state.cardioCase == CardioCase.continuous) {
      state = state.copyWith(
        stage: PracticeStage.cardioContinuous,
        cardioRunning: true,
      );
      _startCardioTimer();
    } else {
      state = state.copyWith(
        stage: PracticeStage.cardioStructured,
        structuredIndex: 1,
        structuredSeconds: state.structuredSteps[1].duration,
        structuredRunning: true,
      );
      _startStructuredTimer();
    }
  }

  /// Back from a cardio runner to the cardio picker.
  void showCardioOverview() {
    _cardioTimer?.cancel();
    _structuredTimer?.cancel();
    state = state.copyWith(stage: PracticeStage.cardioOverview);
  }

  // --- Continuous cardio --------------------------------------------------

  void toggleCardio() {
    final running = !state.cardioRunning;
    state = state.copyWith(cardioRunning: running);
    if (running) {
      _startCardioTimer();
    } else {
      _cardioTimer?.cancel();
    }
  }

  void _startCardioTimer() {
    _cardioTimer?.cancel();
    _cardioTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!state.cardioRunning) return;
      state = state.copyWith(elapsedSeconds: state.elapsedSeconds + 1);
    });
  }

  /// Finishing pauses the run so the summary numbers hold still behind the
  /// sheet; [resumeAfterFinish] restarts it if the sheet is dismissed.
  void pauseForFinish() {
    _cardioTimer?.cancel();
    _structuredTimer?.cancel();
    state = state.copyWith(cardioRunning: false, structuredRunning: false);
  }

  void resumeAfterFinish() {
    if (state.stage == PracticeStage.cardioStructured) {
      state = state.copyWith(structuredRunning: true);
      _startStructuredTimer();
    } else {
      state = state.copyWith(cardioRunning: true);
      _startCardioTimer();
    }
  }

  // --- Structured cardio --------------------------------------------------

  void toggleStructured() {
    final running = !state.structuredRunning;
    state = state.copyWith(structuredRunning: running);
    if (running) {
      _startStructuredTimer();
    } else {
      _structuredTimer?.cancel();
    }
  }

  /// Skip to the next step; the last step's skip ends the run's timer.
  void skipStructuredStep() {
    final nextIndex = state.structuredIndex + 1;
    final steps = state.structuredSteps;
    if (nextIndex >= steps.length) {
      _structuredTimer?.cancel();
      state = state.copyWith(
        structuredIndex: steps.length - 1,
        structuredSeconds: 0,
        structuredRunning: false,
      );
      return;
    }
    state = state.copyWith(
      structuredIndex: nextIndex,
      structuredSeconds: steps[nextIndex].duration,
      structuredRunning: true,
    );
    _startStructuredTimer();
  }

  void _startStructuredTimer() {
    _structuredTimer?.cancel();
    _structuredTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!state.structuredRunning) return;
      final next = state.structuredSeconds - 1;
      if (next <= 0) {
        skipStructuredStep();
      } else {
        state = state.copyWith(structuredSeconds: next);
      }
    });
  }

  void _cancelAll() {
    _timedTimer?.cancel();
    _restTimer?.cancel();
    _cardioTimer?.cancel();
    _structuredTimer?.cancel();
  }
}
