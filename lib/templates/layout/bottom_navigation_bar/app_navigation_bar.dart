import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flyfinder/app/router/app_router.gr.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.bottomCenter,
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(99),
          color: context.surface,
          boxShadow: [
            BoxShadow(
              color: context.onSurface.withAlpha(20),
              blurRadius: 20,
              spreadRadius: 10,
            ),
          ],
        ),
        child: const Row(
          spacing: 4,
          mainAxisSize: MainAxisSize.min,
          children: [
            _NavigationBarItem(
              routeInfo: HomeRoute(),
              icon: Icons.home_outlined,
              selectedIcon: Icons.home,
            ),
            _NavigationBarItem(
              routeInfo: FlightsRoute(),
              icon: Icons.explore_outlined,
              selectedIcon: Icons.explore,
            ),
            _NavigationBarItem(
              routeInfo: TicketsRoute(),
              icon: Icons.airplane_ticket_outlined,
              selectedIcon: Icons.airplane_ticket,
            ),
            _NavigationBarItem(
              routeInfo: ProfileRoute(),
              icon: Icons.account_circle_outlined,
              selectedIcon: Icons.account_circle,
            ),
          ],
        ),
      ),
    );
  }
}

class _NavigationBarItem extends StatelessWidget {
  const _NavigationBarItem({
    required this.routeInfo,
    required this.icon,
    required this.selectedIcon,
  });

  final PageRouteInfo routeInfo;
  final IconData icon;
  final IconData selectedIcon;

  @override
  Widget build(BuildContext context) {
    final isActive = context.router.current.name == routeInfo.routeName;
    return Expanded(
      child: Material(
        color: isActive ? context.surfaceContainerHigh : null,
        borderRadius: BorderRadius.circular(99),
        child: InkWell(
          onTap: isActive
              ? null
              : () => context.router.pushAndPopUntil(
                  routeInfo,
                  predicate: (route) => route.data?.name == HomeRoute.name,
                ),
          borderRadius: BorderRadius.circular(99),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(isActive ? selectedIcon : icon, size: 28),
          ),
        ),
      ),
    );
  }
}
