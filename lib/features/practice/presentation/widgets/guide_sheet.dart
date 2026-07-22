import 'package:flutter/material.dart';

import '../../../../core/theme/tokens.dart';
import '../../../../core/theme/typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../controller/practice_controller.dart';

/// The exercise how-to sheet, opened by the "?" in the set-mode header. Copy is
/// keyed off the exercise name so reps (Squat) and timed (Plank) each get their
/// own instructions, matching the prototype.
Future<void> showGuideSheet(
  BuildContext context,
  Exercise exercise,
  AppLocalizations t,
) => showModalBottomSheet<void>(
  context: context,
  backgroundColor: Colors.transparent,
  barrierColor: Colors.black.withValues(alpha: 0.65),
  isScrollControlled: true,
  builder: (context) => _GuideSheet(exercise: exercise),
);

class _GuideSheet extends StatelessWidget {
  const _GuideSheet({required this.exercise});

  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final inset = MediaQuery.viewPaddingOf(context).bottom;
    final timed = exercise.kind == ExerciseKind.timed;

    final steps = timed
        ? [t.practiceGuidePlank1, t.practiceGuidePlank2, t.practiceGuidePlank3]
        : [t.practiceGuideSquat1, t.practiceGuideSquat2, t.practiceGuideSquat3];

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
          Text(t.practiceGuideEyebrow.toUpperCase(), style: AppText.eyebrow),
          const SizedBox(height: 8),
          Text(exercise.name, style: AppText.titleSm),
          const SizedBox(height: 20),
          for (final (i, step) in steps.indexed) ...[
            if (i > 0) const SizedBox(height: 12),
            Text(
              step,
              style: const TextStyle(
                fontSize: 14,
                height: 1.5,
                color: AppColors.textSoft,
              ),
            ),
          ],
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppRadii.card),
              border: Border.all(color: AppColors.line),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  t.practiceGuideNoteTitle,
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                Text(t.practiceGuideNoteBody, style: AppText.hint),
              ],
            ),
          ),
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
}
