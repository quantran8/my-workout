import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/tokens.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/screen_enter.dart';
import '../../../../l10n/app_localizations.dart';
import '../controller/practice_controller.dart';
import 'cardio_info_sheet.dart';

/// Cardio-mode surface: a large, quiet stack of live metrics. The header (title
/// + info + GPS dot + goal progress) and the raised control panel footer are
/// exposed as statics so the screen shell can place them, mirroring
/// [SetPracticeView].
class CardioPracticeView extends ConsumerWidget {
  const CardioPracticeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);

    // Big centred metrics, cascading in like the prototype's `rise`. Scrolls
    // and centres via minHeight so short viewports don't overflow behind the
    // ~310px control panel.
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 310),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight - 318),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _rise(0, _distance(t)),
              const SizedBox(height: 56),
              _rise(1, _row2(t)),
              const SizedBox(height: 56),
              _rise(2, _row3(t)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _rise(int index, Widget child) => ScreenEnter(
    delay: AppMotion.cardStagger * index,
    duration: AppMotion.cardRise,
    axis: Axis.vertical,
    offset: 14,
    child: child,
  );

  /// The cardio header: back, centred title + info button, a GPS dot in the
  /// trailing slot, and the goal-progress bar below.
  static Widget header({
    required WidgetRef ref,
    required BuildContext context,
    required VoidCallback onBack,
  }) {
    final t = AppLocalizations.of(context);
    final s = ref.watch(practiceProvider);
    final goal = (s.cardioTargetKm == 0)
        ? 0.0
        : (s.cardioDistanceKm / s.cardioTargetKm).clamp(0.0, 1.0);

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
                    children: [
                      Flexible(
                        child: Text(
                          t.practiceCardioTitleShort,
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
                      _InfoButton(
                        onTap: () => showCardioInfoSheet(context, s, t),
                      ),
                    ],
                  ),
                ),
                // GPS status dot.
                SizedBox(
                  width: 44,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: AppColors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          _GoalProgress(value: goal),
        ],
      ),
    );
  }

  /// The cardio footer: a raised rounded panel — status row (run glyph, big
  /// elapsed clock, goal ring) over the lap / pause / finish controls.
  static Widget footer({
    required WidgetRef ref,
    required BuildContext context,
    required VoidCallback onLap,
    required VoidCallback onPause,
    required VoidCallback onFinish,
  }) {
    final t = AppLocalizations.of(context);
    final s = ref.watch(practiceProvider);
    final inset = MediaQuery.viewPaddingOf(context).bottom;
    final goal = (s.cardioTargetKm == 0)
        ? 0.0
        : (s.cardioDistanceKm / s.cardioTargetKm).clamp(0.0, 1.0);

    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, inset > 16 ? inset : 16),
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(34),
          border: Border.all(color: AppColors.line),
          boxShadow: const [
            BoxShadow(
              color: Color(0x59000000),
              blurRadius: 40,
              offset: Offset(0, -10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
            const SizedBox(height: 16),
            Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.lime.withValues(alpha: 0.10),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.directions_run_rounded,
                    size: 28,
                    color: AppColors.lime,
                  ),
                ),
                Expanded(
                  child: Text(
                    _clock(s.elapsedSeconds),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 54,
                      height: 1,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 54 * -0.055,
                      color: s.cardioRunning ? AppColors.lime : AppColors.text,
                    ),
                  ),
                ),
                _GoalRing(value: goal),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _ControlButton(
                  size: 72,
                  background: Colors.white.withValues(alpha: 0.07),
                  onTap: onLap,
                  semanticLabel: t.practiceCardioLap,
                  child: const Icon(Icons.flag_outlined, size: 30, color: AppColors.text),
                ),
                _ControlButton(
                  size: 104,
                  background: Colors.white.withValues(alpha: 0.08),
                  onTap: onPause,
                  semanticLabel: s.cardioRunning ? t.practicePause : t.practiceResume,
                  child: Icon(
                    s.cardioRunning ? Icons.pause_rounded : Icons.play_arrow_rounded,
                    size: 48,
                    color: AppColors.text,
                  ),
                ),
                _ControlButton(
                  size: 72,
                  background: AppColors.pink.withValues(alpha: 0.10),
                  onTap: onFinish,
                  semanticLabel: t.practiceCardioFinish,
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: AppColors.pink,
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _distance(AppLocalizations t) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            '4.21',
            style: TextStyle(
              fontSize: 92,
              height: 1,
              fontWeight: FontWeight.w300,
              letterSpacing: 92 * -0.055,
            ),
          ),
          const SizedBox(width: 8),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              t.practiceCardioKm.toUpperCase(),
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                letterSpacing: 28 * -0.04,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 12),
      _caption(t.practiceCardioDistanceLabel),
    ],
  );

  Widget _row2(AppLocalizations t) => Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Expanded(
        flex: 135,
        child: _bigMetric('5:48', t.practiceCardioAvgPaceLabel),
      ),
      const SizedBox(width: 32),
      Expanded(
        flex: 100,
        child: _bigMetric('148', t.practiceCardioHrLabel, size: 48),
      ),
    ],
  );

  Widget _row3(AppLocalizations t) => Row(
    children: [
      Expanded(child: _bigMetric('286', t.practiceCardioActiveKcal, size: 48)),
      const SizedBox(width: 32),
      Expanded(child: _bigMetric('302', t.practiceCardioTotalKcal, size: 48)),
    ],
  );

  Widget _bigMetric(String value, String label, {double size = 62}) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        value,
        style: TextStyle(
          fontSize: size,
          height: 1,
          fontWeight: FontWeight.w300,
          letterSpacing: size * -0.055,
        ),
      ),
      const SizedBox(height: 12),
      _caption(label),
    ],
  );

  Widget _caption(String text) => Text(
    text.toUpperCase(),
    style: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      letterSpacing: 12 * 0.09,
      color: AppColors.muted,
    ),
  );
}

