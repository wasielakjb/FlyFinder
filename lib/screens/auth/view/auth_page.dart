import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flyfinder/app/router/app_router.gr.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';

@RoutePage()
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Text(
                'Welcome to',
                style: context.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 2),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: context.headlineLarge,
                  children: [
                    const TextSpan(text: 'Fly'),
                    TextSpan(
                      text: 'Finder',
                      style: TextStyle(color: context.primary),
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 2),
              Text(
                'Smart flights start with\nsmart tracking.',
                style: context.titleSmall.copyWith(
                  color: context.outline,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              FilledButton(
                onPressed: () => context.pushRoute(const LoginRoute()),
                child: const Text('Get started'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
