import 'package:flutter/material.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';
import 'package:flyfinder/templates/layout/dialog/models/response_dialog_type.dart';

class ResponseDialog extends StatelessWidget {
  const ResponseDialog({
    required this.type,
    required this.message,
    this.content,
    super.key,
  });

  final ResponseDialogType type;
  final String message;
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: context.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: type.resolveBackgroundColor(context),
              ),
              child: Icon(
                type.resolveIcon,
                color: type.resolveForegroundColor(context),
                size: 28,
              ),
            ),
            const SizedBox(height: 16),
            Text(type.name, style: context.titleLarge),
            const SizedBox(height: 4),
            Text(message, style: context.labelLarge),
            if (content != null)
              Padding(
                padding: const EdgeInsets.only(top: 28),
                child: content,
              ),
          ],
        ),
      ),
    );
  }
}
