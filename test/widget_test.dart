import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/app.dart';
import 'package:mobile/core/l10n/locale_controller.dart';
import 'package:mobile/core/theme/tokens.dart';
import 'package:mobile/l10n/app_localizations.dart';

void main() {
  testWidgets('app boots into the account gate with the dark theme', (
    tester,
  ) async {
    await tester.pumpWidget(const ProviderScope(child: MachApp()));
    await tester.pump();

    final theme = Theme.of(tester.element(find.byType(Scaffold).first));
    expect(theme.scaffoldBackgroundColor, AppColors.bg);
    expect(theme.colorScheme.primary, AppColors.lime);
  });

  testWidgets('locale defaults to the device and follows an override', (
    tester,
  ) async {
    await tester.pumpWidget(const ProviderScope(child: MachApp()));
    await tester.pump();

    final container = ProviderScope.containerOf(
      tester.element(find.byType(MachApp)),
    );
    // null => follow the device locale.
    expect(container.read(localeControllerProvider), isNull);

    container.read(localeControllerProvider.notifier).set(const Locale('vi'));
    await tester.pump();
    expect(find.text('Tiếp tục với Apple'), findsOneWidget);

    container.read(localeControllerProvider.notifier).set(const Locale('en'));
    await tester.pump();
    expect(find.text('Continue with Apple'), findsOneWidget);
  });

  test('every supported locale resolves its keys', () {
    // Guards against a key added to the vi template but never translated.
    for (final locale in AppLocalizations.supportedLocales) {
      final t = lookupAppLocalizations(locale);
      final code = locale.languageCode;
      expect(t.appName, isNotEmpty, reason: '$code: appName');
      expect(t.commonContinue, isNotEmpty, reason: '$code: commonContinue');
      expect(t.accountHeadline, isNotEmpty, reason: '$code: accountHeadline');
      expect(t.planStartCta, isNotEmpty, reason: '$code: planStartCta');
      expect(t.seedStory, isNotEmpty, reason: '$code: seedStory');
    }
  });
}
