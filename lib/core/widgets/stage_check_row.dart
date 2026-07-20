import 'package:flutter/material.dart';

import '../theme/tokens.dart';

/// A pipeline step that flips to a lime-tinted card with a filled tick once
/// [done].
class StageCheckRow extends StatelessWidget {
  const StageCheckRow({
    required this.index,
    required this.label,
    required this.done,
    super.key,
  });

  /// 1-based; shown in the badge until [done] replaces it with a tick.
  final int index;
  final String label;
  final bool done;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AppMotion.stageFlip,
      curve: Curves.easeOut,
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: done
            ? AppColors.lime.withValues(alpha: 0.08)
            : AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadii.field),
        border: Border.all(
          color: done ? AppColors.lime.withValues(alpha: 0.28) : AppColors.line,
        ),
      ),
      child: Row(
        children: [
          AnimatedContainer(
            duration: AppMotion.stageFlip,
            width: 28,
            height: 28,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: done ? AppColors.lime : Colors.white.withValues(alpha: 0.06),
              shape: BoxShape.circle,
            ),
            child: done
                ? const Icon(Icons.check_rounded, size: 16, color: Colors.black)
                : Text(
                    '$index',
                    style: const TextStyle(fontSize: 12, color: AppColors.muted),
                  ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: AnimatedDefaultTextStyle(
              duration: AppMotion.stageFlip,
              style: TextStyle(
                fontSize: 13,
                height: 1.4,
                color: done ? AppColors.text : AppColors.muted,
              ),
              child: Text(label),
            ),
          ),
        ],
      ),
    );
  }
}

/// Three dots bobbing in sequence, under the loading spinner.
class LoadingDots extends StatefulWidget {
  const LoadingDots({this.size = 6, this.gap = 6, super.key});

  final double size;
  final double gap;

  @override
  State<LoadingDots> createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<LoadingDots>
    with SingleTickerProviderStateMixin {
  static const _delays = [0.0, 0.125, 0.25];

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: AppMotion.dotBob,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var i = 0; i < _delays.length; i++) ...[
              if (i > 0) SizedBox(width: widget.gap),
              _dot(i),
            ],
          ],
        ),
      ),
    );
  }

  Widget _dot(int index) {
    // Triangle wave through easeInOut gives a symmetric up-and-back bob.
    final phase = (_controller.value - _delays[index]) % 1.0;
    final bob = Curves.easeInOut.transform(
      phase < 0.5 ? phase * 2 : (1 - phase) * 2,
    );

    return Transform.translate(
      offset: Offset(0, -5 * bob),
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          color: Color.lerp(AppColors.muted, Colors.white, bob),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
