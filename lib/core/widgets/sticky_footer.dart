import 'dart:ui';

import 'package:flutter/material.dart';

import '../theme/tokens.dart';

/// `.footer` — top hairline, `ink/95`, `blur(18px)`, padding `16px 20px 24px`.
///
/// The bottom padding also absorbs the device's home-indicator inset so the CTA
/// never sits under it.
class StickyFooter extends StatelessWidget {
  const StickyFooter({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.viewPaddingOf(context).bottom;

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.bg.withValues(alpha: 0.95),
            border: Border(top: BorderSide(color: AppColors.line)),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 16, 20, 24 + bottomInset),
            child: child,
          ),
        ),
      ),
    );
  }
}
