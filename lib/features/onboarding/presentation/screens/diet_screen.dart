import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/l10n/enum_labels.dart';
import '../../../../core/theme/tokens.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/input_card.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/screen_scaffold.dart';
import '../../../../core/widgets/selection_controls.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../router.dart';
import '../../models/enums.dart';
import '../controller/onboarding_controller.dart';

/// Screen 7 — diet constraints, so the plan avoids suggesting food the user
/// can't or won't eat.
class DietScreen extends ConsumerStatefulWidget {
  const DietScreen({super.key});

  @override
  ConsumerState<DietScreen> createState() => _DietScreenState();
}

class _DietScreenState extends ConsumerState<DietScreen> {
  late final TextEditingController _allergies;
  late final TextEditingController _restrictions;

  @override
  void initState() {
    super.initState();
    final diet = ref.read(onboardingProvider).constraint.diet;
    _allergies = TextEditingController(text: diet.allergies.join(', '));
    _restrictions = TextEditingController(text: diet.restrictions.join(', '));
  }

  @override
  void dispose() {
    _allergies.dispose();
    _restrictions.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final notifier = ref.read(onboardingProvider.notifier);
    final diet = ref.watch(onboardingProvider).constraint.diet;

    return ScreenScaffold(
      progress: Routes.progressFor(Routes.diet),
      header: ScreenHeader(
        title: t.dietTitle,
        leading: CircleBackButton(onTap: () => context.go(Routes.context)),
      ),
      footer: PrimaryButton(
        label: t.commonContinue,
        onPressed: () => context.go(Routes.review),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(headline: t.dietHeadline, body: t.dietBody),

          SectionTitle(t.dietTypeLabel),
          // A choice list rather than a dropdown: the options differ in ways a
          // collapsed control would hide.
          for (final type in DietType.values) ...[
            if (type != DietType.values.first) const SizedBox(height: 10),
            ChoiceRow(
              icon: _dietIcon(type),
              title: type.label(t),
              subtitle: _dietSubtitle(t, type),
              selected: diet.type == type,
              onTap: () => notifier.setDietType(type),
            ),
          ],
          const SizedBox(height: 18),

          LabeledField(
            label: t.dietAllergiesLabel,
            child: AppTextField(
              controller: _allergies,
              hint: t.dietAllergiesHint,
              onChanged: notifier.setAllergies,
            ),
          ),
          const SizedBox(height: AppSpacing.stackGap),

          LabeledField(
            label: t.dietRestrictionsLabel,
            child: AppTextField(
              controller: _restrictions,
              hint: t.dietRestrictionsHint,
              onChanged: notifier.setRestrictions,
            ),
          ),
        ],
      ),
    );
  }

  static String _dietIcon(DietType type) => switch (type) {
    DietType.omnivore => '🍚',
    DietType.vegetarian => '🥚',
    DietType.vegan => '🌱',
    DietType.pescatarian => '🐟',
    DietType.other => '🍽️',
  };

  static String _dietSubtitle(AppLocalizations t, DietType type) =>
      switch (type) {
        DietType.omnivore => t.dietOmnivoreSub,
        DietType.vegetarian => t.dietVegetarianSub,
        DietType.vegan => t.dietVeganSub,
        DietType.pescatarian => t.dietPescatarianSub,
        DietType.other => t.dietOtherSub,
      };
}
