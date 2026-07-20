import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/l10n/enum_labels.dart';
import '../../../../core/theme/tokens.dart';
import '../../../../core/theme/typography.dart';
import '../../../../core/widgets/input_card.dart';
import '../../../../core/widgets/loader_ring.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/screen_enter.dart';
import '../../../../core/widgets/screen_scaffold.dart';
import '../../../../core/widgets/toast.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../router.dart';
import '../../../onboarding/models/enums.dart';
import '../../../onboarding/presentation/controller/onboarding_controller.dart';
import '../../data/plan_providers.dart';
import '../../models/plan_text.dart';
import '../../models/workout_plan.dart';

/// Screen 10 — the generated plan.
class PlanScreen extends ConsumerWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);
    final plan = ref.watch(planProvider);

    // The ToastHost lives above the router, in MachApp.
    return plan.when(
      loading: () => const _PlanPlaceholder(),
      error: (_, _) => const _PlanPlaceholder(),
      data: (plan) => _PlanBody(plan: plan, t: t),
    );
  }
}

/// Shown only if the plan screen is reached directly, without the loading step.
class _PlanPlaceholder extends StatelessWidget {
  const _PlanPlaceholder();

  @override
  Widget build(BuildContext context) {
    return const ScreenScaffold(centred: true, body: Center(child: LoaderRing(size: 96)));
  }
}

class _PlanBody extends ConsumerWidget {
  const _PlanBody({required this.plan, required this.t});

  final WorkoutPlan plan;
  final AppLocalizations t;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Locale-aware grouping: 2.250 in vi, 2,250 in en.
    final numbers = NumberFormat.decimalPattern(Localizations.localeOf(context).toLanguageTag());

    return ScreenScaffold(
      header: ScreenHeader(
        title: t.planTitle,
        leading: CircleBackButton(onTap: () => context.go(Routes.review)),
        trailing: GestureDetector(
          onTap: () {
            ref.read(onboardingProvider.notifier).reset();
            context.go(Routes.account);
          },
          child: Text(
            t.planRestart,
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.white.withValues(alpha: 0.45)),
          ),
        ),
      ),
      footer: PrimaryButton(
        label: t.planStartCta,
        variant: PrimaryButtonVariant.lime,
        onPressed: () {
          showAppToast(ref, t.planSavedToast);
          context.go(Routes.home);
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cards cascade in, staggered by 60ms.
          _card(0, _hero(numbers)),
          _card(1, _timeline()),
          _card(2, _needs()),
          _card(3, _rationale()),
          _card(4, _nutrition(numbers)),
          _card(5, _schedule()),

          const SizedBox(height: 20),
          Text(t.planDisclaimer, textAlign: TextAlign.center, style: AppText.fine),
        ],
      ),
    );
  }

  Widget _card(int index, Widget child) => Padding(
    padding: const EdgeInsets.only(bottom: AppSpacing.stackGap),
    child: ScreenEnter(delay: AppMotion.cardStagger * index, duration: AppMotion.cardRise, child: child),
  );

  /// `.plan-hero` — a lime-to-transparent wash with a lime-tinted border.
  Widget _hero(NumberFormat numbers) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(19),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [AppColors.lime.withValues(alpha: 0.14), Colors.white.withValues(alpha: 0.03)],
      ),
      borderRadius: BorderRadius.circular(AppRadii.cardLg),
      border: Border.all(color: AppColors.lime.withValues(alpha: 0.18)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(t.planEyebrow.toUpperCase(), style: AppText.eyebrow),
        const SizedBox(height: 8),
        Text(plan.headline.resolve(t), style: AppText.titleSm),
        const SizedBox(height: 10),
        Text(plan.summary.resolve(t), style: const TextStyle(fontSize: 13, height: 1.5, color: AppColors.textDim)),
        const SizedBox(height: 13),
        Row(
          children: [
            for (final (i, metric) in plan.heroMetrics.indexed) ...[
              if (i > 0) const SizedBox(width: 8),
              Expanded(
                child: MetricTile(value: metric.value, caption: metric.caption.resolve(t)),
              ),
            ],
          ],
        ),
      ],
    ),
  );

  Widget _timeline() => AccentCard(
    eyebrow: t.planTimelineEyebrow,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(t.planTimelineHeadline, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        const SizedBox(height: 16),
        for (final (i, phase) in plan.timeline.indexed) ...[
          if (i > 0) const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.only(top: 5),
                decoration: const BoxDecoration(color: AppColors.lime, shape: BoxShape.circle),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${phase.weekRange.resolve(t)} · ${phase.focus.resolve(t)}',
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    Text(phase.detail.resolve(t), style: AppText.bodySm),
                  ],
                ),
              ),
            ],
          ),
        ],
      ],
    ),
  );

  Widget _needs() => AccentCard(
    tone: AccentTone.violet,
    eyebrow: t.planNeedsEyebrow,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final (i, need) in plan.inferredNeeds.indexed) ...[
          if (i > 0) const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 20,
                height: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: AppColors.violet.withValues(alpha: 0.18), shape: BoxShape.circle),
                child: Text(
                  '${i + 1}',
                  style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.violet),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(need.resolve(t), style: TextStyle(fontSize: 13, height: 1.5, color: AppColors.textSoft)),
              ),
            ],
          ),
        ],
      ],
    ),
  );

  Widget _rationale() => AccentCard(
    eyebrow: t.planRationaleEyebrow,
    child: Text(plan.rationale.resolve(t), style: AppText.bodySm),
  );

  Widget _nutrition(NumberFormat numbers) {
    final n = plan.nutrition;

    return AccentCard(
      tone: AccentTone.cyan,
      eyebrow: t.planNutritionTitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: _NutritionTile(
                  value: '${numbers.format(n.calorieLow)}–${numbers.format(n.calorieHigh)}',
                  caption: t.planCaloriesCaption,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _NutritionTile(value: '${n.proteinLow}–${n.proteinHigh}g', caption: t.planProteinCaption),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(n.body.resolve(t), style: AppText.bodySm),
          const SizedBox(height: 12),
          // `.notice` — a coral card, because a health caveat should read as a
          // caution rather than as more body copy.
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            decoration: BoxDecoration(
              color: AppColors.pink.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(AppRadii.field),
              border: Border.all(color: AppColors.pink.withValues(alpha: 0.16)),
            ),
            child: Text(
              n.healthNote.resolve(t),
              style: const TextStyle(fontSize: 13, height: 1.45, color: Color(0xFFFFD5DE)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _schedule() => AccentCard(
    eyebrow: t.planScheduleEyebrow,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                plan.sessions.map((s) => _weekdayLabel(s.day)).join(' · '),
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            Text(t.planScheduleHint, style: TextStyle(fontSize: 10, color: Colors.white.withValues(alpha: 0.30))),
          ],
        ),
        const SizedBox(height: 16),
        for (final (i, session) in plan.sessions.indexed) ...[
          if (i > 0) const SizedBox(height: 8),
          _SessionTile(session: session, t: t),
        ],
      ],
    ),
  );

  String _weekdayLabel(String name) {
    final day = Weekday.values.firstWhere((d) => d.name == name, orElse: () => Weekday.mon);
    return day.shortLabel(t);
  }
}

