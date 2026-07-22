import 'package:flutter/material.dart';

import '../../../../core/theme/tokens.dart';

/// The minimal line-art squat figure from the prototype's inline SVG, redrawn
/// as a painter. Authored on a 280×360 viewBox; scaled to fit.
class SquatFigure extends StatelessWidget {
  const SquatFigure({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 280 / 360,
      child: CustomPaint(painter: _SquatPainter()),
    );
  }
}

class _SquatPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final sx = size.width / 280;
    final sy = size.height / 360;
    Offset p(double x, double y) => Offset(x * sx, y * sy);

    // Floor shadow ellipse.
    canvas.drawOval(
      Rect.fromCenter(center: p(140, 330), width: 192 * sx, height: 20 * sy),
      Paint()..color = AppColors.surface,
    );

    // Head.
    canvas.drawCircle(p(148, 70), 30 * sx, Paint()..color = AppColors.textSoft);

    final limb = Paint()
      ..color = AppColors.textSoft
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    // Spine (white→soft grey gradient).
    final spine = Paint()
      ..shader = const LinearGradient(
        colors: [Colors.white, AppColors.textSoft],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 22 * sx;
    canvas.drawPath(
      Path()
        ..moveTo(p(145, 100).dx, p(145, 100).dy)
        ..cubicTo(
          p(137, 132).dx, p(137, 132).dy,
          p(132, 158).dx, p(132, 158).dy,
          p(126, 190).dx, p(126, 190).dy,
        ),
      spine,
    );

    // Arms.
    limb.strokeWidth = 17 * sx;
    canvas.drawLine(p(139, 124), p(86, 157), limb);
    canvas.drawLine(p(142, 124), p(198, 150), limb);

    // Legs.
    limb.strokeWidth = 22 * sx;
    canvas.drawPath(
      Path()
        ..moveTo(p(125, 189).dx, p(125, 189).dy)
        ..lineTo(p(77, 234).dx, p(77, 234).dy)
        ..lineTo(p(47, 305).dx, p(47, 305).dy),
      limb,
    );
    canvas.drawPath(
      Path()
        ..moveTo(p(128, 190).dx, p(128, 190).dy)
        ..lineTo(p(184, 228).dx, p(184, 228).dy)
        ..lineTo(p(228, 298).dx, p(228, 298).dy),
      limb,
    );

    // Feet.
    final foot = Paint()
      ..color = AppColors.muted2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10 * sx;
    canvas.drawLine(p(28, 312), p(85, 312), foot);
    canvas.drawLine(p(204, 306), p(256, 306), foot);

    // Faint lime aura ring behind the torso.
    canvas.drawCircle(
      p(140, 184),
      82 * sx,
      Paint()
        ..color = AppColors.lime.withValues(alpha: 0.10)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2 * sx,
    );
  }

  @override
  bool shouldRepaint(_SquatPainter oldDelegate) => false;
}
