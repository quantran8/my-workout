import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/tokens.dart';
import '../../../../core/theme/typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../controller/practice_controller.dart';

/// The cardio "?" sheet: the run's key facts plus the safety note. Read-only,
/// with content that follows the selected [CardioCase] — the continuous run's
/// goal and data sources, or the interval run's step breakdown.
Future<void> showCardioInfoSheet(
  BuildContext context,
  PracticeState state,
  AppLocalizations t,
) => showModalBottomSheet<void>(
  context: context,
  backgroundColor: Colors.transparent,
  barrierColor: Colors.black.withValues(alpha: 0.65),
  isScrollControlled: true,
  builder: (context) => _CardioInfoSheet(
    cardioCase: state.cardioCase,
    target: state.cardioTargetKm,
  ),
);

class _CardioInfoSheet extends StatelessWidget {
  const _CardioInfoSheet({required this.cardioCase, required this.target});

  final CardioCase cardioCase;
  final int target;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final inset = MediaQuery.viewPaddingOf(context).bottom;
    final numbers = NumberFormat.decimalPattern(
      Localizations.localeOf(context).toLanguageTag(),
    );
    final structured = cardioCase == CardioCase.structured;

    final rows = structured
        ? <(String, String)>[
            (t.practiceCardioStepWarmup, t.practiceCardioStepWarmupMeta),
            (t.practiceCardioStepFast, t.practiceCardioStepFastMeta),
            (t.practiceCardioStepRecover, t.practiceCardioStepRecoverMeta),
            (t.practiceCardioStepCooldown, t.practiceCardioStepCooldownMeta),
          ]
        : <(String, String)>[
            (t.practiceCardioInfoGoal, '${numbers.format(target)} ${t.practiceCardioKm.toLowerCase()}'),
            (t.practiceCardioSourceDistance, t.practiceCardioSourceDistanceValue),
            (t.practiceCardioSourceHr, t.practiceCardioSourceHrValue),
          ];

    return Container(
      padding: EdgeInsets.fromLTRB(20, 16, 20, inset + 24),
      decoration: const BoxDecoration(
        color: AppColors.surface2,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        border: Border(top: BorderSide(color: AppColors.line)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 6,
              decoration: BoxDecoration(
                color: AppColors.muted2,
                borderRadius: BorderRadius.circular(AppRadii.pill),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            (structured
                    ? t.practiceCardioStructuredEyebrow
                    : t.practiceCardioInfoEyebrow)
                .toUpperCase(),
            style: AppText.eyebrow,
          ),
          const SizedBox(height: 8),
          Text(
            structured
                ? t.practiceCardioStructuredTitleShort
                : t.practiceCardioTitleShort,
            style: AppText.titleSm,
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppRadii.card),
              border: Border.all(color: AppColors.line),
            ),
            child: Column(
              children: [
                for (final (i, row) in rows.indexed)
                  _row(row.$1, row.$2, divider: i < rows.length - 1),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(t.practiceCardioInfoNote, style: AppText.hint),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: FilledButton(
              onPressed: () => Navigator.of(context).pop(),
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.lime,
                foregroundColor: AppColors.onLime,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadii.button),
                ),
              ),
              child: Text(
                t.practiceGuideGotIt,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _row(String label, String value, {required bool divider}) => Container(
    padding: const EdgeInsets.all(16),
    decoration: divider
        ? const BoxDecoration(
            border: Border(bottom: BorderSide(color: AppColors.line)),
          )
        : null,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 13, color: AppColors.muted)),
        Text(value, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
      ],
    ),
  );
}
