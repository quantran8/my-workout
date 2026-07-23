import '../presentation/widgets/practice_feedback_sheet.dart';

/// Translates between the app's camelCase enums and the backend's snake_case
/// unions (`session.types.ts`, `RecordFeedbackDto`).
///
/// Hand-written rather than generated, for the same reason as
/// `ProfileMapper`: a raw `toJson()` would emit `tooEasy` where the backend's
/// `@IsIn(['too_easy', ...])` expects `too_easy`, and the request would be
/// rejected — or worse, silently mis-bucketed.
abstract final class PracticeMapper {
  // --- Feedback ------------------------------------------------------------

  /// `PracticeFeedback` -> `RecordFeedbackDto.type`.
  static String feedbackType(PracticeFeedback value) => switch (value) {
    PracticeFeedback.ok => 'ok',
    PracticeFeedback.easy => 'too_easy',
    PracticeFeedback.hard => 'too_hard',
    PracticeFeedback.uncomfortable => 'uncomfortable',
    PracticeFeedback.pain => 'pain_stop',
  };

  /// The `feedbackFlag` on a logged set. `pain_stop` is an *event*, not a set
  /// flag, so it has no place here — it goes through `POST /feedback`.
  static String? setFeedbackFlag(PracticeFeedback value) => switch (value) {
    PracticeFeedback.ok => 'ok',
    PracticeFeedback.easy => 'too_easy',
    PracticeFeedback.hard => 'too_hard',
    PracticeFeedback.uncomfortable => 'uncomfortable',
    PracticeFeedback.pain => null,
  };

  // --- Readiness -----------------------------------------------------------

  static String severity(DiscomfortSeverity value) => switch (value) {
    DiscomfortSeverity.mild => 'mild',
    DiscomfortSeverity.moderate => 'moderate',
    DiscomfortSeverity.severe => 'severe',
  };

  static String soreness(ResidualSoreness value) => switch (value) {
    ResidualSoreness.none => 'none',
    ResidualSoreness.mild => 'mild',
    ResidualSoreness.moderate => 'moderate',
    ResidualSoreness.high => 'high',
  };

  static String energy(EnergyLevel value) => switch (value) {
    EnergyLevel.low => 'low',
    EnergyLevel.ok => 'ok',
    EnergyLevel.high => 'high',
  };

  /// The backend keeps `InjuryArea` snake_case; the readiness gate reuses the
  /// same vocabulary so a discomfort can be matched against a known injury.
  static String bodyArea(BodyArea value) => switch (value) {
    BodyArea.knee => 'knee',
    BodyArea.shoulder => 'shoulder',
    BodyArea.lowerBack => 'lower_back',
    BodyArea.hip => 'hip',
    BodyArea.elbow => 'elbow',
    BodyArea.wrist => 'wrist',
    BodyArea.ankle => 'ankle',
    BodyArea.neck => 'neck',
    BodyArea.upperBack => 'upper_back',
  };

  // --- Session -------------------------------------------------------------

  static String environment(TrainingEnvironment value) => switch (value) {
    TrainingEnvironment.outdoor => 'outdoor',
    TrainingEnvironment.indoor => 'indoor',
    TrainingEnvironment.unknown => 'unknown',
  };

  /// Until the app collects GPS this is always `none` — claiming `gps` would
  /// tell the backend the distance is more trustworthy than it is.
  static String distanceSource(DistanceSource value) => switch (value) {
    DistanceSource.gps => 'gps',
    DistanceSource.smartTrainer => 'smart_trainer',
    DistanceSource.bikeSensor => 'bike_sensor',
    DistanceSource.machineManual => 'machine_manual',
    DistanceSource.none => 'none',
  };

  static String energyAfter(EnergyLevel value) => energy(value);
}

/// Severity of a discomfort reported at the readiness gate.
enum DiscomfortSeverity { mild, moderate, severe }

/// How sore the user still is from the previous session.
enum ResidualSoreness { none, mild, moderate, high }

enum EnergyLevel { low, ok, high }

/// Body areas the readiness gate and pain-stop flow can name. Mirrors the
/// backend's `InjuryArea` union.
enum BodyArea {
  knee,
  shoulder,
  lowerBack,
  hip,
  elbow,
  wrist,
  ankle,
  neck,
  upperBack,
}

enum TrainingEnvironment { outdoor, indoor, unknown }

enum DistanceSource {
  gps,
  smartTrainer,
  bikeSensor,
  machineManual,
  none,
}

/// The answers collected by the readiness screen, in wire shape.
class ReadinessAnswers {
  const ReadinessAnswers({
    this.answered = true,
    this.discomforts = const [],
    this.residualSoreness = ResidualSoreness.none,
    this.energyLevel = EnergyLevel.ok,
    this.poorSleep = false,
    this.highStress = false,
    this.illness = false,
  });

  /// Skipping the gate entirely. The backend then applies its conservative
  /// unknown branch (a 70% volume cap), which is intentional.
  const ReadinessAnswers.skipped() : this(answered: false);

  final bool answered;
  final List<ReportedDiscomfort> discomforts;
  final ResidualSoreness residualSoreness;
  final EnergyLevel energyLevel;
  final bool poorSleep;
  final bool highStress;
  final bool illness;

  Map<String, dynamic> toJson() => {
    'answered': answered,
    'discomforts': [
      for (final d in discomforts)
        {
          'bodyArea': PracticeMapper.bodyArea(d.area),
          'severity': PracticeMapper.severity(d.severity),
          'affectsNormalMovement': d.affectsNormalMovement,
        },
    ],
    'residualSoreness': PracticeMapper.soreness(residualSoreness),
    'energyLevel': PracticeMapper.energy(energyLevel),
    'externalLoads': {
      'poorSleep': poorSleep,
      'highStress': highStress,
      'illness': illness,
    },
  };
}

class ReportedDiscomfort {
  const ReportedDiscomfort({
    required this.area,
    this.severity = DiscomfortSeverity.mild,
    this.affectsNormalMovement = false,
  });

  final BodyArea area;
  final DiscomfortSeverity severity;

  /// The backend escalates to `hold` when a discomfort affects normal movement,
  /// so this is the single most consequential answer on the screen.
  final bool affectsNormalMovement;
}
