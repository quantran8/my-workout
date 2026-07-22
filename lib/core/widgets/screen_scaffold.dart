import 'package:flutter/material.dart';

import '../theme/tokens.dart';
import '../theme/typography.dart';
import 'screen_enter.dart';

/// Common shell: black background, optional header and progress hairline, a
/// scrolling body, and a footer floating over the content behind a scrim.
///
/// The body always scrolls (`.scroll`); [centred] vertically centres short
/// content within the viewport rather than hugging the top.
class ScreenScaffold extends StatelessWidget {
  const ScreenScaffold({
    required this.body,
    this.header,
    this.progress,
    this.footer,
    this.centred = false,
    this.padding = const EdgeInsets.fromLTRB(
      AppSpacing.screenH,
      AppSpacing.screenTop,
      AppSpacing.screenH,
      AppSpacing.scrollBottom,
    ),
    this.animate = true,
    super.key,
  });

  final Widget body;
  final Widget? header;

  /// 0..1 for the onboarding steps; null hides the hairline entirely.
  final double? progress;

  final Widget? footer;
  final bool centred;
  final EdgeInsets padding;
  final bool animate;

  @override
  Widget build(BuildContext context) {
    Widget content = LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Padding(
            padding: padding,
            child: centred
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [body],
                    ),
                  )
                : body,
          ),
        ),
      ),
    );

    if (animate) content = ScreenEnter(child: content);

    return Scaffold(
      backgroundColor: AppColors.bg,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            if (header case final header?) header,
            // `.progress` sits directly under the header, above the body.
            if (progress != null) ProgressHairline(value: progress!),
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(child: content),
                  if (footer case final footer?)
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: _FloatingFooter(child: footer),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// `.progress` — a 3px track with a lime fill that eases over 350ms.
class ProgressHairline extends StatelessWidget {
  const ProgressHairline({required this.value, super.key});

  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 3,
      // Align.centerLeft pins the fill to the leading edge; without it the
      // Stack centres the undersized child and the bar grows from the middle.
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          const Positioned.fill(
            child: ColoredBox(color: Color(0x14FFFFFF)),
          ),
          LayoutBuilder(
            builder: (context, constraints) => AnimatedContainer(
              duration: AppMotion.progress,
              curve: Curves.easeOut,
              width: constraints.maxWidth * value.clamp(0, 1),
              height: 3,
              decoration: const BoxDecoration(
                color: AppColors.lime,
                borderRadius: BorderRadius.all(Radius.circular(AppRadii.pill)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// `.footer` — gradient scrim so content scrolls under the CTA rather than
/// being clipped by a hard edge.
class _FloatingFooter extends StatelessWidget {
  const _FloatingFooter({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final inset = MediaQuery.viewPaddingOf(context).bottom;

    return Container(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.screenH,
        AppSpacing.footerTop,
        AppSpacing.screenH,
        // `--safe-bottom: max(22px, env(safe-area-inset-bottom))`.
        inset > AppSpacing.footerBottomMin ? inset : AppSpacing.footerBottomMin,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0x00000000), Color(0xE6000000), Color(0xFF000000)],
          stops: [0, 0.24, 0.52],
        ),
      ),
      child: child,
    );
  }
}

/// `.app-header` — 58px, `44px 1fr 44px` grid so the title stays optically
/// centred regardless of the trailing slot.
class ScreenHeader extends StatelessWidget {
  const ScreenHeader({this.leading, this.title, this.trailing, super.key});

  final Widget? leading;
  final String? title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSpacing.headerHeight,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: AppColors.bg,
      child: Row(
        children: [
          SizedBox(width: 44, child: leading),
          Expanded(
            child: Text(
              title ?? '',
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppText.headerTitle,
            ),
          ),
          SizedBox(
            width: 44,
            child: Align(alignment: Alignment.centerRight, child: trailing),
          ),
        ],
      ),
    );
  }
}
