import 'package:flutter/material.dart';

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
    return wrapToSliver ? SliverToBoxAdapter(child: child) : child;
  }
}
