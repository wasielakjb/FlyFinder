import 'package:flutter/material.dart';
import 'package:flyfinder/app/theme/app_color_scheme.dart';
import 'package:flyfinder/app/theme/app_text_theme.dart';

abstract final class AppTheme {
  static final light = ThemeData(
    useMaterial3: true,
    typography: Typography.material2021(),
    textTheme: lightTextTheme,
    colorScheme: lightColorScheme,
  );

  static final dark = ThemeData(
    useMaterial3: true,
    typography: Typography.material2021(),
    textTheme: darkTextTheme,
    colorScheme: darkColorScheme,
  );
}
