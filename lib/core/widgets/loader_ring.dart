import 'package:flutter/material.dart';

import '../theme/tokens.dart';

/// Spinning conic ring — lime → cyan → violet, fading to transparent over the
/// last quarter.
///
/// CSS `conic-gradient` maps to [SweepGradient], but its zero angle sits at 3
/// o'clock rather than 12, so the gradient is rotated by −90°.
class LoaderRing extends StatefulWidget {
  const LoaderRing({
    this.size = 102,
    this.period = AppMotion.ringSpin,
    this.thickness = 7,
    super.key,
  });

  final double size;
  final Duration period;

  /// Ring band width.
  final double thickness;

  @override
  State<LoaderRing> createState() => _LoaderRingState();
}

class _LoaderRingState extends State<LoaderRing>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.period,
  )..repeat();

  @override
  void didUpdateWidget(LoaderRing oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.period != oldWidget.period) {
      _controller
        ..duration = widget.period
        ..repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: RotationTransition(
        turns: _controller,
        child: Container(
          width: widget.size,
          height: widget.size,
          padding: EdgeInsets.all(widget.thickness),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: SweepGradient(
              // CSS 0deg is 12 o'clock; SweepGradient's is 3 o'clock.
              transform: GradientRotation(-1.5707963267948966),
              colors: [
                AppColors.lime,
                AppColors.cyan,
                AppColors.violet,
                Color(0x00A78BFA),
                AppColors.lime,
              ],
              stops: [0.0, 0.33, 0.66, 0.75, 1.0],
            ),
          ),
          // Punches the centre out, leaving the ring.
          child: const DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.bg,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}

/// The three concentric activity rings on the welcome screen.
///
/// Static by design — it reads as an illustration, not a progress indicator.
class ActivityRings extends StatelessWidget {
  const ActivityRings({this.size = 190, super.key});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          _ring(inset: 0, thickness: 17, color: AppColors.pink, turns: -44 / 360),
          _ring(inset: 28, thickness: 15, color: AppColors.lime, turns: 18 / 360),
          _ring(inset: 54, thickness: 13, color: AppColors.cyan, turns: 72 / 360),
        ],
      ),
    );
  }

  Widget _ring({
    required double inset,
    required double thickness,
    required Color color,
    required double turns,
  }) {
    return Positioned.fill(
      left: inset,
      top: inset,
      right: inset,
      bottom: inset,
      child: Transform.rotate(
        angle: turns * 2 * 3.141592653589793,
        // Two of four quadrants coloured, matching the CSS border trick.
        child: CustomPaint(
          painter: _ArcPainter(color: color, thickness: thickness),
        ),
      ),
    );
  }
}

class _ArcPainter extends CustomPainter {
  const _ArcPainter({required this.color, required this.thickness});

  final Color color;
  final double thickness;

  @override
  void paint(Canvas canvas, Size size) {
    final radius = (size.shortestSide - thickness) / 2;
    final rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: radius,
    );

    canvas.drawArc(
      rect,
      -3.141592653589793 / 2, // 12 o'clock
      3.141592653589793, // half the circle
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = thickness
        ..strokeCap = StrokeCap.round
        ..color = color,
    );
  }

  @override
  bool shouldRepaint(_ArcPainter oldDelegate) =>
      oldDelegate.color != color || oldDelegate.thickness != thickness;
}
