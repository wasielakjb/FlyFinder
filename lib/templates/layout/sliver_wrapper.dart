import 'package:flutter/material.dart';
import 'package:flyfinder/templates/layout/sliver_to_inset_box_adapter.dart';

class SliverWrapper extends StatelessWidget {
  const SliverWrapper({
    required this.child,
    required this.wrapToSliver,
    super.key,
  });

  final Widget child;
  final bool wrapToSliver;

  @override
  Widget build(BuildContext context) {
    return wrapToSliver
        ? SliverToInsetBoxAdapter(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: child,
          )
        : child;
  }
}
