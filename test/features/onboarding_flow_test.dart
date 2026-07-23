import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/app.dart';
import 'package:mobile/core/l10n/locale_controller.dart';
import 'package:mobile/features/onboarding/presentation/controller/onboarding_controller.dart';
import 'package:mobile/features/plan/data/mock_plan_repository.dart';
import 'package:mobile/features/plan/data/plan_providers.dart';
import 'package:mobile/features/plan/data/plan_repository.dart';
import 'package:mobile/l10n/app_localizations.dart';
import 'package:mobile/router.dart';

import '../support/auth_override.dart';

/// Boots the app in a phone-sized viewport with a fast mock so the loading
/// screen doesn't dominate test time.
Future<ProviderContainer> _boot(
  WidgetTester tester, {
  Locale locale = const Locale('vi'),
  Size size = const Size(390, 844),
}) async {
  tester.view
    ..physicalSize = size
    ..devicePixelRatio = 1.0;
  addTearDown(tester.view.reset);

  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        ...signedInOverrides,
        planRepositoryProvider.overrideWithValue(
          const MockPlanRepository(delay: Duration(milliseconds: 10))
              as PlanRepository,
        ),
      ],
      child: const FitnessApp(),
    ),
  );
  await tester.pump();

  final container = ProviderScope.containerOf(
    tester.element(find.byType(FitnessApp)),
  );
  container.read(localeControllerProvider.notifier).set(locale);
  await tester.pump();
  return container;
}

/// Taps a label and lets the route transition finish.
///
/// Uses fixed pumps rather than [WidgetTester.pumpAndSettle]: the welcome and
/// loading screens hold perpetual animations (LoaderRing, LoadingDots), so the
/// tree never reaches a settled state.
Future<void> _tapText(WidgetTester tester, String text) async {
  await tester.ensureVisible(find.text(text).first);
  await tester.pump();
  await tester.tap(find.text(text).first, warnIfMissed: false);
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 400));
}

