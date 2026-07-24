import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/theme/app_theme.dart';
import 'package:mobile/core/theme/tokens.dart';
import 'package:mobile/features/home/data/access_controller.dart';
import 'package:mobile/features/home/data/dashboard_providers.dart';
import 'package:mobile/features/home/data/session_log_controller.dart';
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
Future<ProviderContainer> pumpHome(
  WidgetTester tester, {
  required Dashboard? dashboard,
}) async {
  final container = ProviderContainer(
    overrides: [
      nowProvider.overrideWithValue(_wednesday),
      planRepositoryProvider.overrideWithValue(
        const MockPlanRepository(delay: Duration.zero),
      ),
      dashboardProvider.overrideWith((ref) async => dashboard),
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
}
