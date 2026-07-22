import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

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

/// One exercise in the looping set flow. Hardcoded to match the prototype.
class Exercise {
  const Exercise({
    required this.kind,
    required this.name,
    required this.reps,
    required this.seconds,
    required this.progress,
  });

  final ExerciseKind kind;
  final String name;

  /// Rep target, for [ExerciseKind.reps].
  final int reps;

  /// Hold duration in seconds, for [ExerciseKind.timed].
  final int seconds;

  /// Header progress-bar fill while this exercise is active, 0..1.
  final double progress;
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
  });

  final String title;
  final String phase;

  /// Length of the step in seconds.
  final int duration;
  final String target;

  /// A one-line preview of what follows.
  final String next;

  /// Relative width in the header progress bar.
  final int flex;
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
  });

  static const _restDuration = 30;
  static const _defaultTimed = 30;

  /// The looping set-mode exercises: reps → timed → reps → …
  static const exercises = [
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
  static const structuredSteps = [
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

  bool get resting => stage == PracticeStage.setRest;

  Exercise get exercise => exercises[exerciseIndex % exercises.length];
  Exercise get nextExercise =>
      exercises[(exerciseIndex + 1) % exercises.length];

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

  /// The check button on a reps exercise: go straight to rest.
  void completeReps() {
    if (state.painStopped) return;
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
    final count = PracticeState.exercises.length;
    final wrappedIndex = index % count;
    final exercise = PracticeState.exercises[wrappedIndex];

    state = state.copyWith(
      stage: PracticeStage.setActive,
      exerciseIndex: wrappedIndex,
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
        _startRest();
      } else {
        state = state.copyWith(timedSeconds: next);
      }
    });
  }

  void _startRest() {
    _timedTimer?.cancel();
    _restTimer?.cancel();
    state = state.copyWith(
      stage: PracticeStage.setRest,
      restSeconds: PracticeState._restDuration,
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

  /// End rest and advance to the next exercise in the loop.
  void skipRest() {
    _restTimer?.cancel();
    final nextIndex = state.exerciseIndex + 1;
    final next =
        PracticeState.exercises[nextIndex % PracticeState.exercises.length];
    state = state.copyWith(
      stage: PracticeStage.setActive,
      exerciseIndex: nextIndex,
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
        structuredSeconds: PracticeState.structuredSteps[1].duration,
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
    if (nextIndex >= PracticeState.structuredSteps.length) {
      _structuredTimer?.cancel();
      state = state.copyWith(
        structuredIndex: PracticeState.structuredSteps.length - 1,
        structuredSeconds: 0,
        structuredRunning: false,
      );
      return;
    }
    state = state.copyWith(
      structuredIndex: nextIndex,
      structuredSeconds: PracticeState.structuredSteps[nextIndex].duration,
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
