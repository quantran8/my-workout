import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../../../core/theme/tokens.dart';

class HomeNavItem {
  const HomeNavItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
}

/// Translucent tab bar pinned to the bottom. Blurred rather than opaque so the
/// scrolling content stays faintly visible beneath it, as in the design.
class HomeBottomNav extends StatelessWidget {
  const HomeBottomNav({
    required this.items,
    required this.currentIndex,
    super.key,
  });

  final List<HomeNavItem> items;
  final int currentIndex;

  /// Content height above the safe-area inset. Callers pad their scroll view by
  /// this plus the inset so the last card can clear the bar.
  static const height = 67.0;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.viewPaddingOf(context).bottom;

    return ClipRect(
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 22, sigmaY: 22),
        child: Container(
          padding: EdgeInsets.only(top: 10, bottom: bottomInset + 10),
          decoration: BoxDecoration(
            color: const Color(0xFF0E0E0F).withValues(alpha: 0.91),
            border: Border(
              top: BorderSide(color: Colors.white.withValues(alpha: 0.07)),
            ),
          ),
          child: Row(
            children: [
              for (final (i, item) in items.indexed)
                Expanded(
                  child: _NavButton(item: item, active: i == currentIndex),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({required this.item, required this.active});

  final HomeNavItem item;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final color = active ? AppColors.lime : AppColors.muted2;

    return Semantics(
      button: true,
      selected: active,
      label: item.label,
      child: InkWell(
        onTap: item.onTap,
        borderRadius: BorderRadius.circular(AppRadii.segment),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(item.icon, size: 22, color: color),
              const SizedBox(height: 5),
              Text(
                item.label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 10, color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
