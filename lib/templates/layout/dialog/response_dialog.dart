import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';
import 'package:flyfinder/templates/layout/dialog/models/response_dialog_type.dart';

class ResponseDialog extends StatelessWidget {
  const ResponseDialog({
    required this.type,
    required this.title,
    required this.message,
    this.content,
    super.key,
  });

  final ResponseDialogType type;
  final String title;
  final String message;
  final List<Widget>? content;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: context.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              width: double.infinity,
              color: type.resolveBackgroundColor(context),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 42),
                child: Icon(
                  type.resolveIcon,
                  color: type.resolveForegroundColor(context),
                  size: 68,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: context.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              message,
              style: context.labelLarge,
              textAlign: TextAlign.center,
            ),
          ),
          if (content != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 24),
                  ...content!,
                ],
              ),
            ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
