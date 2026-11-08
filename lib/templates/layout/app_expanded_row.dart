import 'package:flutter/material.dart';

class AppExpandedRow extends StatelessWidget {
  const AppExpandedRow({
    required this.children,
    this.crossAxisAlignment,
    this.spacing,
    super.key,
  });

  final double? spacing;
  final CrossAxisAlignment? crossAxisAlignment;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: spacing ?? 0,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      children: children.map((e) => Expanded(child: e)).toList(),
    );
  }
}
