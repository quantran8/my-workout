import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../core/theme/tokens.dart';
import '../../../../core/theme/typography.dart';

/// Shared shell for the two side-by-side stat tiles: label, big number, a
/// decorative figure pinned bottom-right, and a caption bottom-left.
class HomeMetricTile extends StatelessWidget {
  const HomeMetricTile({
    required this.label,
    required this.value,
    required this.unit,
    required this.caption,
    required this.figure,
    super.key,
  });

  final String label;
  final String value;
  final String unit;
  final String caption;
  final Widget figure;

  @override
  Widget build(BuildContext context) {
    return Container(
      // The inner Stack needs a bounded height, so this stays fixed; the
      // caption below is clamped instead of allowed to wrap unbounded.
      height: 132,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadii.card),
        border: Border.all(color: AppColors.line),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.bodySm,
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Flexible(
                      child: Text(
                        value,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 31,
                          height: 1,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 31 * -0.05,
                          leadingDistribution: TextLeadingDistribution.even,
                          color: AppColors.text,
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    // Flexible too: a long localized unit ("buổi liên tiếp")
                    // otherwise pushes the row past the tile.
                    Flexible(
                      child: Text(
                        unit,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.muted,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  caption,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 11, color: AppColors.muted2),
                ),
              ],
            ),
          ),
          Positioned(right: 0, bottom: 22, child: figure),
        ],
      ),
    );
  }
}

/// Three ascending bars, lit up to [filled] — the streak's shape at a glance.
class StreakSpark extends StatelessWidget {
  const StreakSpark({required this.filled, super.key});

  final int filled;

  @override
  Widget build(BuildContext context) {
    const heights = [14.0, 23.0, 34.0];

    return SizedBox(
      height: 34,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          for (final (i, height) in heights.indexed) ...[
            if (i > 0) const SizedBox(width: 4),
            Container(
              width: 5,
              height: height,
              decoration: BoxDecoration(
                color: i < filled
                    ? AppColors.lime
                    : AppColors.lime.withValues(alpha: 0.22),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Aqua progress ring, drawn from 12 o'clock clockwise.
class AdherenceRing extends StatelessWidget {
  const AdherenceRing({required this.value, super.key});

  /// 0..1.
  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 46,
      height: 46,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: value.clamp(0, 1)),
        duration: AppMotion.progress,
        curve: AppMotion.enterCurve,
        builder: (context, value, _) =>
            CustomPaint(painter: _RingPainter(value)),
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  const _RingPainter(this.value);

  final double value;

  @override
  void paint(Canvas canvas, Size size) {
    const stroke = 6.0;
    final rect = Offset.zero & size;
    final center = rect.center;
    final radius = (size.shortestSide - stroke) / 2;

    final track = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..color = Colors.white.withValues(alpha: 0.08);

    canvas.drawCircle(center, radius, track);

    if (value <= 0) return;

    final arc = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round
      ..color = AppColors.cyan;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      2 * math.pi * value,
      false,
      arc,
    );
  }

  @override
  bool shouldRepaint(_RingPainter oldDelegate) => oldDelegate.value != value;
}
