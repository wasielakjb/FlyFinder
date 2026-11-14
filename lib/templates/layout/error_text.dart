import 'package:flutter/material.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';

class ErrorText extends StatelessWidget {
  const ErrorText(
    this.text, {
    this.style,
    this.textAlign,
    this.padding,
    super.key,
  });

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Text(
        text,
        style: context.labelSmall.copyWith(color: context.error),
        textAlign: textAlign,
      ),
    );
  }
}
