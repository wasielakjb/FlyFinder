import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';

class ProfileUserWidget extends StatelessWidget {
  const ProfileUserWidget({
    required this.title,
    required this.subtitle,
    required this.editRoute,
    super.key,
  });

  final String title;
  final String subtitle;
  final PageRouteInfo editRoute;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            height: 80,
            width: 80,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  context.primaryContainer,
                  context.secondaryContainer,
                ],
              ),
            ),
            child: Text(
              title.substring(0, 1),
              style: context.displayMedium.copyWith(
                color: context.surface,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: context.titleLarge,
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: context.bodyLarge.copyWith(
            color: context.outline,
          ),
        ),
        const SizedBox(height: 16),
        FilledButton(
          onPressed: () => context.pushRoute(editRoute),
          child: const Text('Edit profile'),
        ),
      ],
    );
  }
}
