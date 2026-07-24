import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/features/onboarding/models/computed_rules.dart';
import 'package:mobile/features/onboarding/models/onboarding_data.dart';
import 'package:mobile/features/plan/data/mock_plan_repository.dart';
import 'package:mobile/features/plan/models/plan_text.dart';
import 'package:mobile/l10n/app_localizations.dart';

void main() {
  test('every PlanText in the mock plan resolves in both locales', () async {
    const data = OnboardingData();
    final plan = await const MockPlanRepository(delay: Duration.zero)
        .generatePlan(data, computeRules(data));

    for (final locale in const [Locale('vi'), Locale('en')]) {
      final t = lookupAppLocalizations(locale);
      final code = locale.languageCode;

      final texts = <PlanText>[
        plan.headline, plan.summary, plan.rationale,
        ...plan.heroMetrics.map((m) => m.caption),
        ...plan.timeline.expand((p) => [p.weekRange, p.focus, p.detail]),
        ...plan.inferredNeeds,
        // The mock always supplies nutrition; the API may omit it.
        if (plan.nutrition case final n?) ...[n.body, n.healthNote],
        ...plan.sessions.expand((s) => [
          s.name,
          ...s.exercises.map((e) => e.name),
          ...s.exercises.map((e) => e.note).whereType<PlanText>(),
        ]),
      ];

      for (final text in texts) {
        final resolved = text.resolve(t);
        final key = switch (text) {
          PlanTextKey(:final key) => key,
          PlanTextRaw() => null,
        };
        // planLookup returns the key itself when unmapped — that's the failure.
        expect(resolved, isNot(equals(key)),
            reason: '$code: "$key" has no translation');
        expect(resolved, isNotEmpty, reason: '$code: "$key" is empty');
      }
      debugPrint('$code: ${texts.length} PlanText values all resolved');
    }
  });
}
