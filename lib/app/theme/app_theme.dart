import 'package:flutter/material.dart';
import 'package:flyfinder/app/theme/app_color_scheme.dart';
import 'package:flyfinder/app/theme/app_text_theme.dart';

abstract final class AppTheme {
  static final light = ThemeData(
    useMaterial3: true,
    typography: Typography.material2021(),
    textTheme: lightTextTheme,
    colorScheme: lightColorScheme,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: lightColorScheme.surfaceContainer,
      hintStyle: lightTextTheme.bodyLarge?.copyWith(
        color: lightColorScheme.outline,
      ),
      prefixIconColor: lightColorScheme.outlineVariant,
      suffixIconColor: lightColorScheme.outlineVariant,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        textStyle: lightTextTheme.titleMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );

  static final dark = ThemeData(
    useMaterial3: true,
    typography: Typography.material2021(),
    textTheme: darkTextTheme,
    colorScheme: darkColorScheme,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: darkColorScheme.surfaceContainer,
      hintStyle: darkTextTheme.bodyLarge?.copyWith(
        color: darkColorScheme.outline,
      ),
      prefixIconColor: darkColorScheme.outlineVariant,
      suffixIconColor: darkColorScheme.outlineVariant,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        textStyle: darkTextTheme.titleMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}
