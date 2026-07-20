import 'package:flutter/material.dart';

import '../theme/tokens.dart';

/// Plain black app background.
///
/// Earlier revisions layered three ambient radial glows here; the current
/// design keeps the surface flat and reserves colour for accents, so this is
/// now just the base fill. Kept as a widget because screens compose it.
class NoiseBackground extends StatelessWidget {
  const NoiseBackground({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(color: AppColors.bg, child: child);
  }
}
