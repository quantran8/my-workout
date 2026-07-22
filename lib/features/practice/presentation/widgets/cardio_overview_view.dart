import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/tokens.dart';
import '../../../../core/theme/typography.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/toast.dart';
import '../../../../l10n/app_localizations.dart';
import '../controller/practice_controller.dart';

/// The cardio picker, in the set-overview visual language: a Liên tục / Theo
/// bước tab switch over a big title, a three-up stat row and an illustrated
/// list of the case's key points. Header is a category label; the footer pairs
/// an "adjust" button with the start CTA.
class CardioOverviewView extends ConsumerWidget {
  const CardioOverviewView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);
    final selected = ref.watch(practiceProvider.select((s) => s.cardioCase));
    final notifier = ref.read(practiceProvider.notifier);
    final continuous = selected == CardioCase.continuous;

    final title = continuous
        ? t.practiceCardioContinuousTitle
        : t.practiceCardioStructuredTitle;

    final stats = continuous
        ? [
            (t.practiceCardioContinuousChip1, t.practiceCardioStatDistanceLabel),
            (t.practiceCardioContinuousChip2, t.practiceCardioStatPlaceLabel),
            (t.practiceCardioContinuousChip3, t.practiceCardioStatPaceLabel),
          ]
        : [
            (t.practiceCardioStructuredChip1, t.practiceCardioStatDurationLabel),
            (t.practiceCardioStructuredChip2, t.practiceCardioStatStepsLabel),
            (t.practiceCardioStructuredChip3, t.practiceCardioStatRoundsLabel),
          ];

    final items = continuous
        ? [
            (t.practiceCardioContinuousRow1Label, t.practiceCardioContinuousRow1Value, AppColors.lime),
            (t.practiceCardioContinuousRow2Label, t.practiceCardioContinuousRow2Value, AppColors.cyan),
            (t.practiceCardioContinuousRow3Label, t.practiceCardioContinuousRow3Value, AppColors.violet),
          ]
        : [
            (t.practiceCardioStepWarmup, t.practiceCardioStepWarmupMeta, AppColors.lime),
            (t.practiceCardioStepFast, t.practiceCardioStepFastMeta, AppColors.cyan),
            (t.practiceCardioStepRecover, t.practiceCardioStepRecoverMeta, AppColors.violet),
            (t.practiceCardioStepCooldown, t.practiceCardioStepCooldownMeta, AppColors.lime),
          ];

    final listTitle = continuous
        ? t.practiceCardioContinuousListTitle
        : t.practiceCardioStructuredListTitle;

    final listIcon = continuous
        ? Icons.flag_rounded
        : Icons.directions_run_rounded;

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 4, 20, 132),
      children: [
        _CaseTabs(
          selected: selected,
          onSelect: notifier.selectCardioCase,
          continuousLabel: t.practiceCardioCaseContinuous,
          structuredLabel: t.practiceCardioCaseStructured,
        ),
        const SizedBox(height: 28),
        Text(title, style: AppText.title.copyWith(fontSize: 34, height: 1.06)),
        const SizedBox(height: 28),
        _StatRow(stats: stats),
        const SizedBox(height: 40),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              listTitle,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                letterSpacing: 24 * -0.035,
              ),
            ),
            const SizedBox(width: 6),
            Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: Text(
                '(${items.length})',
                style: const TextStyle(fontSize: 17, color: AppColors.muted),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        for (final (i, item) in items.indexed)
          _ListRow(
            title: item.$1,
            meta: item.$2,
            accent: item.$3,
            icon: listIcon,
            divider: i > 0,
          ),
      ],
    );
  }

  /// The cardio-overview header — a category label with an (inert) overflow.
  static Widget header({
    required WidgetRef ref,
    required BuildContext context,
    required VoidCallback onBack,
  }) {
    final t = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      child: SizedBox(
        height: 44,
        child: Row(
          children: [
            CircleBackButton(onTap: onBack),
            Expanded(
              child: Text(
                t.practiceCardioOverviewCategory.toUpperCase(),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 15 * -0.015,
                ),
              ),
            ),
            SizedBox(
              width: 44,
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => showAppToast(ref, t.practiceOptionsToast),
                  child: const SizedBox(
                    width: 44,
                    height: 44,
                    child: Icon(Icons.more_horiz_rounded, size: 22, color: AppColors.muted),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// The cardio-overview footer — an "adjust" button and the start CTA.
  static Widget footer({required WidgetRef ref, required BuildContext context}) {
    final t = AppLocalizations.of(context);

    return Row(
      children: [
        // SizedBox(
        //   width: 76,
        //   height: 58,
        //   child: _AdjustButton(
        //     label: t.practiceOverviewAdjust,
        //     onTap: () => showAppToast(ref, t.practiceOverviewAdjustToast),
        //   ),
        // ),
        // const SizedBox(width: 12),
        Expanded(
          child: SizedBox(
            height: 58,
            child: PrimaryButton(
              label: t.practiceCardioOverviewStart,
              onPressed: ref.read(practiceProvider.notifier).startCardioCase,
            ),
          ),
        ),
      ],
    );
  }
}

class _StatRow extends StatelessWidget {
  const _StatRow({required this.stats});

  final List<(String, String)> stats;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final (i, stat) in stats.indexed) ...[
            if (i > 0)
              const VerticalDivider(width: 1, thickness: 1, color: AppColors.line),
            Expanded(child: _Stat(value: stat.$1, caption: stat.$2)),
          ],
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.value, required this.caption});

  final String value;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: const TextStyle(fontSize: 17, height: 1.3, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          Text(caption, style: const TextStyle(fontSize: 12, color: AppColors.muted)),
        ],
      ),
    );
  }
}

class _ListRow extends StatelessWidget {
  const _ListRow({
    required this.title,
    required this.meta,
    required this.accent,
    required this.icon,
    required this.divider,
  });

  final String title;
  final String meta;
  final Color accent;
  final IconData icon;
  final bool divider;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: divider
          ? const BoxDecoration(border: Border(top: BorderSide(color: AppColors.line)))
          : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Container(
              width: 86,
              height: 72,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(icon, size: 32, color: accent),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    meta,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 15, color: AppColors.muted),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// The narrow "adjust" secondary button in the footer — an icon over a label.
class _AdjustButton extends StatelessWidget {
  const _AdjustButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: label,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadii.button),
            border: Border.all(color: AppColors.line),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.tune_rounded, size: 20, color: AppColors.textSoft),
              const SizedBox(height: 4),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textSoft,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CaseTabs extends StatelessWidget {
  const _CaseTabs({
    required this.selected,
    required this.onSelect,
    required this.continuousLabel,
    required this.structuredLabel,
  });

  final CardioCase selected;
  final ValueChanged<CardioCase> onSelect;
  final String continuousLabel;
  final String structuredLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(child: _tab(continuousLabel, CardioCase.continuous)),
          const SizedBox(width: 4),
          Expanded(child: _tab(structuredLabel, CardioCase.structured)),
        ],
      ),
    );
  }

  Widget _tab(String label, CardioCase value) {
    final active = selected == value;
    return GestureDetector(
      onTap: () => onSelect(value),
      child: AnimatedContainer(
        duration: AppMotion.control,
        height: 42,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: active ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: active ? Colors.black : AppColors.muted,
          ),
        ),
      ),
    );
  }
}
