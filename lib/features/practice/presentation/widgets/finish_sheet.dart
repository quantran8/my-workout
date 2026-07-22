import 'package:flutter/material.dart';

import '../../../../core/theme/tokens.dart';
import '../../../../core/theme/typography.dart';
import '../../../../l10n/app_localizations.dart';

/// The end-of-session summary with a 1–10 effort rating. Resolves to true when
/// the user saves, false when they choose to keep training (or dismiss).
Future<bool> showFinishSheet(BuildContext context, AppLocalizations t) async {
  final saved = await showModalBottomSheet<bool>(
    context: context,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: 0.70),
    isScrollControlled: true,
    isDismissible: false,
    builder: (context) => const _FinishSheet(),
  );
  return saved ?? false;
}

class _FinishSheet extends StatefulWidget {
  const _FinishSheet();

  @override
  State<_FinishSheet> createState() => _FinishSheetState();
}

class _FinishSheetState extends State<_FinishSheet> {
  int? _effort;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final inset = MediaQuery.viewPaddingOf(context).bottom;

    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, inset + 24),
      decoration: const BoxDecoration(
        color: AppColors.surface2,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        border: Border(top: BorderSide(color: AppColors.line)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 56,
            height: 56,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppColors.lime,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.check_rounded, size: 28, color: AppColors.onLime),
          ),
          const SizedBox(height: 24),
          Text(t.practiceFinishTitle, style: AppText.titleSm),
          const SizedBox(height: 8),
          Text(
            t.practiceFinishMeta(24, '4.21', '5:48'),
            style: AppText.metricCaption,
          ),
          const SizedBox(height: 20),
          _effortCard(t),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: FilledButton(
              onPressed: () => Navigator.of(context).pop(true),
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.lime,
                foregroundColor: AppColors.onLime,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadii.button),
                ),
              ),
              child: Text(
                t.practiceSaveWorkout,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            height: 46,
            child: TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(
                t.practiceContinueWorkout,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.muted,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _effortCard(AppLocalizations t) => Container(
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
          t.practiceEffortQuestion,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (var i = 1; i <= 10; i++) _dot(i),
          ],
        ),
      ],
    ),
  );

  Widget _dot(int value) {
    final selected = _effort == value;
    return GestureDetector(
      onTap: () => setState(() => _effort = value),
      child: Container(
        width: 32,
        height: 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.black.withValues(alpha: 0.25),
          shape: BoxShape.circle,
        ),
        child: Text(
          '$value',
          style: TextStyle(
            fontSize: 11,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w400,
            color: selected ? Colors.black : AppColors.muted,
          ),
        ),
      ),
    );
  }
}
