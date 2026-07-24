import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/theme/app_theme.dart';
import 'package:mobile/core/theme/tokens.dart';
import 'package:mobile/features/home/data/access_controller.dart';
import 'package:mobile/features/home/data/current_providers.dart';
import 'package:mobile/features/home/data/dashboard_providers.dart';
import 'package:mobile/features/home/data/session_log_controller.dart';
import 'package:mobile/features/home/models/current.dart';
import 'package:mobile/features/home/models/dashboard.dart';
import 'package:mobile/features/home/models/session_log.dart';
import 'package:mobile/features/home/presentation/screens/home_screen.dart';
import 'package:mobile/features/home/presentation/widgets/home_metrics.dart';
import 'package:mobile/features/plan/data/mock_plan_repository.dart';
import 'package:mobile/features/plan/data/plan_providers.dart';
import 'package:mobile/l10n/app_localizations.dart';
import 'package:mobile/router.dart';

final _wednesday = DateTime(2026, 7, 22, 9, 41);

/// A dashboard whose numbers differ from the local seed, so a rendered value can
/// only have come from the server payload — proving Home reads it, not the mock.
Dashboard _serverDashboard() => Dashboard(
  sessionLog: SessionLog(
    days: [
      LoggedDay(date: DateTime(2026, 7, 20), completed: true),
      LoggedDay(date: DateTime(2026, 7, 22), completed: true),
    ],
    baselineSessions: 4,
  ),
  streak: 7, // the seed's streak on _wednesday is 1
  adherence: 0.5,
  due: 8,
  done: 4,
  programProgress: const ProgramProgress(completed: 4, total: 36),
  accessTier: AccessTier.free,
  nextSession: null,
  recent: DashboardRecentSession(
    sessionId: 's-1',
    name: 'Server workout',
    volumeKg: 1234,
    exercises: 9,
    completedAt: DateTime.utc(2026, 7, 22, 10, 30),
  ),
);

/// [dashboard] is what `dashboardProvider` resolves to — pass a fixed [Dashboard]
/// to assert Home renders the server payload, or null to exercise the fallback.
/// [current] is what `currentProvider` resolves to (the hero's actionable session
/// source, GET /program/current); null exercises the dashboard/seed fallback.
Future<ProviderContainer> pumpHome(
  WidgetTester tester, {
  required Dashboard? dashboard,
  Current? current,
}) async {
  final container = ProviderContainer(
    overrides: [
      nowProvider.overrideWithValue(_wednesday),
      planRepositoryProvider.overrideWithValue(
        const MockPlanRepository(delay: Duration.zero),
      ),
      dashboardProvider.overrideWith((ref) async => dashboard),
      currentProvider.overrideWith((ref) async => current),
    ],
  );
  addTearDown(container.dispose);

  final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (_, _) => const HomeScreen()),
      GoRoute(
        path: Routes.practice,
        builder: (_, _) => const Scaffold(body: SizedBox.shrink()),
      ),
    ],
  );
  addTearDown(router.dispose);

  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: container,
      child: MaterialApp.router(
        theme: buildAppTheme(),
        locale: const Locale('en'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: router,
      ),
    ),
  );
  await tester.pumpAndSettle();
  return container;
}

void main() {
  testWidgets('renders the server-computed streak, not the local seed', (
    tester,
  ) async {
    await pumpHome(tester, dashboard: _serverDashboard());

    // Whole-program progress bar reads programProgress off the server payload.
    // Asserted before the drag below scrolls the week section out of view.
    expect(find.text('4/36 sessions'), findsOneWidget);

    // The stat tiles sit below the fold in the test viewport; ListView only
    // builds what is visible. Drag the Streak tile into view (and stop there, so
    // the tiles stay built) before asserting on their values.
    await tester.dragUntilVisible(
      find.text('Streak'),
      find.byType(ListView),
      const Offset(0, -200),
    );
    await tester.pump(AppMotion.cardStagger * 6 + AppMotion.cardRise);
    await tester.pumpAndSettle();

    // The two stat tiles read their numbers off the server dashboard, never the
    // local seed. Asserting on the tile's `value` is sturdier than a raw text
    // match (the week strip also renders bare day numbers).
    final tiles = tester
        .widgetList<HomeMetricTile>(find.byType(HomeMetricTile))
        .toList();
    expect(tiles, hasLength(2));
    expect(tiles[0].value, '7'); // streak — seed on _wednesday is not 7
    expect(tiles[1].value, '50'); // adherence 0.5 → 50%
  });

  testWidgets('falls back to the local session log when the dashboard is null', (
    tester,
  ) async {
    await pumpHome(tester, dashboard: null);

    // No throw, Home still renders its week section from the local seed.
    expect(find.text('This week'), findsOneWidget);
  });

  testWidgets(
    'a training day with no logs shows the session + Start, not recovery',
    (tester) async {
      // The regression: an empty session log (nobody has logged yet) used to make
      // the hero read "Recovery day". With /program/current saying it is a
      // training day, the hero must show the session and an enabled Start CTA.
      await pumpHome(
        tester,
        dashboard: _serverDashboard(),
        current: const Current(
          status: CurrentStatus.training,
          date: '2026-07-22',
          weekNumber: 1,
          dayNumber: 2,
          programRevisionId: 'rev-1',
          session: SessionSummary(
            plannedSessionId: 'ps-today',
            programRevisionId: 'rev-1',
            name: 'Push Day A',
            exercises: 5,
          ),
          nextSession: null,
          completed: 0,
          total: 7,
        ),
      );

      expect(find.text('Push Day A'), findsOneWidget);
      expect(find.text('Recovery day'), findsNothing);
      // The Start CTA is present and enabled.
      final cta = tester.widget<FilledButton>(find.byType(FilledButton).first);
      expect(cta.onPressed, isNotNull);
    },
  );

  testWidgets('a rest day still offers the next session to train ahead', (
    tester,
  ) async {
    await pumpHome(
      tester,
      dashboard: _serverDashboard(),
      current: const Current(
        status: CurrentStatus.rest,
        date: '2026-07-22',
        programRevisionId: 'rev-1',
        session: null,
        nextSession: SessionSummary(
          plannedSessionId: 'ps-next',
          programRevisionId: 'rev-1',
          name: 'Pull Day B',
          exercises: 4,
        ),
        completed: 2,
        total: 7,
      ),
    );

    // Rest day, but the next session is offered with an enabled Start.
    expect(find.text('Pull Day B'), findsOneWidget);
    final cta = tester.widget<FilledButton>(find.byType(FilledButton).first);
    expect(cta.onPressed, isNotNull);
  });
}
