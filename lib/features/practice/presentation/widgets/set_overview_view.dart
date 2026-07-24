import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/tokens.dart';
import '../../../../core/theme/typography.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/toast.dart';
import '../../../../l10n/app_localizations.dart';
import '../controller/practice_controller.dart';
import 'exercise_info_sheet.dart';

/// The set workout's overview: a title, a three-up stat row and the illustrated
/// exercise list, shown before the session starts. Header is a category label;
/// the footer pairs an "adjust" button with the start CTA.
class SetOverviewView extends ConsumerWidget {
  const SetOverviewView({super.key});

  /// Row accents cycle so adjacent exercises stay visually distinct.
  static const _accents = [AppColors.lime, AppColors.cyan, AppColors.violet];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);
    final state = ref.watch(practiceProvider);

    // Live session when one is loaded; the localized demo list otherwise, so
    // this screen still renders standalone.
    final exercises = state.isLive
        ? [
            for (final (i, exercise) in state.exercises.indexed)
              ExerciseOverviewInfo(
                name: exercise.name,
                target: _targetLine(exercise, t),
                description:
                    exercise.detail?.instructions.join('\n\n') ??
                    t.practiceOverviewNoGuide,
                accent: _accents[i % _accents.length],
              ),
          ]
        : _demoExercises(t);

    // Reasons the session was reduced/held at the readiness gate. Backend copy
    // (Vietnamese), shown verbatim — the client cannot re-derive why.
    final reasons = state.readiness?.reasons ?? const [];

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 132),
      children: [
        Text(t.practiceOverviewTitle, style: AppText.title.copyWith(fontSize: 34, height: 1.06)),
        if (reasons.isNotEmpty) ...[
          const SizedBox(height: 16),
          _ReadinessBanner(title: t.practiceHoldBanner, reasons: reasons),
        ],
        const SizedBox(height: 28),
        _statRow(t, ref),
        const SizedBox(height: 40),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              t.practiceOverviewListTitle,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700, letterSpacing: 24 * -0.035),
            ),
            const SizedBox(width: 6),
            Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: Text('(${exercises.length})', style: const TextStyle(fontSize: 17, color: AppColors.muted)),
            ),
          ],
        ),
        const SizedBox(height: 8),
        for (final (i, ex) in exercises.indexed)
          _ExerciseRow(exercise: ex, divider: i > 0, onPressed: () => showExerciseInfoSheet(context, ex)),
      ],
    );
  }

  /// The set-overview header — a category label with an (inert) overflow slot.
  static Widget header({required WidgetRef ref, required BuildContext context, required VoidCallback onBack}) {
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
                t.practiceOverviewCategory.toUpperCase(),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, letterSpacing: 15 * -0.015),
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

  /// The set-overview footer — an "adjust" button and the start CTA.
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
              label: t.practiceOverviewStart,
              onPressed: ref.read(practiceProvider.notifier).startSetWorkout,
            ),
          ),
        ),
      ],
    );
  }

  /// "3×12" for a counted movement, "3×30s" for a hold — the prescription as
  /// the user will actually perform it, after readiness modifications.
  static String _targetLine(Exercise exercise, AppLocalizations t) {
    final sets = exercise.targetSets;
    if (exercise.kind == ExerciseKind.timed) {
      return '$sets × ${exercise.seconds}${t.unitSecondsShort}';
    }
    return '$sets × ${exercise.reps}';
  }

  /// The prototype's six hardcoded rows, kept for the standalone demo.
  static List<ExerciseOverviewInfo> _demoExercises(AppLocalizations t) => [
    ExerciseOverviewInfo(
      name: t.practiceOverviewEx1Name,
      target: t.practiceOverviewEx1Target,
      description: t.practiceOverviewEx1Info,
      accent: AppColors.lime,
    ),
    ExerciseOverviewInfo(
      name: t.practiceOverviewEx2Name,
      target: t.practiceOverviewEx2Target,
      description: t.practiceOverviewEx2Info,
      accent: AppColors.cyan,
    ),
    ExerciseOverviewInfo(
      name: t.practiceOverviewEx3Name,
      target: t.practiceOverviewEx3Target,
      description: t.practiceOverviewEx3Info,
      accent: AppColors.violet,
    ),
    ExerciseOverviewInfo(
      name: t.practiceOverviewEx4Name,
      target: t.practiceOverviewEx4Target,
      description: t.practiceOverviewEx4Info,
      accent: AppColors.lime,
    ),
    ExerciseOverviewInfo(
      name: t.practiceOverviewEx5Name,
      target: t.practiceOverviewEx5Target,
      description: t.practiceOverviewEx5Info,
      accent: AppColors.cyan,
    ),
    ExerciseOverviewInfo(
      name: t.practiceOverviewEx6Name,
      target: t.practiceOverviewEx6Target,
      description: t.practiceOverviewEx6Info,
      accent: AppColors.violet,
    ),
  ];

  Widget _statRow(AppLocalizations t, WidgetRef ref) {
    final state = ref.watch(practiceProvider);
    if (!state.isLive) return _demoStatRow(t);

    // Total prescribed work: sets across every exercise, and the summed rest
    // plus hold time as a rough duration.
    final totalSets = state.exercises.fold<int>(
      0,
      (sum, exercise) => sum + exercise.targetSets,
    );
    final minutes = state.exercises.fold<int>(
      0,
      (sum, exercise) =>
          sum +
          exercise.targetSets *
              (exercise.restSec +
                  (exercise.kind == ExerciseKind.timed
                      ? exercise.seconds
                      : 45)),
    );

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: _Stat(
              value: '${state.exercises.length}',
              caption: t.practiceOverviewStatExercisesLabel,
            ),
          ),
          const _StatDivider(),
          Expanded(
            child: _Stat(
              value: '$totalSets',
              caption: t.practiceOverviewStatSetsLabel,
            ),
          ),
          const _StatDivider(),
          Expanded(
            child: _Stat(
              value: '~${(minutes / 60).round()}${t.unitMinutesShort}',
              caption: t.practiceOverviewStatDurationLabel,
            ),
          ),
        ],
      ),
    );
  }

  Widget _demoStatRow(AppLocalizations t) => IntrinsicHeight(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _Stat(value: t.practiceOverviewStatLevel, caption: t.practiceOverviewStatLevelLabel),
        ),
        const _StatDivider(),
        Expanded(
          child: _Stat(value: t.practiceOverviewStatDuration, caption: t.practiceOverviewStatDurationLabel),
        ),
        const _StatDivider(),
        Expanded(
          child: _Stat(value: t.practiceOverviewStatFocus, caption: t.practiceOverviewStatFocusLabel),
        ),
      ],
    ),
  );
}

