import 'package:flutter/material.dart';

/// Design tokens, ported 1:1 from the HTML prototype's CSS custom properties.
///
/// True-black iOS-flavoured surfaces with a single acid-lime accent. Neutrals
/// are fixed greys (the iOS system palette) rather than white-at-opacity, so
/// contrast is predictable over any surface.
abstract final class AppColors {
  /// `--bg` — app background.
  static const bg = Color(0xFF000000);

  /// The page behind the device frame in the web mockup.
  static const stage = Color(0xFF070707);

  /// `--surface` — card, field and chip surface.
  static const surface = Color(0xFF1C1C1E);

  /// `--surface-2` — raised surface (dropdown menus).
  static const surface2 = Color(0xFF242426);

  /// `--line` — `rgba(255,255,255,.09)`.
  static const line = Color(0x17FFFFFF);

  /// `--text`.
  static const text = Color(0xFFFFFFFF);

  /// `--muted` — secondary text.
  static const muted = Color(0xFF8E8E93);

  /// `--muted-2` — fine print and hints.
  static const muted2 = Color(0xFF636366);

  /// `#d1d1d6` — chip and body copy on surfaces.
  static const textSoft = Color(0xFFD1D1D6);

  /// `#f2f2f7` — the review screen's story text.
  static const textBright = Color(0xFFF2F2F7);

  /// `#c7c7cc` — plan hero body copy.
  static const textDim = Color(0xFFC7C7CC);

  /// `--lime` — primary: CTAs, active state, progress.
  static const lime = Color(0xFFD7FF45);

  /// `--pink` — warning / destructive.
  static const pink = Color(0xFFFF375F);

  /// `--cyan` — secondary accent.
  static const cyan = Color(0xFF63E6D5);

  /// `--violet` — AI / inference accent.
  static const violet = Color(0xFFA78BFA);

  /// iOS system green — switch "on" track.
  static const green = Color(0xFF30D158);

  /// Switch "off" track.
  static const switchOff = Color(0xFF39393D);

  /// `.primary` foreground — `#090909`, not pure black.
  static const onLime = Color(0xFF090909);

  /// Stage backdrop glows, used only behind the phone frame on wide screens.
  static final glowViolet = violet.withValues(alpha: 0.12);
  static final glowCyan = cyan.withValues(alpha: 0.08);
}

abstract final class AppRadii {
  /// `.card`, `.field` on a card.
  static const card = 22.0;

  /// `.plan-hero`.
  static const cardLg = 24.0;

  /// `.field`, `.choice`, `details`.
  static const field = 18.0;

  /// `.email-wrap`.
  static const fieldWrap = 19.0;

  /// `.primary`.
  static const button = 17.0;

  /// `.segment` track, `.metric`.
  static const segment = 16.0;

  /// `.segment button`.
  static const segmentItem = 12.0;

  /// `.add`, `.toast`.
  static const small = 15.0;

  /// `.choice-icon`, `.session-day` (14px).
  static const icon = 13.0;

  /// Full pill — chips and the switch track.
  static const pill = 999.0;
}

abstract final class AppShadows {
  /// `.hero-mark` — `0 18px 50px rgba(215,255,69,.08)`.
  static final glow = BoxShadow(
    color: AppColors.lime.withValues(alpha: 0.08),
    blurRadius: 50,
    offset: const Offset(0, 18),
  );

  /// `.field:focus` — `0 0 0 4px rgba(215,255,69,.08)`.
  static final focusRing = BoxShadow(
    color: AppColors.lime.withValues(alpha: 0.08),
    spreadRadius: 4,
  );

  /// `.switch span` — `0 2px 6px rgba(0,0,0,.4)`.
  static const switchKnob = BoxShadow(
    color: Color(0x66000000),
    blurRadius: 6,
    offset: Offset(0, 2),
  );
}

abstract final class AppMotion {
  /// `screenIn` — fade + 12px slide from the right.
  static const screenIn = Duration(milliseconds: 280);
  static const enterCurve = Cubic(0.22, 0.8, 0.3, 1);

  /// Plan card cascade.
  static const cardRise = Duration(milliseconds: 450);
  static const cardStagger = Duration(milliseconds: 60);

  /// `.loader` — `spin 1.25s linear infinite`.
  static const ringSpin = Duration(milliseconds: 1250);

  /// `.dots span` — `bounce 1.2s infinite`, staggered .15s / .3s.
  static const dotBob = Duration(milliseconds: 1200);

  /// Loading copy rotation interval.
  static const loadingStage = Duration(milliseconds: 650);

  static const stageFlip = Duration(milliseconds: 250);

  /// `.progress>span` — `width .35s ease`.
  static const progress = Duration(milliseconds: 350);

  /// `.toast` auto-hide.
  static const toastVisible = Duration(milliseconds: 1800);

  /// `.primary` — `transform .15s`.
  static const press = Duration(milliseconds: 150);

  /// `.chip`, `.switch` — `.15s` / `.2s`.
  static const control = Duration(milliseconds: 200);
}

abstract final class AppSpacing {
  /// `.scroll` — `padding: 24px 20px 132px`.
  static const screenH = 20.0;
  static const screenTop = 24.0;
  static const scrollBottom = 132.0;

  /// `.card` interior.
  static const cardPadding = 16.0;

  /// `.stack` — `gap: 16px`.
  static const stackGap = 16.0;

  /// `.grid-2` — `gap: 12px`.
  static const gridGap = 12.0;

  /// `.section-title` — `margin: 27px 0 11px`.
  static const sectionTop = 27.0;
  static const sectionBottom = 11.0;

  /// `.app-header` height.
  static const headerHeight = 58.0;

  /// `.footer` — `padding: 14px 20px var(--safe-bottom)`.
  static const footerTop = 14.0;

  /// `--safe-bottom: max(22px, env(safe-area-inset-bottom))`.
  static const footerBottomMin = 22.0;
}
