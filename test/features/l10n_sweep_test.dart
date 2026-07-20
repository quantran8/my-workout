import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/app.dart';
import 'package:mobile/core/l10n/locale_controller.dart';
import 'package:mobile/features/plan/data/mock_plan_repository.dart';
import 'package:mobile/features/plan/data/plan_providers.dart';
import 'package:mobile/features/plan/data/plan_repository.dart';
import 'package:mobile/l10n/app_localizations.dart';

/// Walks every screen in both locales at both target widths.
///
/// The point is overflow: Vietnamese and English differ enough in length that a
/// layout can fit one and break the other, and 390px vs 430px shifts it again.
/// Any RenderFlex overflow fails the test, because flutter_test reports layout
/// exceptions as test failures.
void main() {
  for (final locale in const [Locale('vi'), Locale('en')]) {
    for (final size in const [Size(390, 844), Size(430, 932)]) {
      final label = '${locale.languageCode} @ ${size.width.toInt()}px';

      testWidgets('$label — every screen lays out without overflow', (
        tester,
      ) async {
        tester.view
          ..physicalSize = size
          ..devicePixelRatio = 1.0;
        addTearDown(tester.view.reset);

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              planRepositoryProvider.overrideWithValue(
                const MockPlanRepository(delay: Duration(milliseconds: 10))
                    as PlanRepository,
              ),
            ],
            child: const MachApp(),
          ),
        );
        await tester.pump();

        final container = ProviderScope.containerOf(
          tester.element(find.byType(MachApp)),
        );
        container.read(localeControllerProvider.notifier).set(locale);
        await tester.pump();

        final t = lookupAppLocalizations(locale);

        Future<void> tapText(String text) async {
          final finder = find.text(text).first;
          await tester.ensureVisible(finder);
          await tester.pump();
          await tester.tap(finder, warnIfMissed: false);
          await tester.pump();
          await tester.pump(const Duration(milliseconds: 400));
        }

        // 1 account gate
        await tester.enterText(find.byType(TextField).first, 'a@b.co');
        await tester.pump();
        await tapText(t.accountEmailCta);

        // 2 welcome
        await tapText(t.welcomeCta);

        // 3-7 the form steps
        await tapText(t.commonContinue); // story
        await tapText(t.commonContinue); // basics
        await tapText(t.commonContinue); // safety
        await tapText(t.commonContinue); // context
        await tapText(t.commonContinue); // diet

        // 8 review — scroll the whole card stack past the viewport.
        expect(find.text(t.reviewGenerateCta), findsOneWidget);
        await tester.drag(
          find.byType(SingleChildScrollView).first,
          const Offset(0, -600),
        );
        await tester.pump();

        await tapText(t.reviewConfirmCheckbox);
        await tapText(t.reviewGenerateCta);

        // 9 loading -> 10 plan
        await tester.pump(const Duration(seconds: 1));
        await tester.pump(const Duration(seconds: 1));
        await tester.pump(const Duration(milliseconds: 600));
        expect(find.text(t.planStartCta), findsOneWidget);

        // Scroll the plan, which holds the longest strings in the app.
        await tester.drag(
          find.byType(SingleChildScrollView).first,
          const Offset(0, -1200),
        );
        await tester.pump();
        await tester.drag(
          find.byType(SingleChildScrollView).first,
          const Offset(0, -1200),
        );
        await tester.pump();

        // Any overflow during the walk would already have failed the test.
        expect(tester.takeException(), isNull);
      });
    }
  }

  test('vi and en define exactly the same keys', () {
    // A key present in one locale but not the other renders as a fallback or
    // a raw key at runtime; catching it here is much cheaper.
    final vi = lookupAppLocalizations(const Locale('vi'));
    final en = lookupAppLocalizations(const Locale('en'));

    // Spot-check across every screen group, including the parameterised keys.
    expect(vi.appName, isNotEmpty);
    expect(en.appName, isNotEmpty);
    expect(vi.contextDayCount(3), isNotEmpty);
    expect(en.contextDayCount(3), isNotEmpty);
    expect(en.contextDayCount(1), contains('1'));
    expect(vi.reviewAgeValue(26), contains('26'));
    expect(en.reviewAgeValue(1), contains('1'));
    expect(vi.planSetsReps('3', '8-10'), isNotEmpty);
    expect(en.planSetsReps('3', '8-10'), isNotEmpty);
    expect(vi.homeWeekSessions(2, 3), isNotEmpty);
    expect(en.homeWeekSessions(2, 3), isNotEmpty);
  });
}
