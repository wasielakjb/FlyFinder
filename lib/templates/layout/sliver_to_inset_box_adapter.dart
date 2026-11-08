import 'package:flutter/cupertino.dart';

class SliverToInsetBoxAdapter extends StatelessWidget {
  const SliverToInsetBoxAdapter({
    required this.child,
    this.padding,
    this.margin,
    super.key,
  });

  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: margin ?? EdgeInsets.zero,
      sliver: SliverToBoxAdapter(
        child: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: child,
        ),
      ),
    );
  }
}
