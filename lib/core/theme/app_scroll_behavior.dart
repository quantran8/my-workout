import 'package:flutter/material.dart';

/// Gives every scrollable the same soft, elastic edge response.
///
/// [AlwaysScrollableScrollPhysics] keeps the bounce available even when the
/// content is shorter than the viewport.
class AppScrollBehavior extends MaterialScrollBehavior {
  const AppScrollBehavior();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics(
      parent: AlwaysScrollableScrollPhysics(),
    );
  }
}
