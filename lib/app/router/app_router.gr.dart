// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flyfinder/features/payment_methods/ui/form/view/payment_method_form_page.dart'
    as _i4;
import 'package:flyfinder/features/payment_methods/ui/list/view/payment_methods_list_page.dart'
    as _i5;
import 'package:flyfinder/screens/auth/screens/login/view/login_page.dart'
    as _i3;
import 'package:flyfinder/screens/auth/screens/register/view/register_page.dart'
    as _i7;
import 'package:flyfinder/screens/auth/view/auth_page.dart' as _i1;
import 'package:flyfinder/screens/home/view/home_page.dart' as _i2;
import 'package:flyfinder/screens/profile/screens/theme_mode_page.dart' as _i8;
import 'package:flyfinder/screens/profile/view/profile_page.dart' as _i6;

/// generated route for
/// [_i1.AuthPage]
class AuthRoute extends _i9.PageRouteInfo<void> {
  const AuthRoute({List<_i9.PageRouteInfo>? children})
    : super(AuthRoute.name, initialChildren: children);

  static const String name = 'AuthRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthPage();
    },
  );
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomePage();
    },
  );
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i9.PageRouteInfo<void> {
  const LoginRoute({List<_i9.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i9.WrappedRoute(child: const _i3.LoginPage());
    },
  );
}

/// generated route for
/// [_i4.PaymentMethodFormPage]
class PaymentMethodFormRoute extends _i9.PageRouteInfo<void> {
  const PaymentMethodFormRoute({List<_i9.PageRouteInfo>? children})
    : super(PaymentMethodFormRoute.name, initialChildren: children);

  static const String name = 'PaymentMethodFormRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i9.WrappedRoute(child: const _i4.PaymentMethodFormPage());
    },
  );
}

/// generated route for
/// [_i5.PaymentMethodsListPage]
class PaymentMethodsListRoute extends _i9.PageRouteInfo<void> {
  const PaymentMethodsListRoute({List<_i9.PageRouteInfo>? children})
    : super(PaymentMethodsListRoute.name, initialChildren: children);

  static const String name = 'PaymentMethodsListRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i9.WrappedRoute(child: const _i5.PaymentMethodsListPage());
    },
  );
}

/// generated route for
/// [_i6.ProfilePage]
class ProfileRoute extends _i9.PageRouteInfo<void> {
  const ProfileRoute({List<_i9.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i6.ProfilePage();
    },
  );
}

/// generated route for
/// [_i7.RegisterPage]
class RegisterRoute extends _i9.PageRouteInfo<void> {
  const RegisterRoute({List<_i9.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i9.WrappedRoute(child: const _i7.RegisterPage());
    },
  );
}

/// generated route for
/// [_i8.ThemeModePage]
class ThemeModeRoute extends _i9.PageRouteInfo<void> {
  const ThemeModeRoute({List<_i9.PageRouteInfo>? children})
    : super(ThemeModeRoute.name, initialChildren: children);

  static const String name = 'ThemeModeRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i8.ThemeModePage();
    },
  );
}
