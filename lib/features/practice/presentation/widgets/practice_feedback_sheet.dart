import 'package:flutter/material.dart';

import '../../../../core/theme/tokens.dart';
import '../../../../core/theme/typography.dart';
import '../../../../l10n/app_localizations.dart';

/// Quick post-set feedback, plus the pain-stop escape hatch. The four ratings
/// close with themselves; [PracticeFeedback.pain] is handled specially by the
/// caller (it halts the session).
enum PracticeFeedback {
  ok,
  easy,
  hard,
  uncomfortable,
  pain;

  String label(AppLocalizations t) => switch (this) {
    PracticeFeedback.ok => t.practiceFeedbackOk,
    PracticeFeedback.easy => t.practiceFeedbackEasy,
    PracticeFeedback.hard => t.practiceFeedbackHard,
    PracticeFeedback.uncomfortable => t.practiceFeedbackUncomfortable,
    PracticeFeedback.pain => t.practicePainStop,
  };
}

/// Shows the feedback sheet and resolves to the chosen option, or null if
/// dismissed.
Future<PracticeFeedback?> showPracticeFeedbackSheet(
  BuildContext context,
  AppLocalizations t,
) => showModalBottomSheet<PracticeFeedback>(
  context: context,
  backgroundColor: Colors.transparent,
  barrierColor: Colors.black.withValues(alpha: 0.65),
  isScrollControlled: true,
  builder: (context) => const _FeedbackSheet(),
);

class _FeedbackSheet extends StatelessWidget {
  const _FeedbackSheet();

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final inset = MediaQuery.viewPaddingOf(context).bottom;

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
            t.practiceFeedbackEyebrow.toUpperCase(),
            style: AppText.eyebrow.copyWith(color: AppColors.violet),
          ),
          const SizedBox(height: 8),
          Text(t.practiceFeedbackTitle, style: AppText.titleSm),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: _rating(context, PracticeFeedback.ok, t)),
              const SizedBox(width: 12),
              Expanded(child: _rating(context, PracticeFeedback.easy, t)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _rating(context, PracticeFeedback.hard, t)),
              const SizedBox(width: 12),
              Expanded(child: _rating(context, PracticeFeedback.uncomfortable, t)),
            ],
          ),
          const SizedBox(height: 12),
          _painButton(context, t),
          const SizedBox(height: 16),
          Text(
            t.practicePainNote,
            textAlign: TextAlign.center,
            style: AppText.fine,
          ),
        ],
      ),
    );
  }

  Widget _rating(BuildContext context, PracticeFeedback value, AppLocalizations t) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(value),
      child: Container(
        constraints: const BoxConstraints(minHeight: 54),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppRadii.button),
          border: Border.all(color: AppColors.line),
        ),
        child: Text(
          value.label(t),
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Widget _painButton(BuildContext context, AppLocalizations t) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(PracticeFeedback.pain),
      child: Container(
        constraints: const BoxConstraints(minHeight: 56),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.pink.withValues(alpha: 0.10),
          borderRadius: BorderRadius.circular(AppRadii.button),
          border: Border.all(color: AppColors.pink.withValues(alpha: 0.35)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.warning_amber_rounded, size: 20, color: AppColors.pink),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                t.practicePainStop,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.pink,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
