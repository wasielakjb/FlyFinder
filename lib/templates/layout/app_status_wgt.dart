import 'package:flutter/material.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';

class AppStatusWidget extends StatelessWidget {
  const AppStatusWidget({
    required this.icon,
    this.text,
    this.content,
    super.key,
  });

  final IconData icon;
  final String? text;
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.surfaceContainerHighest
          ),
          child: Icon(icon, size: 28),
        ),
        if (text != null) ...[
          const SizedBox(height: 8),
          Text(text!, style: context.titleMedium),
        ],
        ?content,
      ],
    );
  }
}