/// A coral notice listing why the session was adjusted at the readiness gate.
/// A reduction is a caution, not more body copy, so it reads like the plan
/// screen's health notice.
class _ReadinessBanner extends StatelessWidget {
  const _ReadinessBanner({required this.title, required this.reasons});

  final String title;
  final List<String> reasons;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.pink.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(AppRadii.field),
        border: Border.all(color: AppColors.pink.withValues(alpha: 0.16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.shield_moon_outlined, size: 18, color: AppColors.pink),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFFFD5DE),
                  ),
                ),
              ),
            ],
          ),
          for (final reason in reasons) ...[
            const SizedBox(height: 6),
            Text(
              '• $reason',
              style: const TextStyle(fontSize: 13, height: 1.4, color: Color(0xFFFFD5DE)),
            ),
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
          Text(value, style: const TextStyle(fontSize: 17, height: 1.3, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          Text(caption, style: const TextStyle(fontSize: 12, color: AppColors.muted)),
        ],
      ),
    );
  }
}

class _StatDivider extends StatelessWidget {
  const _StatDivider();

  @override
  Widget build(BuildContext context) => const VerticalDivider(width: 1, thickness: 1, color: AppColors.line);
}

class _ExerciseRow extends StatelessWidget {
  const _ExerciseRow({required this.exercise, required this.divider, required this.onPressed});

  final ExerciseOverviewInfo exercise;
  final bool divider;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: exercise.name,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(AppRadii.card),
          child: Container(
            decoration: divider
                ? const BoxDecoration(
                    border: Border(top: BorderSide(color: AppColors.line)),
                  )
                : null,
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                Container(
                  width: 86,
                  height: 72,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(18)),
                  child: Icon(Icons.accessibility_new_rounded, size: 34, color: exercise.accent),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        exercise.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      Text(exercise.target, style: const TextStyle(fontSize: 15, color: AppColors.muted)),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.chevron_right_rounded, size: 22, color: AppColors.muted2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// The narrow "adjust" secondary button in the footer — an icon over a label.
// class _AdjustButton extends StatelessWidget {
//   const _AdjustButton({required this.label, required this.onTap});

//   final String label;
//   final VoidCallback onTap;

//   @override
//   Widget build(BuildContext context) {
//     return Semantics(
//       button: true,
//       label: label,
//       child: GestureDetector(
//         onTap: onTap,
//         child: Container(
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//             color: AppColors.surface,
//             borderRadius: BorderRadius.circular(AppRadii.button),
//             border: Border.all(color: AppColors.line),
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Icon(
//                 Icons.tune_rounded,
//                 size: 20,
//                 color: AppColors.textSoft,
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 label,
//                 style: const TextStyle(
//                   fontSize: 9,
//                   fontWeight: FontWeight.w700,
//                   color: AppColors.textSoft,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
