import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/core/theme/app_theme.dart';
import 'package:mobile/core/theme/tokens.dart';
import 'package:mobile/features/home/data/access_controller.dart';
import 'package:mobile/features/home/data/session_log_controller.dart';
import 'package:mobile/features/home/presentation/screens/home_screen.dart';
import 'package:mobile/features/home/presentation/widgets/progress_card.dart';
import 'package:mobile/features/plan/data/mock_plan_repository.dart';
import 'package:mobile/features/plan/data/plan_providers.dart';
import 'package:mobile/l10n/app_localizations.dart';

/// Wednesday — a training day in the seeded plan, with one session still open.
final _wednesday = DateTime(2026, 7, 22, 9, 41);

Future<ProviderContainer> pumpHome(
  WidgetTester tester, {
  DateTime? now,
}) async {
  final container = ProviderContainer(
    overrides: [
      nowProvider.overrideWithValue(now ?? _wednesday),
      // The mock's 2.6s "generating" delay would outlive the test as a pending
      // timer; home only needs the resolved plan, not the theatre.
      planRepositoryProvider.overrideWithValue(
        const MockPlanRepository(delay: Duration.zero),
      ),
    ],
  );
  addTearDown(container.dispose);

  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: container,
      child: MaterialApp(
        theme: buildAppTheme(),
        locale: const Locale('en'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const HomeScreen(),
      ),
    ),
  );
  await tester.pumpAndSettle();

  return container;
}

/// The Progress card sits below the fold, and [ListView] only builds what is
/// visible — reach it before asserting on it.
Future<void> scrollToProgress(WidgetTester tester) async {
  await tester.dragUntilVisible(
    find.text('Progress'),
    find.byType(ListView),
    const Offset(0, -200),
  );
  // Scrolling mounts cards whose ScreenEnter stagger is a plain Future.delayed,
  // which pumpAndSettle cannot drain — pump past the longest one so no timer
  // outlives the test.
  await tester.pump(AppMotion.cardStagger * 6 + AppMotion.cardRise);
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('renders the dashboard with today\'s session', (tester) async {
    await pumpHome(tester);

    expect(find.text('Today'), findsOneWidget);
    expect(find.text('NEXT SESSION · TODAY'), findsOneWidget);
    expect(find.text('Start session'), findsOneWidget);
    expect(find.text('This week'), findsOneWidget);
  });

  testWidgets('free tier keeps the analysis locked', (tester) async {
    await pumpHome(tester);
    await scrollToProgress(tester);

    expect(find.byType(LockedProgressCard), findsOneWidget);
    expect(find.byType(UnlockedProgressCard), findsNothing);

    // The verdict is the paid payload — it must not be in the tree at all,
    // since a blur alone would still expose it to screen readers.
    expect(find.text('Yes, you\'re progressing'), findsNothing);
    expect(find.text('Early positive signal'), findsNothing);
    expect(find.text('Unlock Progress'), findsOneWidget);
  });

  testWidgets('paid tier reveals verdict and domain trends', (tester) async {
    final container = await pumpHome(tester);

    container.read(accessProvider.notifier).toggle();
    await tester.pumpAndSettle();
    await scrollToProgress(tester);

    expect(find.byType(UnlockedProgressCard), findsOneWidget);
    expect(find.byType(LockedProgressCard), findsNothing);
    expect(find.text('Strength'), findsOneWidget);
    expect(find.text('Endurance'), findsOneWidget);
    expect(find.text('Confidence'), findsOneWidget);
  });

  testWidgets('starting a session logs it and updates the metrics', (
    tester,
  ) async {
    final container = await pumpHome(tester);
    final before = container.read(sessionLogControllerProvider);
    expect(before.streakAsOf(_wednesday), 0);

    await tester.tap(find.text('Start session'));
    await tester.pumpAndSettle();

    final after = container.read(sessionLogControllerProvider);
    expect(after.streakAsOf(_wednesday), 2);
    expect(after.adherenceAsOf(_wednesday), 1);

    // The CTA settles into its completed state rather than staying tappable.
    expect(find.text('Start session'), findsNothing);
    expect(find.text('Completed'), findsOneWidget);
  });

  testWidgets('a tomorrow session is shown but not startable', (tester) async {
    // Tuesday: the seeded plan trains Mon/Wed/Fri, so Wednesday is next.
    await pumpHome(tester, now: DateTime(2026, 7, 21, 9));

    expect(find.text('NEXT SESSION · TOMORROW'), findsOneWidget);
    expect(find.text('View details'), findsOneWidget);
    expect(find.text('Start session'), findsNothing);
  });

  testWidgets('a rest day shows recovery copy and a disabled CTA', (
    tester,
  ) async {
    // Saturday: Mon/Wed/Fri are all behind us and complete, so nothing is due.
    await pumpHome(tester, now: DateTime(2026, 7, 25, 9));

    expect(find.text('REST DAY'), findsOneWidget);
    expect(find.text('Recovery day'), findsOneWidget);

    final button = tester.widget<FilledButton>(
      find.ancestor(
        of: find.text('Completed'),
        matching: find.byType(FilledButton),
      ),
    );
    expect(button.onPressed, isNull);
  });
}
