import 'package:flutter/material.dart';

import '../theme/tokens.dart';

/// The `screenIn` entrance: fade + a 12px slide from the right, 280ms.
///
/// Also drives the plan-card cascade — pass a [delay] in
/// [AppMotion.cardStagger] steps, and [axis] of [Axis.vertical] for a rise
/// instead of a slide.
class ScreenEnter extends StatefulWidget {
  const ScreenEnter({
    required this.child,
    this.delay = Duration.zero,
    this.duration = AppMotion.screenIn,
    this.offset = 12,
    this.axis = Axis.horizontal,
    super.key,
  });

  final Widget child;
  final Duration delay;
  final Duration duration;
  final double offset;
  final Axis axis;

  @override
  State<ScreenEnter> createState() => _ScreenEnterState();
}

class _ScreenEnterState extends State<ScreenEnter>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.duration,
  );

  /// Holds at 0 for the delay portion, then runs the entrance curve.
  late final Animation<double> _t = CurvedAnimation(
    parent: _controller,
    curve: widget.delay == Duration.zero
        ? AppMotion.enterCurve
        : Interval(_delayFraction, 1, curve: AppMotion.enterCurve),
  );

  @override
  void initState() {
    super.initState();
    // `forward(from:)` with a negative start expresses the stagger inside the
    // controller, so there is no free-standing timer to leak if the widget is
    // torn down mid-delay.
    if (widget.delay == Duration.zero) {
      _controller.forward();
    } else {
      final total = widget.duration.inMicroseconds;
      final offset = widget.delay.inMicroseconds;
      _controller
        ..duration = Duration(microseconds: total + offset)
        ..forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Fraction of the extended timeline spent waiting.
  double get _delayFraction {
    final total = widget.duration.inMicroseconds + widget.delay.inMicroseconds;
    return total == 0 ? 0 : widget.delay.inMicroseconds / total;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _t,
      builder: (context, child) {
        final travel = widget.offset * (1 - _t.value);
        return Opacity(
          opacity: _t.value,
          child: Transform.translate(
            offset: widget.axis == Axis.horizontal
                ? Offset(travel, 0)
                : Offset(0, travel),
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}
