import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/l10n/enum_labels.dart';
import '../../../../core/theme/tokens.dart';
import '../../../../core/widgets/input_card.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/screen_scaffold.dart';
import '../../../../core/widgets/selection_controls.dart';
import '../../../../core/widgets/toast.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../router.dart';
import '../../data/profile_messages.dart';
import '../../data/profile_submit_controller.dart';
import '../../models/onboarding_data.dart';
import '../controller/onboarding_controller.dart';
import '../widgets/review_summary_card.dart';

/// Screen 8 — "confirm before consequence". Shows only the raw answers, with no
/// AI commentary, and gates plan generation behind an explicit confirmation.
class RawReviewScreen extends ConsumerWidget {
  const RawReviewScreen({super.key});

  /// Persists the profile, then moves on to generation. The plan is derived
  /// from the stored profile server-side, so the save has to land first —
  /// on failure the user stays here with every answer intact.
  static Future<void> _submit(BuildContext context, WidgetRef ref) async {
    final t = AppLocalizations.of(context);
    try {
      await ref.read(profileSubmitProvider.notifier).submit();
      if (!context.mounted) return;
      context.go(Routes.generating);
    } catch (error) {
      if (!context.mounted) return;
      showAppToast(ref, profileErrorMessage(t, error));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);
    final data = ref.watch(onboardingProvider);
    final notifier = ref.read(onboardingProvider.notifier);
    final c = data.constraint;
    final saving = ref.watch(profileSubmitProvider).isLoading;

    return ScreenScaffold(
      progress: Routes.progressFor(Routes.review),
      header: ScreenHeader(
        title: t.reviewTitle,
        leading: CircleBackButton(onTap: () => context.go(Routes.diet)),
      ),
      footer: PrimaryButton(
        label: saving ? t.reviewSavingCta : t.reviewGenerateCta,
        variant: PrimaryButtonVariant.lime,
        onPressed: data.confirmed && !saving
            ? () => _submit(context, ref)
            : null,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(headline: t.reviewHeadline, body: t.reviewBody),
          const SizedBox(height: 20),

          ReviewSummaryCard(
            title: t.reviewStorySection,
            editRoute: Routes.story,
            editLabel: t.commonEdit,
            rows: const [],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.raw.story.isEmpty ? t.reviewNoStory : data.raw.story,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.55,
                    color: Color(0xFFF2F2F7),
                  ),
                ),
                const SizedBox(height: 16),
                const Divider(color: AppColors.line, height: 1),
                const SizedBox(height: 16),
                if (data.goalLines.isEmpty)
                  Text(
                    t.reviewNoGoals,
                    style: const TextStyle(fontSize: 13, color: AppColors.muted),
                  )
                else
                  Wrap(
                    spacing: 9,
                    runSpacing: 9,
                    children: [
                      // Goals read as confirmed selections, so they use the
                      // same inverted fill as a selected chip.
                      for (final goal in data.goalLines)
                        Container(
                          constraints: const BoxConstraints(minHeight: 34),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(AppRadii.pill),
                          ),
                          child: Text(
                            goal,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                    ],
                  ),
              ],
            ),
          ),
          const SizedBox(height: 22),

          ReviewSummaryCard(
            title: t.reviewBodySection,
            editRoute: Routes.basics,
            editLabel: t.commonEdit,
            rows: [
              ReviewRow(t.basicsSexLabel, c.sex.label(t)),
              ReviewRow(t.basicsAgeLabel, t.reviewAgeValue(c.age)),
              ReviewRow(t.basicsHeightLabel, '${_trim(c.heightCm)} ${t.unitCm}'),
              ReviewRow(t.basicsWeightLabel, '${_trim(c.weightKg)} ${t.unitKg}'),
              ReviewRow(
                t.basicsExperienceLabel,
                c.experienceLevel.label(t),
              ),
              ReviewRow(
                t.reviewRecentActivityLabel,
                c.recentActivityLevel.label(t),
              ),
              ReviewRow(
                t.reviewDetrainingLabel,
                c.detrainingGap.label(t),
              ),
            ],
          ),
          const SizedBox(height: 22),

          ReviewSummaryCard(
            title: t.reviewSafetySection,
            editRoute: Routes.safety,
            editLabel: t.commonEdit,
            rows: [
              ReviewRow(
                t.reviewInjuryLabel,
                _injurySummary(t, c),
              ),
              ReviewRow(
                t.reviewMobilityLabel,
                c.mobilityLimits.isEmpty
                    ? t.commonNone
                    : c.mobilityLimits.map((m) => m.label(t)).join(', '),
              ),
            ],
          ),
          const SizedBox(height: 22),

          ReviewSummaryCard(
            title: t.reviewContextSection,
            editRoute: Routes.context,
            editLabel: t.commonEdit,
            rows: [
              ReviewRow(t.contextSpaceLabel, c.space.label(t)),
              ReviewRow(
                t.reviewEquipmentLabel,
                c.equipment.isEmpty
                    ? t.commonNone
                    : c.equipment.map((e) => e.label(t)).join(', '),
              ),
              ReviewRow(
                t.reviewBudgetLabel,
                c.budgetWillingness.label(t),
              ),
              ReviewRow(
                t.reviewDurationLabel,
                t.reviewMinutesPerSession(c.schedule.minutesPerSession),
              ),
              ReviewRow(
                t.reviewScheduleLabel,
                '${c.schedule.preferredDays.map((d) => d.shortLabel(t)).join(', ')} · '
                    '${c.schedule.preferredTime}',
              ),
            ],
          ),
          const SizedBox(height: 22),

          ReviewSummaryCard(
            title: t.reviewDietSection,
            editRoute: Routes.diet,
            editLabel: t.commonEdit,
            rows: [
              ReviewRow(t.reviewDietTypeLabel, c.diet.type.label(t)),
              ReviewRow(
                t.reviewAllergiesLabel,
                c.diet.allergies.isEmpty
                    ? t.commonNone
                    : c.diet.allergies.join(', '),
              ),
              ReviewRow(
                t.reviewRestrictionsLabel,
                c.diet.restrictions.isEmpty
                    ? t.commonNone
                    : c.diet.restrictions.join(', '),
              ),
            ],
          ),
          const SizedBox(height: 16),

          InputCard(
            child: AppCheckbox(
              value: data.confirmed,
              label: t.reviewConfirmCheckbox,
              onChanged: notifier.setConfirmed,
            ),
          ),
        ],
      ),
    );
  }

  static String _trim(double value) =>
      value == value.roundToDouble() ? '${value.round()}' : '$value';

  static String _injurySummary(AppLocalizations t, Constraint c) {
    if (!c.hasInjury || c.injuries.isEmpty) return t.commonNone;

    return c.injuries.map((injury) {
      final status = injury.active
          ? t.reviewInjuryStillActive
          : t.reviewInjuryResolved;
      final base = '${injury.area.label(t)} · ${injury.severity.label(t)} · $status';
      return injury.notes.isEmpty ? base : '$base · ${injury.notes}';
    }).join('\n');
  }
}
