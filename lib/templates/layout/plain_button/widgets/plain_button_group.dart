import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';
import 'package:flyfinder/templates/layout/plain_button/models/plain_button.dart';
import 'package:flyfinder/templates/layout/plain_button/models/plain_button_position.dart';
import 'package:flyfinder/templates/layout/plain_button/widgets/plain_button_wgt.dart';

class PlainButtonGroup extends StatelessWidget {
  const PlainButtonGroup({
    required this.buttons,
    this.title,
    this.padding,
    super.key,
  });

  final EdgeInsets? padding;
  final String? title;
  final List<PlainButton> buttons;

  @override
  Widget build(BuildContext context) {
    assert(buttons.isNotEmpty, 'Any PlainButton must be provided');
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: padding ?? EdgeInsets.zero,
            child: Text(
              title!,
              style: context.titleSmall.copyWith(color: context.outline),
            ),
          ),
        ...buttons.mapIndexed((index, button) {
          return PlainButtonWidget(
            button: button,
            padding: padding,
            position: PlainButtonPosition.fromIndex(
              index: index,
              count: buttons.length,
            ),
          );
        }),
      ],
    );
  }
}
