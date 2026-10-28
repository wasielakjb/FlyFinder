import 'package:flutter/material.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';

enum ResponseDialogType {
  Success(1),
  Warning(2),
  Error(3),
  Info(4);

  const ResponseDialogType(this.value);
  final int value;

  IconData get resolveIcon => switch (this) {
    ResponseDialogType.Success => Icons.check_circle_outline,
    ResponseDialogType.Warning => Icons.warning_amber_outlined,
    ResponseDialogType.Error => Icons.error_outline,
    ResponseDialogType.Info => Icons.info_outline,
  };

  Color resolveBackgroundColor(BuildContext context) {
    return switch (this) {
      ResponseDialogType.Success => Colors.green[100]!,
      ResponseDialogType.Warning => Colors.orange[100]!,
      ResponseDialogType.Error => context.errorContainer,
      ResponseDialogType.Info => Colors.blue[100]!,
    };
  }

  Color resolveForegroundColor(BuildContext context) {
    return switch (this) {
      ResponseDialogType.Success => Colors.green,
      ResponseDialogType.Warning => Colors.orange,
      ResponseDialogType.Error => context.error,
      ResponseDialogType.Info => Colors.blue,
    };
  }
}
