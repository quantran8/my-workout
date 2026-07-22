import 'package:flutter/material.dart';

import '../../../../core/theme/tokens.dart';
import '../../../../core/theme/typography.dart';
import '../../../../l10n/app_localizations.dart';

class ExerciseOverviewInfo {
  const ExerciseOverviewInfo({
    required this.name,
    required this.target,
    required this.description,
    required this.accent,
  });

  final String name;
  final String target;
  final String description;
  final Color accent;
}

Future<void> showExerciseInfoSheet(
  BuildContext context,
  ExerciseOverviewInfo exercise,
) => showModalBottomSheet<void>(
  context: context,
  backgroundColor: Colors.transparent,
  barrierColor: Colors.black.withValues(alpha: 0.65),
  isScrollControlled: true,
  builder: (context) => _ExerciseInfoSheet(exercise: exercise),
);

class _ExerciseInfoSheet extends StatelessWidget {
  const _ExerciseInfoSheet({required this.exercise});

  final ExerciseOverviewInfo exercise;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final bottomInset = MediaQuery.viewPaddingOf(context).bottom;

    return Container(
      padding: EdgeInsets.fromLTRB(20, 16, 20, bottomInset + 24),
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
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppRadii.card),
              border: Border.all(color: AppColors.line),
            ),
            child: Row(
              children: [
                Icon(Icons.flag_rounded, size: 20, color: exercise.accent),
                const SizedBox(width: 12),
                Text(
                  exercise.target,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            exercise.description,
            style: const TextStyle(
              fontSize: 15,
              height: 1.55,
              color: AppColors.textSoft,
            ),
          ),
          const SizedBox(height: 20),
          Text(t.practiceGuideNoteBody, style: AppText.hint),
          const SizedBox(height: 24),
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
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
