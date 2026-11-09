import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flyfinder/templates/layout/bottom_navigation_bar/app_scaffold.dart';

@RoutePage()
class FlightsPage extends StatelessWidget {
  const FlightsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold();
  }
}
