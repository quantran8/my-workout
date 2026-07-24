import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/features/practice/data/practice_mapper.dart';
import 'package:mobile/features/practice/data/practice_repository.dart';
import 'package:mobile/features/practice/models/session_models.dart';
import 'package:mobile/features/practice/presentation/controller/practice_controller.dart';

/// A repository that returns a fixed session + execution snapshot, so the
/// controller wiring can be exercised without a backend.
class _FakePracticeRepository implements PracticeRepository {
  _FakePracticeRepository(this.verdict);

  final ReadinessResult verdict;
  String? createdRevisionId;
  String? createdPlannedId;
  bool executionBuilt = false;

  @override
  Future<String> createSession({
    required String programRevisionId,
    String? plannedSessionId,
    TrainingEnvironment environment = TrainingEnvironment.unknown,
    DistanceSource distanceSource = DistanceSource.none,
  }) async {
    createdRevisionId = programRevisionId;
    createdPlannedId = plannedSessionId;
    return 'session-1';
  }

  @override
  Future<ReadinessResult> submitReadiness(String sessionId, answers) async =>
      verdict;

  @override
  Future<ExecutionSnapshot> buildExecution(String sessionId) async {
    executionBuilt = true;
    return const ExecutionSnapshot(
      items: [
        ExecutionItem(
          id: 'item-1',
          exerciseId: 'ex-1',
          order: 1,
          effectiveRx: EffectiveRx(targetSets: 3, rawTargetReps: [8, 10]),
          exercise: ExerciseDetail(id: 'ex-1', slug: 'goblet_squat', name: 'Goblet Squat'),
        ),
      ],
    );
  }

  @override
  Future<void> logSets(String sessionId, List<SetEntry> sets) async {}

  @override
  Future<Map<String, dynamic>> recordFeedback(String sessionId,
      {required String exerciseId,
      required String type,
      String? executionItemId,
      String? movementPattern,
      String? bodyArea,
      int? severity,
      String? notes}) async => const {};

  @override
  Future<Map<String, dynamic>> complete(String sessionId,
      {int? sessionRpe, EnergyLevel? energyAfter, String? notes}) async => const {};

  @override
  Future<List<ExerciseDetail>> exercisesByIds(List<String> ids) async => const [];
}

ProviderContainer _container(_FakePracticeRepository repo) {
  final c = ProviderContainer(
    overrides: [practiceRepositoryProvider.overrideWithValue(repo)],
  );
  addTearDown(c.dispose);
  return c;
}

void main() {
  const answers = ReadinessAnswers.skipped();

  test('begin + load hydrates the runner from the execution snapshot', () async {
    final repo = _FakePracticeRepository(
      const ReadinessResult(verdict: ReadinessVerdict.ready),
    );
    final c = _container(repo);
    final practice = c.read(practiceProvider.notifier);

    await practice.beginSession(
      programRevisionId: 'rev-1',
      plannedSessionId: 'planned-1',
      readiness: answers,
    );
    await practice.loadExecution();

    final state = c.read(practiceProvider);
    // The create call received the ids threaded from the dashboard.
    expect(repo.createdRevisionId, 'rev-1');
    expect(repo.createdPlannedId, 'planned-1');
    expect(repo.executionBuilt, isTrue);
    // The session is now live and shows the real exercise, not the demo loop.
    expect(state.isLive, isTrue);
    expect(state.sessionId, 'session-1');
    expect(state.exercises.single.name, 'Goblet Squat');
    expect(state.exercises.single.targetSets, 3);
  });

  test('a hold verdict still loads the session, keeping its reasons', () async {
    final repo = _FakePracticeRepository(
      const ReadinessResult(
        verdict: ReadinessVerdict.hold,
        modifications: [
          {'reason': 'Giảm tải vì bạn báo đau gối'},
        ],
      ),
    );
    final c = _container(repo);
    final practice = c.read(practiceProvider.notifier);

    await practice.beginSession(
      programRevisionId: 'rev-1',
      plannedSessionId: 'planned-1',
      readiness: answers,
    );
    await practice.loadExecution();

    final state = c.read(practiceProvider);
    // SESSION-2: hold does not cancel the session; the runner still loads and
    // surfaces the reason.
    expect(state.isLive, isTrue);
    expect(state.readiness?.blocksSession, isTrue);
    expect(state.readiness?.reasons, contains('Giảm tải vì bạn báo đau gối'));
  });

  test('reset clears a finished session back to the demo state', () async {
    final repo = _FakePracticeRepository(
      const ReadinessResult(verdict: ReadinessVerdict.ready),
    );
    final c = _container(repo);
    final practice = c.read(practiceProvider.notifier);

    await practice.beginSession(
      programRevisionId: 'rev-1',
      readiness: answers,
    );
    await practice.loadExecution();
    expect(c.read(practiceProvider).isLive, isTrue);

    practice.reset();
    expect(c.read(practiceProvider).isLive, isFalse);
  });
}
