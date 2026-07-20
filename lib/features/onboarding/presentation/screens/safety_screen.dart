import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/l10n/enum_labels.dart';
import '../../../../core/theme/tokens.dart';
import '../../../../core/widgets/input_card.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/screen_scaffold.dart';
import '../../../../core/widgets/selection_controls.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../router.dart';
import '../../models/enums.dart';
import '../controller/onboarding_controller.dart';
import '../widgets/injury_row.dart';

/// Screen 5 — injuries and mobility. Drives the safety guardrails, so the shape
/// of each injury is captured explicitly rather than inferred from free text.
class SafetyScreen extends ConsumerWidget {
  const SafetyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);
    final notifier = ref.read(onboardingProvider.notifier);
    final c = ref.watch(onboardingProvider).constraint;

    return ScreenScaffold(
      progress: Routes.progressFor(Routes.safety),
      header: ScreenHeader(
        title: t.safetyTitle,
        leading: CircleBackButton(onTap: () => context.go(Routes.basics)),
      ),
      footer: PrimaryButton(
        label: t.commonContinue,
        onPressed: () => context.go(Routes.context),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            eyebrow: null,
            headline: t.safetyHeadline,
            body: t.safetyBody,
          ),
          const SizedBox(height: 20),

          InputCard(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            t.safetyInjuryQuestion,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            t.safetyInjurySubtitle,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.muted,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    AppSwitch(
                      value: c.hasInjury,
                      onChanged: notifier.setHasInjury,
                    ),
                  ],
                ),

                if (c.hasInjury) ...[
                  const SizedBox(height: 16),
                  Divider(color: AppColors.line),
                  const SizedBox(height: 16),

                  for (final (index, injury) in c.injuries.indexed) ...[
                    if (index > 0) const SizedBox(height: 12),
                    InjuryRow(
                      injury: injury,
                      onChanged: (updated) =>
                          notifier.updateInjury(index, updated),
                      onRemove: c.injuries.length > 1
                          ? () => notifier.removeInjury(index)
                          : null,
                    ),
                  ],

                  const SizedBox(height: 12),
                  AddRowButton(
                    label: t.safetyAddInjury,
                    onTap: notifier.addInjury,
                  ),
                ],
              ],
            ),
          ),

          // Chips sit directly under the section title, not inside a card.
          // No "none" chip: an empty selection already means "no limits", so
          // the plain enum type is enough and the nullable cast goes away.
          SectionTitle(t.safetyMobilityLabel),
          ChipMultiSelect<MobilityLimit>(
            selected: c.mobilityLimits,
            onChanged: notifier.setMobilityLimits,
            options: [
              for (final limit in MobilityLimit.values)
                SelectOption(value: limit, label: limit.label(t)),
            ],
          ),
        ],
      ),
    );
  }
}
