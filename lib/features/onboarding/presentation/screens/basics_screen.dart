import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/l10n/enum_labels.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/input_card.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/screen_scaffold.dart';
import '../../../../core/theme/typography.dart';
import '../../../../core/widgets/selection_controls.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../router.dart';
import '../../models/enums.dart';
import '../controller/onboarding_controller.dart';

/// Screen 4 — body and experience. These feed the guardrails directly.
class BasicsScreen extends ConsumerStatefulWidget {
  const BasicsScreen({super.key});

  @override
  ConsumerState<BasicsScreen> createState() => _BasicsScreenState();
}

class _BasicsScreenState extends ConsumerState<BasicsScreen> {
  late final TextEditingController _age;
  late final TextEditingController _height;
  late final TextEditingController _weight;

  @override
  void initState() {
    super.initState();
    final c = ref.read(onboardingProvider).constraint;
    _age = TextEditingController(text: '${c.age}');
    _height = TextEditingController(text: _trim(c.heightCm));
    _weight = TextEditingController(text: _trim(c.weightKg));
  }

  /// 172.0 reads better as "172" in a form field.
  static String _trim(double value) => value == value.roundToDouble() ? '${value.round()}' : '$value';

  @override
  void dispose() {
    _age.dispose();
    _height.dispose();
    _weight.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final notifier = ref.read(onboardingProvider.notifier);
    final c = ref.watch(onboardingProvider).constraint;

    return ScreenScaffold(
      progress: Routes.progressFor(Routes.basics),
      header: ScreenHeader(
        title: t.basicsTitle,
        leading: CircleBackButton(onTap: () => context.go(Routes.story)),
      ),
      footer: PrimaryButton(label: t.commonContinue, onPressed: () => context.go(Routes.safety)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(headline: t.basicsHeadline, body: t.basicsBody),
          const SizedBox(height: 20),

          LabeledField(
            label: t.basicsSexLabel,
            child: SegmentedControl<Sex>(
              value: c.sex,
              onChanged: notifier.setSex,
              options: [for (final sex in Sex.values) SelectOption(value: sex, label: sex.label(t))],
            ),
          ),
          const SizedBox(height: 16),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: LabeledField(
                  label: t.basicsAgeLabel,
                  child: UnitInput(
                    controller: _age,
                    unit: t.unitYears,
                    onChanged: (v) => notifier.setAge(int.tryParse(v) ?? c.age),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: LabeledField(
                  label: t.basicsExperienceLabel,
                  child: AppDropdown<ExperienceLevel>(
                    value: c.experienceLevel,
                    title: t.basicsExperienceLabel,
                    onChanged: notifier.setExperience,
                    options: [
                      for (final level in ExperienceLevel.values) SelectOption(value: level, label: level.label(t)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // §1.2 — deliberately its own question rather than folded into
          // experience: the backend caps volume for someone who is skilled but
          // has not trained recently.
          LabeledField(
            label: t.basicsRecentActivityLabel,
            child: SegmentedControl<RecentActivityLevel>(
              value: c.recentActivityLevel,
              onChanged: notifier.setRecentActivity,
              options: [
                for (final level in RecentActivityLevel.values)
                  SelectOption(value: level, label: level.shortLabel(t)),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _HelpText(t.basicsRecentActivityHelp),
          const SizedBox(height: 16),

          LabeledField(
            label: t.basicsDetrainingLabel,
            child: AppDropdown<DetrainingGap>(
              value: c.detrainingGap,
              title: t.basicsDetrainingLabel,
              onChanged: notifier.setDetrainingGap,
              options: [
                for (final gap in DetrainingGap.values)
                  SelectOption(value: gap, label: gap.label(t)),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _HelpText(t.basicsDetrainingHelp),
          const SizedBox(height: 16),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: LabeledField(
                  label: t.basicsHeightLabel,
                  child: UnitInput(
                    controller: _height,
                    unit: t.unitCm,
                    decimal: true,
                    onChanged: (v) => notifier.setHeight(double.tryParse(v.replaceAll(',', '.')) ?? c.heightCm),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: LabeledField(
                  label: t.basicsWeightLabel,
                  child: UnitInput(
                    controller: _weight,
                    unit: t.unitKg,
                    decimal: true,
                    onChanged: (v) => notifier.setWeight(double.tryParse(v.replaceAll(',', '.')) ?? c.weightKg),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Explanatory line under a field, for the two questions whose purpose is not
/// self-evident from the label alone.
class _HelpText extends StatelessWidget {
  const _HelpText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) => Text(text, style: AppText.hint);
}