class _NutritionTile extends StatelessWidget {
  const _NutritionTile({required this.value, required this.caption});

  final String value;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(AppRadii.card),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
          ),
          const SizedBox(height: 4),
          Text(caption, style: TextStyle(fontSize: 10, color: Colors.white.withValues(alpha: 0.35))),
        ],
      ),
    );
  }
}

class _SessionTile extends StatelessWidget {
  const _SessionTile({required this.session, required this.t});

  final PlanSession session;
  final AppLocalizations t;

  @override
  Widget build(BuildContext context) {
    final day = Weekday.values.firstWhere((d) => d.name == session.day, orElse: () => Weekday.mon);

    return Theme(
      // ExpansionTile draws its own dividers, which fight the card border.
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadii.card),
        // Material, not a plain ColoredBox: ExpansionTile's ListTile paints its
        // ink splashes on the nearest Material ancestor, which a ColoredBox
        // would cover.
        child: Material(
          color: Colors.white.withValues(alpha: 0.03),
          child: ExpansionTile(
            tilePadding: const EdgeInsets.symmetric(horizontal: 16),
            childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 15),
            iconColor: AppColors.muted,
            collapsedIconColor: AppColors.muted,
            // `.session-day` — a lime-tinted tile carrying the weekday.
            leading: Container(
              width: 42,
              height: 42,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.lime.withValues(alpha: 0.11),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(
                day.shortLabel(t),
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: AppColors.lime),
              ),
            ),
            title: Text(session.name.resolve(t), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Text(
                '${t.planSessionExercises(session.exercises.length)} · '
                '${session.duration} ${t.unitMinutes}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 11, color: AppColors.muted),
              ),
            ),
            children: [
              for (final exercise in session.exercises)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(exercise.name.resolve(t), style: TextStyle(fontSize: 12, color: AppColors.textSoft)),
                            if (exercise.note case final note?) ...[
                              const SizedBox(height: 2),
                              Text(
                                note.resolve(t),
                                style: TextStyle(fontSize: 10, color: Colors.white.withValues(alpha: 0.32)),
                              ),
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        t.planSetsReps(exercise.sets, exercise.reps),
                        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.lime),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
