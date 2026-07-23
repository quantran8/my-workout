import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/tokens.dart';
import '../../../../core/theme/typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../controller/practice_controller.dart';

/// Localized labels for a structured step. The controller stores steps by
/// symbolic key (`fast`, `round:1:3`, …) so this file owns the vocabulary.
class _StepLabels {
  const _StepLabels(this.title, this.round, this.footer);
  final String title;
  final String round;
  final String footer;
}

_StepLabels _labels(
  CardioStep step,
  int index,
  int total,
  AppLocalizations t,
) {
  final title = switch (step.title) {
    'warmup' => t.practiceCardioStepWarmup,
    'fast' => t.practiceCardioStepFast,
    'recover' => t.practiceCardioStepRecover,
    _ => t.practiceCardioStepCooldown,
  };

  // phase is "round:<n>:<total>" or "step:<n>:<total>".
  final parts = step.phase.split(':');
  final round = parts.first == 'round'
      ? t.practiceCardioRound(int.parse(parts[1]), int.parse(parts[2]))
      : t.practiceCardioStepOf(int.parse(parts[1]), int.parse(parts[2]));

  final footer = parts.first == 'round'
      ? '${t.practiceCardioStepOf(index + 1, total)} · '
            '${t.practiceCardioRound(int.parse(parts[1]), int.parse(parts[2]))}'
      : t.practiceCardioStepOf(index + 1, total);

  return _StepLabels(title, round, footer);
}

/// The structured interval runner: a round/step eyebrow, the current step title,
/// a big countdown, and "còn lại". The header shows a segmented step-progress
/// bar; the footer offers skip / pause / finish.
class CardioStructuredView extends ConsumerWidget {
  const CardioStructuredView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);
    final s = ref.watch(practiceProvider);
    final labels = _labels(
      s.structuredStep,
      s.structuredIndex,
      s.structuredSteps.length,
      t,
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 188),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              labels.round.toUpperCase(),
              style: AppText.eyebrow.copyWith(color: AppColors.violet),
            ),
            const SizedBox(height: 20),
            Text(
              labels.title.toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30,
                height: 1,
                fontWeight: FontWeight.w700,
                letterSpacing: 30 * -0.035,
              ),
            ),
            const SizedBox(height: 40),
            Text(
              _clock(s.structuredSeconds),
              style: const TextStyle(
                fontSize: 104,
                height: 1,
                fontWeight: FontWeight.w300,
                letterSpacing: 104 * -0.055,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              t.practiceCardioRemaining.toUpperCase(),
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                letterSpacing: 12 * 0.12,
                color: AppColors.muted,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// The structured header — back to the cardio overview, title + info, and a
  /// segmented step-progress bar weighted by each step's [CardioStep.flex].
  static Widget header({
    required WidgetRef ref,
    required BuildContext context,
    required VoidCallback onBack,
    required VoidCallback onInfo,
  }) {
    final t = AppLocalizations.of(context);
    final current = ref.watch(practiceProvider.select((s) => s.structuredIndex));
    final steps = ref.watch(practiceProvider.select((s) => s.structuredSteps));

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
      child: Column(
        children: [
          SizedBox(
            height: 44,
            child: Row(
              children: [
                _CircleBack(onTap: onBack),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          t.practiceCardioStructuredTitleShort,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 17 * -0.02,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      _InfoButton(onTap: onInfo),
                    ],
                  ),
                ),
                const SizedBox(width: 44),
              ],
            ),
          ),
          const SizedBox(height: 12),
          _StepBar(current: current, steps: steps),
        ],
      ),
    );
  }

  /// The structured footer — a raised bar with skip-step / pause / finish.
  static Widget footer({
    required WidgetRef ref,
    required BuildContext context,
    required VoidCallback onSkip,
    required VoidCallback onPause,
    required VoidCallback onFinish,
  }) {
    final t = AppLocalizations.of(context);
    final s = ref.watch(practiceProvider);
    final inset = MediaQuery.viewPaddingOf(context).bottom;
    final labels = _labels(
      s.structuredStep,
      s.structuredIndex,
      s.structuredSteps.length,
      t,
    );

    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, inset > 16 ? inset : 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: AppColors.line),
              boxShadow: const [
                BoxShadow(color: Color(0x8C000000), blurRadius: 50, offset: Offset(0, 18)),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _RoundControl(
                  size: 56,
                  background: Colors.white.withValues(alpha: 0.06),
                  onTap: onSkip,
                  semanticLabel: t.practiceCardioSkipStep,
                  child: const Icon(Icons.skip_next_rounded, size: 26, color: AppColors.muted),
                ),
                _RoundControl(
                  size: 72,
                  background: AppColors.lime,
                  onTap: onPause,
                  semanticLabel: s.structuredRunning ? t.practicePause : t.practiceResume,
                  child: Icon(
                    s.structuredRunning ? Icons.pause_rounded : Icons.play_arrow_rounded,
                    size: 36,
                    color: AppColors.onLime,
                  ),
                ),
                _RoundControl(
                  size: 56,
                  background: AppColors.pink.withValues(alpha: 0.10),
                  onTap: onFinish,
                  semanticLabel: t.practiceCardioFinish,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: AppColors.pink,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text(labels.footer, style: AppText.fine),
        ],
      ),
    );
  }
}

/// Segmented progress bar: one segment per step, weighted by flex; steps up to
/// the current index are lime, the current is white, the rest are dim.
class _StepBar extends StatelessWidget {
  const _StepBar({required this.current, required this.steps});

  final int current;
  final List<CardioStep> steps;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6,
      child: Row(
        children: [
          for (final (i, step) in steps.indexed) ...[
            if (i > 0) const SizedBox(width: 4),
            Expanded(
              flex: step.flex,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: i < current
                      ? AppColors.lime
                      : i == current
                      ? Colors.white
                      : AppColors.surface2,
                  borderRadius: BorderRadius.circular(AppRadii.pill),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _InfoButton extends StatelessWidget {
  const _InfoButton({required this.onTap});

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
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.textSoft),
          ),
        ),
      ),
    );
  }
}

class _CircleBack extends StatelessWidget {
  const _CircleBack({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: MaterialLocalizations.of(context).backButtonTooltip,
      child: GestureDetector(
        onTap: onTap,
        child: const SizedBox(
          width: 44,
          height: 44,
          child: Icon(Icons.chevron_left_rounded, size: 26, color: AppColors.text),
        ),
      ),
    );
  }
}

class _RoundControl extends StatelessWidget {
  const _RoundControl({
    required this.size,
    required this.background,
    required this.onTap,
    required this.child,
    this.semanticLabel,
  });

  final double size;
  final Color background;
  final VoidCallback onTap;
  final Widget child;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: semanticLabel,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: size,
          height: size,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: background, shape: BoxShape.circle),
          child: child,
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
