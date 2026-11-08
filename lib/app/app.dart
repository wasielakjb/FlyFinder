import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flyfinder/app/cubit/app_theme_cubit.dart';
import 'package:flyfinder/app/router/app_router.dart';
import 'package:flyfinder/app/theme/app_theme.dart';
import 'package:flyfinder/di.dart';
import 'package:flyfinder/features/auth/auth_repository_impl.dart';

class App extends StatelessWidget {
  App({super.key});

  final AppRouter _router = inject<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => inject<AppThemeCubit>(),
      lazy: false,
      child: BlocBuilder<AppThemeCubit, ThemeMode>(
        builder: (context, themeMode) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: themeMode,
          routerConfig: _router.config(
            navigatorObservers: () => [AutoRouteObserver()],
            reevaluateListenable: ReevaluateListenable.stream(
              inject<AuthRepository>().authStateChanges,
            ),
          ),
        ),
      ),
    );
  }
}
