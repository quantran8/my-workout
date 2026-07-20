import 'package:flutter/material.dart';

import '../theme/tokens.dart';
import '../theme/typography.dart';

enum PrimaryButtonVariant {
  /// `.primary` — lime fill, `#090909` text. The default CTA.
  lime,

  /// `.apple` — white fill, black text, 54px.
  white,

  /// `.secondary` — surface fill, 50px.
  surface,
}

/// Full-width CTA. `.primary`: min 54px, radius 17, weight 750, press
/// `scale(.985)`. A null [onPressed] renders `:disabled` — 28% opacity.
class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    required this.label,
    required this.onPressed,
    this.variant = PrimaryButtonVariant.lime,
    this.trailing,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final PrimaryButtonVariant variant;
  final Widget? trailing;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final enabled = widget.onPressed != null;
    final (background, foreground, minHeight, weight) = switch (widget.variant) {
      PrimaryButtonVariant.lime => (
        AppColors.lime,
        AppColors.onLime,
        54.0,
        FontWeight.w800,
      ),
      PrimaryButtonVariant.white => (
        Colors.white,
        Colors.black,
        54.0,
        FontWeight.w700,
      ),
      PrimaryButtonVariant.surface => (
        AppColors.surface,
        AppColors.text,
        50.0,
        FontWeight.w600,
      ),
    };

    return Semantics(
      button: true,
      enabled: enabled,
      label: widget.label,
      child: Opacity(
        opacity: enabled ? 1 : 0.28,
        child: GestureDetector(
          onTapDown: enabled ? (_) => setState(() => _pressed = true) : null,
          onTapUp: enabled ? (_) => setState(() => _pressed = false) : null,
          onTapCancel: enabled ? () => setState(() => _pressed = false) : null,
          onTap: widget.onPressed,
          child: AnimatedScale(
            scale: _pressed ? 0.985 : 1,
            duration: AppMotion.press,
            child: Container(
              width: double.infinity,
              constraints: BoxConstraints(minHeight: minHeight),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(
                  widget.variant == PrimaryButtonVariant.surface
                      ? AppRadii.segment
                      : AppRadii.button,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      widget.label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppText.button.copyWith(
                        color: foreground,
                        fontWeight: weight,
                      ),
                    ),
                  ),
                  if (widget.trailing case final trailing?) ...[
                    const SizedBox(width: 8),
                    IconTheme(
                      data: IconThemeData(color: foreground, size: 18),
                      child: trailing,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// `.add` — 46px dashed-feel row on the surface, lime label. Adds a repeatable
/// row (an extra injury area).
class AddRowButton extends StatelessWidget {
  const AddRowButton({required this.label, required this.onTap, super.key});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: label,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 46,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadii.small),
            border: Border.all(color: AppColors.line),
          ),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.lime,
            ),
          ),
        ),
      ),
    );
  }
}

/// `.back` — 44px circular hit target, transparent until pressed.
class CircleBackButton extends StatefulWidget {
  const CircleBackButton({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  State<CircleBackButton> createState() => _CircleBackButtonState();
}

class _CircleBackButtonState extends State<CircleBackButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: MaterialLocalizations.of(context).backButtonTooltip,
      child: GestureDetector(
        onTapDown: (_) => setState(() => _pressed = true),
        onTapUp: (_) => setState(() => _pressed = false),
        onTapCancel: () => setState(() => _pressed = false),
        onTap: widget.onTap,
        child: Container(
          width: 44,
          height: 44,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: _pressed ? Colors.white.withValues(alpha: 0.08) : null,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.chevron_left_rounded,
            size: 26,
            color: AppColors.text,
          ),
        ),
      ),
    );
  }
}

/// `.delete` — 32px circular destructive button on a pink wash.
class DeleteButton extends StatelessWidget {
  const DeleteButton({required this.onTap, this.semanticLabel, super.key});

  final VoidCallback onTap;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: semanticLabel,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 32,
          height: 32,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.pink.withValues(alpha: 0.12),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.close_rounded, size: 18, color: AppColors.pink),
        ),
      ),
    );
  }
}