/// The circular "?" that opens the cardio info sheet.
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

/// The header goal-progress hairline.
class _GoalProgress extends StatelessWidget {
  const _GoalProgress({required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppRadii.pill),
              ),
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) => AnimatedContainer(
              duration: AppMotion.progress,
              curve: Curves.easeOut,
              width: constraints.maxWidth * value.clamp(0, 1),
              height: 6,
              decoration: BoxDecoration(
                color: AppColors.lime,
                borderRadius: BorderRadius.circular(AppRadii.pill),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// The 56px conic goal ring in the footer status row, with the percentage
/// centred over a punched-out surface disc.
class _GoalRing extends StatelessWidget {
  const _GoalRing({required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56,
      height: 56,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: const Size(56, 56),
            painter: _RingPainter(value: value.clamp(0, 1)),
          ),
          DecoratedBox(
            decoration: const BoxDecoration(
              color: AppColors.surface,
              shape: BoxShape.circle,
            ),
            child: SizedBox(
              width: 42,
              height: 42,
              child: Center(
                child: Text(
                  '${(value.clamp(0, 1) * 100).round()}%',
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textSoft,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  const _RingPainter({required this.value});

  final double value;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    // Track.
    canvas.drawArc(
      rect,
      0,
      6.283185307179586,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 7
        ..color = AppColors.lime.withValues(alpha: 0.15),
    );
    // Filled sweep, from 12 o'clock.
    canvas.drawArc(
      rect.deflate(0),
      -1.5707963267948966,
      6.283185307179586 * value,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 7
        ..strokeCap = StrokeCap.round
        ..color = AppColors.lime,
    );
  }

  @override
  bool shouldRepaint(_RingPainter oldDelegate) => oldDelegate.value != value;
}

/// A round control in the footer's bottom row.
class _ControlButton extends StatelessWidget {
  const _ControlButton({
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
  final m = (seconds ~/ 60).toString().padLeft(2, '0');
  final s = (seconds % 60).toString().padLeft(2, '0');
  return '$m:$s';
}
