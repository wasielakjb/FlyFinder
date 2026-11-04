import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

abstract interface class PlainButton {
  String get title;

  String? get value;

  IconData get icon;

  IconData? get suffix;

  VoidCallback? onTap(BuildContext context);
}

class RoutePlainButton implements PlainButton {
  const RoutePlainButton({
    required this.title,
    required this.route,
    required this.icon,
    this.value,
  });

  @override
  final String title;
  @override
  final String? value;
  @override
  final IconData icon;
  final PageRouteInfo route;

  @override
  IconData? get suffix => Icons.arrow_forward_ios;

  @override
  VoidCallback onTap(BuildContext context) =>
      () => context.pushRoute(route);
}

class RegularPlainButton implements PlainButton {
  const RegularPlainButton({
    required this.title,
    required this.icon,
    this.value,
    this.onPressed,
  });

  @override
  final String title;
  @override
  final String? value;
  @override
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  IconData? get suffix => Icons.arrow_forward_ios;

  @override
  VoidCallback? onTap(BuildContext context) => onPressed;
}
