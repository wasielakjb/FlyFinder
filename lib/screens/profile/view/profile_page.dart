import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flyfinder/app/cubit/app_theme_cubit.dart';
import 'package:flyfinder/app/router/app_router.gr.dart';
import 'package:flyfinder/screens/profile/widgets/profile_user_wgt.dart';
import 'package:flyfinder/templates/layout/plain_button/models/plain_button.dart';
import 'package:flyfinder/templates/layout/plain_button/widgets/plain_button_group.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.watch<AppThemeCubit>();

    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actionsPadding: const EdgeInsets.only(right: 4),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.logout_outlined),
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              const ProfileUserWidget(
                editRoute: HomeRoute(),
                title: 'Jakub Wasielak',
                subtitle: 'wasielak@gmail.com',
              ),
              const SizedBox(height: 24),
              const PlainButtonGroup(
                padding: EdgeInsets.symmetric(horizontal: 20),
                title: 'Content',
                buttons: [
                  RoutePlainButton(
                    route: PaymentMethodsListRoute(),
                    title: 'Credit Cards',
                    icon: Icons.credit_card_outlined,
                  ),
                  RoutePlainButton(
                    route: HomeRoute(),
                    title: 'Currency',
                    icon: Icons.language_outlined,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              PlainButtonGroup(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                title: 'Preferences',
                buttons: [
                  const RoutePlainButton(
                    route: HomeRoute(),
                    title: 'Notifications',
                    icon: Icons.notifications_outlined,
                  ),
                  const RoutePlainButton(
                    route: HomeRoute(),
                    title: 'Security',
                    icon: Icons.lock_outline,
                  ),
                  const RoutePlainButton(
                    route: HomeRoute(),
                    title: 'Language',
                    icon: Icons.translate_outlined,
                  ),
                  RoutePlainButton(
                    route: const ThemeModeRoute(),
                    value: themeCubit.state.label(),
                    title: 'Theme',
                    icon: Icons.color_lens_outlined,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension on ThemeMode {
  String label() => switch (this) {
    ThemeMode.system => 'System',
    ThemeMode.light => 'Light',
    ThemeMode.dark => 'Dark',
  };
}