void main() {
  testWidgets('walks the full flow and reaches the plan', (tester) async {
    final container = await _boot(tester);
    final t = lookupAppLocalizations(const Locale('vi'));

    // Signed in (see signedInOverrides), so the router skips the account gate
    // and lands on /home. Jump to where onboarding begins.
    container.read(routerProvider).go(Routes.welcome);
    await tester.pumpAndSettle();
    expect(find.text(t.welcomeCta), findsOneWidget);

    // 2 — welcome.
    await _tapText(tester, t.welcomeCta);
    expect(find.text(t.storyLabel), findsOneWidget);

    // 3 — story is prefilled with the sample text. The seed is written in a
    // post-frame callback, so let a couple of frames run.
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    expect(
      find.text(t.seedStory),
      findsOneWidget,
      reason: 'the story field shows the seeded sample',
    );
    expect(container.read(onboardingProvider).raw.story, isNotEmpty);
    await _tapText(tester, t.commonContinue);

    // 4 — basics.
    expect(find.text(t.basicsSexLabel), findsOneWidget);
    await _tapText(tester, t.commonContinue);

    // 5 — safety.
    expect(find.text(t.safetyInjuryQuestion), findsOneWidget);
    await _tapText(tester, t.commonContinue);

    // 6 — context.
    expect(find.text(t.contextSpaceLabel), findsOneWidget);
    await _tapText(tester, t.commonContinue);

    // 7 — diet.
    expect(find.text(t.dietTypeLabel), findsOneWidget);
    await _tapText(tester, t.commonContinue);

    // 8 — review. The CTA is inert until the box is ticked.
    expect(find.text(t.reviewGenerateCta), findsOneWidget);
    await _tapText(tester, t.reviewGenerateCta);
    expect(find.text(t.reviewGenerateCta), findsOneWidget, reason: 'still on review');

    await _tapText(tester, t.reviewConfirmCheckbox);
    expect(container.read(onboardingProvider).confirmed, isTrue);

    await _tapText(tester, t.reviewGenerateCta);

    // 9 — loading, then 10 — the plan. Fixed pumps: the loader ring never
    // settles.
    await tester.pump(const Duration(seconds: 1));
    await tester.pump(const Duration(seconds: 1));
    await tester.pump(const Duration(milliseconds: 600));
    expect(find.text(t.planStartCta), findsOneWidget);
  });

  testWidgets('the review edit link jumps back and preserves entered data', (
    tester,
  ) async {
    // The load-bearing case: jump backwards from review, then return, and
    // nothing is lost. This is what a copyWith bug would break quietly.
    final container = await _boot(tester);
    final t = lookupAppLocalizations(const Locale('vi'));

    container.read(routerProvider).go(Routes.welcome);
    await tester.pumpAndSettle();
    await _tapText(tester, t.welcomeCta);
    await _tapText(tester, t.commonContinue); // story

    // Change the age on the basics screen, then carry on to review.
    // Located via its labelled field rather than by index: the basics screen
    // has several inputs and their tree order is presentational.
    final ageField = find.descendant(
      of: find.ancestor(
        of: find.text(t.basicsAgeLabel),
        matching: find.byType(Column),
      ).first,
      matching: find.byType(TextField),
    ).first;
    await tester.enterText(ageField, '31');
    await tester.pump();
    expect(container.read(onboardingProvider).constraint.age, 31);

    await _tapText(tester, t.commonContinue); // basics -> safety
    await _tapText(tester, t.commonContinue); // safety -> context
    await _tapText(tester, t.commonContinue); // context -> diet
    await _tapText(tester, t.commonContinue); // diet -> review

    expect(find.text(t.reviewGenerateCta), findsOneWidget);
    // The edited value is reflected in the summary.
    expect(find.textContaining('31'), findsWidgets);

    // Tap the edit link belonging to the body/experience card, located by its
    // section title rather than by index — the card order is presentational.
    final bodyCard = find.ancestor(
      of: find.text(t.reviewBodySection),
      matching: find.byType(Column),
    );
    final editLink = find.descendant(
      of: bodyCard.first,
      matching: find.text(t.commonEdit),
    );
    expect(editLink, findsWidgets);
    // The card sits below the fold on a 390×844 viewport.
    await tester.ensureVisible(editLink.first);
    await tester.pump();
    await tester.tap(editLink.first);
    await tester.pumpAndSettle();

    // We landed back on basics with the entered age intact. `findsWidgets`:
    // the label also appears as a review row, and both can be mounted briefly
    // during the route transition.
    expect(find.text(t.basicsSexLabel), findsWidgets);
    expect(container.read(onboardingProvider).constraint.age, 31);

    // Returning forward keeps it.
    await _tapText(tester, t.commonContinue);
    await _tapText(tester, t.commonContinue);
    await _tapText(tester, t.commonContinue);
    await _tapText(tester, t.commonContinue);
    expect(find.text(t.reviewGenerateCta), findsOneWidget);
    expect(container.read(onboardingProvider).constraint.age, 31);
  });

  testWidgets('screen 6 blocks continuing with no training day', (
    tester,
  ) async {
    final container = await _boot(tester);
    final t = lookupAppLocalizations(const Locale('vi'));

    // Navigate to the context screen.
    container.read(routerProvider).go(Routes.welcome);
    await tester.pumpAndSettle();
    await _tapText(tester, t.welcomeCta);
    await _tapText(tester, t.commonContinue); // story
    await _tapText(tester, t.commonContinue); // basics
    await _tapText(tester, t.commonContinue); // safety

    expect(find.text(t.contextSpaceLabel), findsOneWidget);

    // Clear every training day now that we're on the screen that guards it.
    container.read(onboardingProvider.notifier).setPreferredDays({});
    await tester.pump();
    expect(
      container.read(onboardingProvider).constraint.schedule.preferredDays,
      isEmpty,
    );

    // With zero days the CTA must toast rather than advance.
    await _tapText(tester, t.commonContinue);
    expect(find.text(t.contextNoDaySelected), findsOneWidget);
    expect(find.text(t.contextSpaceLabel), findsOneWidget);
  });
}
