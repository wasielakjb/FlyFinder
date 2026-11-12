import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';

class SheetHeader extends StatelessWidget {
  const SheetHeader(
    this.title, {
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
      child: Row(
        children: [
          IconButton(
            onPressed: context.maybePop,
            icon: const Icon(Icons.close),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 36),
              child: Text(title, style: context.titleMedium),
            ),
          ),
        ],
      ),
    );
  }
}
