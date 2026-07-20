import 'package:flutter/material.dart';

import 'tokens.dart';

/// Type scale, ported from the prototype's CSS.
///
/// CSS tracking is in `em`; Flutter's `letterSpacing` is logical pixels, so
/// `letterSpacing = em × fontSize`. `text-transform` has no equivalent — the
/// eyebrow widget uppercases its own string.
///
/// Family is the platform default (SF Pro on iOS, Roboto on Android), matching
/// the CSS system stack. Both cover Vietnamese diacritics.
abstract final class AppText {
  /// `.title` — 36px/750, −.052em, line-height 1.04.
  ///
  /// [leadingDistribution] is required: at this line-height Vietnamese
  /// diacritics (ạ, ộ, ế) clip without it.
  static const title = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w800,
    letterSpacing: 36 * -0.052,
    height: 1.04,
    leadingDistribution: TextLeadingDistribution.even,
    color: AppColors.text,
  );

  /// `.plan-hero h2` — 25px/700, −.035em, line-height 1.1.
  static const titleSm = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w700,
    letterSpacing: 25 * -0.035,
    height: 1.1,
    leadingDistribution: TextLeadingDistribution.even,
    color: AppColors.text,
  );

  /// `.loading-title` — 28px, −.04em.
  static const loadingTitle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    letterSpacing: 28 * -0.04,
    height: 1.1,
    leadingDistribution: TextLeadingDistribution.even,
    color: AppColors.text,
  );

  /// `.eyebrow` — 12px/750, +.12em, uppercase, lime.
  static const eyebrow = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w800,
    letterSpacing: 12 * 0.12,
    color: AppColors.lime,
  );

  /// `.subtitle` — 15px, line-height 1.5, muted, max-width 355px.
  static const subtitle = TextStyle(
    fontSize: 15,
    height: 1.5,
    color: AppColors.muted,
  );

  /// `.header-title` — 15px/650, −.01em.
  static const headerTitle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    letterSpacing: 15 * -0.01,
    color: AppColors.text,
  );

  /// `.section-title` — 13px/700, white.
  static const sectionTitle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    color: AppColors.text,
  );

  /// `.field-label` — 13px/650.
  static const fieldLabel = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.text,
  );

  /// `.field` — 16px, line-height 1.4. 16px also avoids iOS zoom-on-focus.
  static const input = TextStyle(
    fontSize: 16,
    height: 1.4,
    color: AppColors.text,
  );

  /// `.hint` — 12px, line-height 1.45, muted-2.
  static const hint = TextStyle(
    fontSize: 12,
    height: 1.45,
    color: AppColors.muted2,
  );

  /// `.privacy` — 11px, muted-2.
  static const fine = TextStyle(fontSize: 11, height: 1.45, color: AppColors.muted2);

  /// `.primary` — 16px/750, −.015em.
  static const button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w800,
    letterSpacing: 16 * -0.015,
  );

  /// `.chip` — 14px.
  static const chip = TextStyle(fontSize: 14, color: AppColors.textSoft);

  /// `.segment button` — 13px/650.
  static const segment = TextStyle(fontSize: 13, fontWeight: FontWeight.w600);

  /// `.summary-row span` — 13px; the value is weight 600.
  static const summaryLabel = TextStyle(fontSize: 13, color: AppColors.muted);
  static const summaryValue = TextStyle(
    fontSize: 13,
    height: 1.4,
    fontWeight: FontWeight.w600,
    color: AppColors.text,
  );

  /// `.metric b` — 19px.
  static const metric = TextStyle(fontSize: 19, fontWeight: FontWeight.w700);

  /// `.metric span` — 10px, muted.
  static const metricCaption = TextStyle(fontSize: 10, color: AppColors.muted);

  /// Body copy inside cards — 13px, line-height 1.5.
  static const bodySm = TextStyle(
    fontSize: 13,
    height: 1.5,
    color: AppColors.textSoft,
  );

  /// `.summary-story` — 14px, line-height 1.55.
  static const body = TextStyle(
    fontSize: 14,
    height: 1.55,
    color: AppColors.textBright,
  );

  /// `.loading-copy` — 14px, line-height 1.5, muted.
  static const loadingCopy = TextStyle(
    fontSize: 14,
    height: 1.5,
    color: AppColors.muted,
  );
}
