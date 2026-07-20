import 'package:flutter/material.dart';

import '../theme/tokens.dart';
import '../theme/typography.dart';

/// Surface card with a hairline border.
class InputCard extends StatelessWidget {
  const InputCard({
    required this.child,
    this.padding = const EdgeInsets.all(AppSpacing.cardPadding),
    this.radius = AppRadii.card,
    super.key,
  });

  final Widget child;
  final EdgeInsets padding;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: AppColors.line),
      ),
      child: child,
    );
  }
}

/// Label above a control.
class LabeledField extends StatelessWidget {
  const LabeledField({
    required this.label,
    required this.child,
    this.trailing,
    super.key,
  });

  final String label;
  final Widget child;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: Text(label, style: AppText.fieldLabel)),
            if (trailing case final trailing?) trailing,
          ],
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }
}

/// Group heading between stacked sections.
class SectionTitle extends StatelessWidget {
  const SectionTitle(this.text, {this.top = 27, super.key});

  final String text;
  final double top;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: top, bottom: 11),
      child: Text(text, style: AppText.sectionTitle),
    );
  }
}

/// Accent tone. Cards borrow the colour on their border to signal category.
enum AccentTone {
  lime(AppColors.lime),
  cyan(AppColors.cyan),
  violet(AppColors.violet),
  pink(AppColors.pink),
  neutral(AppColors.muted);

  const AccentTone(this.color);

  final Color color;
}

/// A card that can carry an accent tint and an eyebrow.
class AccentCard extends StatelessWidget {
  const AccentCard({
    required this.child,
    this.tone = AccentTone.neutral,
    this.eyebrow,
    this.padding = const EdgeInsets.all(AppSpacing.cardPadding),
    this.radius = AppRadii.card,
    super.key,
  });

  final Widget child;
  final AccentTone tone;
  final String? eyebrow;
  final EdgeInsets padding;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final neutral = tone == AccentTone.neutral;

    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: neutral
            ? AppColors.surface
            : tone.color.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: neutral ? AppColors.line : tone.color.withValues(alpha: 0.18),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (eyebrow case final eyebrow?) ...[
            Text(
              eyebrow.toUpperCase(),
              style: AppText.eyebrow.copyWith(
                color: neutral ? AppColors.muted : tone.color,
              ),
            ),
            const SizedBox(height: 10),
          ],
          child,
        ],
      ),
    );
  }
}

/// Centred number over a caption, used in the plan hero.
class MetricTile extends StatelessWidget {
  const MetricTile({required this.value, required this.caption, super.key});

  final String value;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.28),
        borderRadius: BorderRadius.circular(AppRadii.segment),
      ),
      child: Column(
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(value, style: AppText.metric),
          ),
          const SizedBox(height: 2),
          Text(
            caption,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 10, color: AppColors.muted),
          ),
        ],
      ),
    );
  }
}

/// Eyebrow + headline + optional supporting copy.
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    required this.headline,
    this.eyebrow,
    this.tone = AccentTone.lime,
    this.body,
    super.key,
  });

  final String headline;
  final String? eyebrow;
  final AccentTone tone;
  final String? body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (eyebrow case final eyebrow?) ...[
          Text(
            eyebrow.toUpperCase(),
            style: AppText.eyebrow.copyWith(color: tone.color),
          ),
          const SizedBox(height: 10),
        ],
        Text(headline, style: AppText.title),
        if (body case final body?) ...[
          const SizedBox(height: 13),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 355),
            child: Text(body, style: AppText.subtitle),
          ),
        ],
      ],
    );
  }
}
