import 'package:flutter/material.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';

class AnyButtonContent extends StatelessWidget {
  const AnyButtonContent({
    this.text,
    this.pending = false,
    this.fullWidth = true,
    this.icon,
    this.iconRight = false,
    super.key,
  });

  final String? text;
  final bool pending;
  final bool fullWidth;
  final Widget? icon;
  final bool iconRight;

  @override
  Widget build(BuildContext context) {
    final content = Row(
      mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null && !iconRight) ...[
          icon!,
          const SizedBox(width: 6),
        ],
        if (text != null) Text(text!),
        if (icon != null && iconRight) ...[
          const SizedBox(width: 6),
          icon!,
        ],
      ],
    );

    if (!pending) return content;

    return Stack(
      alignment: Alignment.center,
      children: [
        Opacity(
          opacity: 0,
          child: content,
        ),
        SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(
            color: context.surface,
            strokeWidth: 2,
          ),
        ),
      ],
    );
  }
}
