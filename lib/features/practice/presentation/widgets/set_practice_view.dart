import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../core/theme/tokens.dart';
import '../../../../core/theme/typography.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../l10n/app_localizations.dart';
import '../controller/practice_controller.dart';
import 'guide_sheet.dart';
import 'squat_figure.dart';

/// Set-mode surface. Two states share this widget: the active exercise (a
/// full-height illustration over a big rep count or countdown) and the rest
/// screen (a countdown with the next exercise queued). Its header and footer
/// are exposed as [header] and [footer] so the screen shell can lay them out.
class SetPracticeView extends ConsumerWidget {
  const SetPracticeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resting = ref.watch(practiceProvider.select((s) => s.resting));
    return resting ? const _RestBody() : const _ActiveBody();
  }

  /// The set-mode header: back, the exercise name (or "Rest") with a guide
  /// button, and the progress bar. During rest the guide button is hidden.
  static Widget header({
    required WidgetRef ref,
    required BuildContext context,
    required VoidCallback onBack,
    required VoidCallback onFeedback,
  }) {
    final t = AppLocalizations.of(context);
    final s = ref.watch(practiceProvider);
    final title = s.resting ? t.practiceRestTitle : s.exercise.name;
    final progress = s.exercise.progress;

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
      child: Column(
        children: [
          SizedBox(
            height: 44,
            child: Row(
              children: [
                CircleBackButton(onTap: onBack),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 17 * -0.02,
                          ),
                        ),
                      ),
                      if (!s.resting) ...[
                        const SizedBox(width: 8),
                        _GuideButton(
                          onTap: () => showGuideSheet(context, s.exercise, t),
                        ),
                      ],
                    ],
                  ),
                ),
                // The feedback / pain-stop entry sits in the header's trailing
                // slot; it is hidden during rest, when there is nothing to rate.
                SizedBox(
                  width: 44,
                  child: s.resting
                      ? null
                      : Align(
                          alignment: Alignment.centerRight,
                          child: _FeedbackButton(onTap: onFeedback),
                        ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          _ProgressTrack(value: progress),
        ],
      ),
    );
  }

  /// The set-mode footer: previous/next navigation around the primary action.
  /// During rest it collapses to the existing "skip rest" action.
  static Widget footer({
    required WidgetRef ref,
    required BuildContext context,
  }) {
    final t = AppLocalizations.of(context);
    final s = ref.watch(practiceProvider);
    final notifier = ref.read(practiceProvider.notifier);

    if (s.resting) {
      return Center(
        child: GestureDetector(
          onTap: notifier.skipRest,
          child: Container(
            height: 56,
            constraints: const BoxConstraints(minWidth: 168),
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppRadii.button),
            ),
            child: Text(
              t.practiceRestSkip,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
        ),
      );
    }

    final isReps = s.exercise.kind == ExerciseKind.reps;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _ExerciseNavButton(
          label: t.practiceExercisePrevious,
          icon: Icons.arrow_back_rounded,
          onTap: notifier.showPreviousExercise,
        ),
        _RoundButton(
          enabled: !s.painStopped,
          filled: isReps,
          onTap: isReps ? notifier.completeReps : notifier.toggleTimed,
          semanticLabel: isReps ? t.practiceCompleteSet : t.practicePause,
          child: Icon(
            isReps
                ? Icons.check_rounded
                : s.timedRunning
                ? Icons.pause_rounded
                : Icons.play_arrow_rounded,
            size: 32,
            color: AppColors.onLime,
          ),
        ),
        _ExerciseNavButton(
          label: t.practiceExerciseNext,
          icon: Icons.arrow_forward_rounded,
          onTap: notifier.showNextExercise,
        ),
      ],
    );
  }
}

class _ExerciseNavButton extends StatelessWidget {
  const _ExerciseNavButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(
      onPressed: onTap,
      tooltip: label,
      icon: Icon(icon),
      iconSize: 24,
      constraints: const BoxConstraints.tightFor(width: 52, height: 52),
      style: IconButton.styleFrom(
        foregroundColor: AppColors.text,
        side: const BorderSide(color: AppColors.line),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.button),
        ),
      ),
    );
  }
}

