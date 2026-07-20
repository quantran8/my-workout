import 'package:flutter/material.dart';

import 'tokens.dart';
import 'typography.dart';

/// [ThemeData] carries only what Material actually consumes. Everything bespoke
/// is read from [AppColors] and [AppText] directly.
ThemeData buildAppTheme() {
  final base = ThemeData.dark(useMaterial3: true);

  return base.copyWith(
    scaffoldBackgroundColor: AppColors.bg,
    canvasColor: AppColors.bg,
    colorScheme: const ColorScheme.dark(
      surface: AppColors.surface,
      surfaceContainerHighest: AppColors.surface2,
      primary: AppColors.lime,
      onPrimary: Colors.black,
      secondary: AppColors.cyan,
      onSecondary: Colors.black,
      error: AppColors.pink,
      onError: Colors.black,
    ),

    // Press-scale, not ripple.
    splashFactory: NoSplash.splashFactory,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,

    textTheme: base.textTheme.copyWith(
      displaySmall: AppText.title,
      headlineMedium: AppText.titleSm,
      titleMedium: AppText.sectionTitle,
      bodyLarge: AppText.subtitle,
      bodyMedium: AppText.body,
      bodySmall: AppText.bodySm,
      labelLarge: AppText.button,
      labelSmall: AppText.fine,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,
      hintStyle: const TextStyle(fontSize: 16, color: AppColors.muted2),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      border: _fieldBorder(AppColors.line),
      enabledBorder: _fieldBorder(AppColors.line),
      focusedBorder: _fieldBorder(AppColors.lime.withValues(alpha: 0.55)),
      errorBorder: _fieldBorder(AppColors.pink.withValues(alpha: 0.55)),
      focusedErrorBorder: _fieldBorder(AppColors.pink.withValues(alpha: 0.55)),
    ),

    dividerTheme: const DividerThemeData(
      color: AppColors.line,
      thickness: 1,
      space: 1,
    ),

    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.lime,
      selectionColor: Color(0x33D7FF45),
      selectionHandleColor: AppColors.lime,
    ),
  );
}

OutlineInputBorder _fieldBorder(Color color) => OutlineInputBorder(
  borderRadius: BorderRadius.circular(AppRadii.field),
  borderSide: BorderSide(color: color),
);
