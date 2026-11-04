import 'package:flutter/material.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';
import 'package:flyfinder/templates/layout/plain_button/models/plain_button.dart';
import 'package:flyfinder/templates/layout/plain_button/models/plain_button_position.dart';

class PlainButtonWidget extends StatelessWidget {
  const PlainButtonWidget({
    required this.button,
    required this.position,
    this.padding,
    super.key,
  });

  final EdgeInsets? padding;
  final PlainButton button;
  final PlainButtonPosition position;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: button.onTap.call(context),
      child: Padding(
        padding: const EdgeInsets.all(
          8,
        ).copyWith(left: padding?.left, right: padding?.right),
        child: Row(
          spacing: 8,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: context.surfaceContainer,
              ),
              child: Icon(button.icon, color: context.outline),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(button.title, style: context.titleMedium),
            ),
            if (button.value != null)
              Text(
                button.value!,
                style: context.titleSmall.copyWith(color: context.outline),
              ),
            if (button.suffix != null)
              Icon(button.suffix, color: context.outline, size: 14),
          ],
        ),
      ),
    );
  }
}