/// The active exercise: illustration filling the body, the target below it.
class _ActiveBody extends ConsumerWidget {
  const _ActiveBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(practiceProvider);
    final isReps = s.exercise.kind == ExerciseKind.reps;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 4, 20, 132),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 330,
                  maxHeight: 520,
                ),
                child: const SquatFigure(),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            isReps ? '×${s.exercise.reps}' : _clock(s.timedSeconds),
            style: const TextStyle(
              fontSize: 76,
              height: 1,
              fontWeight: FontWeight.w800,
              letterSpacing: 76 * -0.055,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

/// The rest screen: a large countdown and a card previewing the next exercise.
class _RestBody extends ConsumerWidget {
  const _RestBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);
    final s = ref.watch(practiceProvider);
    final next = s.nextExercise;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 4, 20, 132),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    t.practiceRestEyebrow.toUpperCase(),
                    style: AppText.eyebrow,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _clock(s.restSeconds),
                    style: const TextStyle(
                      fontSize: 92,
                      height: 1,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 92 * -0.055,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    t.practiceRestBody,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.muted,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
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
                  t.practiceRestNextLabel.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 11 * 0.12,
                    color: AppColors.muted,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            next.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            next.kind == ExerciseKind.reps
                                ? t.practiceRepsCount(next.reps)
                                : t.practiceSecondsCount(next.seconds),
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.muted,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.30),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.chevron_right_rounded,
                        size: 24,
                        color: AppColors.lime,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// `.progress` — a rounded track with an eased lime fill.
class _ProgressTrack extends StatelessWidget {
  const _ProgressTrack({required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      padding: EdgeInsets.zero,
      lineHeight: 6,
      percent: value.clamp(0.0, 1.0),
      animation: true,
      animateFromLastPercent: true,
      animationDuration: AppMotion.progress.inMilliseconds,
      curve: Curves.easeOut,
      backgroundColor: AppColors.surface,
      progressColor: AppColors.lime,
      barRadius: const Radius.circular(AppRadii.pill),
    );
  }
}

/// The circular "?" that opens the exercise guide.
class _GuideButton extends StatelessWidget {
  const _GuideButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 32,
          height: 32,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.surface,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.line),
          ),
          child: const Text(
            '?',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.textSoft,
            ),
          ),
        ),
      ),
    );
  }
}

/// The header's trailing feedback affordance — the entry into the feedback
/// sheet and, through it, the pain-stop action.
class _FeedbackButton extends StatelessWidget {
  const _FeedbackButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      child: GestureDetector(
        onTap: onTap,
        child: const SizedBox(
          width: 44,
          height: 44,
          child: Icon(
            Icons.chat_bubble_outline_rounded,
            size: 22,
            color: AppColors.textSoft,
          ),
        ),
      ),
    );
  }
}

/// The 68px circular footer action. Lime when filled (reps complete), white
/// when hollow (timed pause/resume). Dims to 30% when the flow is pain-stopped.
class _RoundButton extends StatelessWidget {
  const _RoundButton({
    required this.child,
    required this.onTap,
    required this.filled,
    required this.enabled,
    this.semanticLabel,
  });

  final Widget child;
  final VoidCallback onTap;
  final bool filled;
  final bool enabled;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      enabled: enabled,
      label: semanticLabel,
      child: Opacity(
        opacity: enabled ? 1 : 0.30,
        child: GestureDetector(
          onTap: enabled ? onTap : null,
          child: Container(
            width: 68,
            height: 68,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: filled ? AppColors.lime : Colors.white,
              shape: BoxShape.circle,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

String _clock(int seconds) {
  final s = seconds.clamp(0, 99 * 60 + 59);
  final m = (s ~/ 60).toString().padLeft(2, '0');
  return '$m:${(s % 60).toString().padLeft(2, '0')}';
}
