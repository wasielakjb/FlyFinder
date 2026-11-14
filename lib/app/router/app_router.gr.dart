// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i14;
import 'package:flyfinder/features/flights/domain/request/flight_request.dart'
    as _i13;
import 'package:flyfinder/features/flights/ui/screens/list/view/flight_search_result_page.dart'
    as _i2;
import 'package:flyfinder/features/payment_methods/domain/model/payment_method_resource.dart'
    as _i15;
import 'package:flyfinder/features/payment_methods/ui/screens/form/view/payment_method_form_page.dart'
    as _i6;
import 'package:flyfinder/features/payment_methods/ui/screens/list/view/payment_methods_list_page.dart'
    as _i7;
import 'package:flyfinder/screens/auth/screens/login/view/login_page.dart'
    as _i5;
import 'package:flyfinder/screens/auth/screens/register/view/register_page.dart'
    as _i9;
import 'package:flyfinder/screens/auth/view/auth_page.dart' as _i1;
import 'package:flyfinder/screens/flights/view/flights_page.dart' as _i3;
import 'package:flyfinder/screens/home/view/home_page.dart' as _i4;
import 'package:flyfinder/screens/profile/screens/theme_mode_page.dart' as _i10;
import 'package:flyfinder/screens/profile/view/profile_page.dart' as _i8;
import 'package:flyfinder/screens/tickets/view/tickets_page.dart' as _i11;

/// generated route for
/// [_i1.AuthPage]
class AuthRoute extends _i12.PageRouteInfo<void> {
  const AuthRoute({List<_i12.PageRouteInfo>? children})
    : super(AuthRoute.name, initialChildren: children);

  static const String name = 'AuthRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthPage();
    },
  );
}

/// generated route for
/// [_i2.FlightSearchResultPage]
class FlightSearchResultRoute
    extends _i12.PageRouteInfo<FlightSearchResultRouteArgs> {
  FlightSearchResultRoute({
    required _i13.FlightRequest request,
    _i14.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
         FlightSearchResultRoute.name,
         args: FlightSearchResultRouteArgs(request: request, key: key),
         initialChildren: children,
       );

  static const String name = 'FlightSearchResultRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FlightSearchResultRouteArgs>();
      return _i2.FlightSearchResultPage(request: args.request, key: args.key);
    },
  );
}

class FlightSearchResultRouteArgs {
  const FlightSearchResultRouteArgs({required this.request, this.key});

  final _i13.FlightRequest request;

  final _i14.Key? key;

  @override
  String toString() {
    return 'FlightSearchResultRouteArgs{request: $request, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FlightSearchResultRouteArgs) return false;
    return request == other.request && key == other.key;
  }

  @override
  int get hashCode => request.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i3.FlightsPage]
class FlightsRoute extends _i12.PageRouteInfo<void> {
  const FlightsRoute({List<_i12.PageRouteInfo>? children})
    : super(FlightsRoute.name, initialChildren: children);

  static const String name = 'FlightsRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i3.FlightsPage();
    },
  );
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute({List<_i12.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomePage();
    },
  );
}

/// generated route for
/// [_i5.LoginPage]
class LoginRoute extends _i12.PageRouteInfo<void> {
  const LoginRoute({List<_i12.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return _i12.WrappedRoute(child: const _i5.LoginPage());
    },
  );
}

/// generated route for
/// [_i6.PaymentMethodFormPage]
class PaymentMethodFormRoute
    extends _i12.PageRouteInfo<PaymentMethodFormRouteArgs> {
  PaymentMethodFormRoute({
    _i15.PaymentMethodResource? resource,
    _i14.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
         PaymentMethodFormRoute.name,
         args: PaymentMethodFormRouteArgs(resource: resource, key: key),
         rawQueryParams: {'resource': resource},
         initialChildren: children,
       );

  static const String name = 'PaymentMethodFormRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final queryParams = data.queryParams;
      final args = data.argsAs<PaymentMethodFormRouteArgs>(
        orElse: () =>
            PaymentMethodFormRouteArgs(resource: queryParams.get('resource')),
      );
      return _i12.WrappedRoute(
        child: _i6.PaymentMethodFormPage(
          resource: args.resource,
          key: args.key,
        ),
      );
    },
  );
}

class PaymentMethodFormRouteArgs {
  const PaymentMethodFormRouteArgs({this.resource, this.key});

  final _i15.PaymentMethodResource? resource;

  final _i14.Key? key;

  @override
  String toString() {
    return 'PaymentMethodFormRouteArgs{resource: $resource, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PaymentMethodFormRouteArgs) return false;
    return resource == other.resource && key == other.key;
  }

  @override
  int get hashCode => resource.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i7.PaymentMethodsListPage]
class PaymentMethodsListRoute extends _i12.PageRouteInfo<void> {
  const PaymentMethodsListRoute({List<_i12.PageRouteInfo>? children})
    : super(PaymentMethodsListRoute.name, initialChildren: children);

  static const String name = 'PaymentMethodsListRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return _i12.WrappedRoute(child: const _i7.PaymentMethodsListPage());
    },
  );
}

/// generated route for
/// [_i8.ProfilePage]
class ProfileRoute extends _i12.PageRouteInfo<void> {
  const ProfileRoute({List<_i12.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i8.ProfilePage();
    },
  );
}

/// generated route for
/// [_i9.RegisterPage]
class RegisterRoute extends _i12.PageRouteInfo<void> {
  const RegisterRoute({List<_i12.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return _i12.WrappedRoute(child: const _i9.RegisterPage());
    },
  );
}

/// generated route for
/// [_i10.ThemeModePage]
class ThemeModeRoute extends _i12.PageRouteInfo<void> {
  const ThemeModeRoute({List<_i12.PageRouteInfo>? children})
    : super(ThemeModeRoute.name, initialChildren: children);

  static const String name = 'ThemeModeRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i10.ThemeModePage();
    },
  );
}

/// generated route for
/// [_i11.TicketsPage]
class TicketsRoute extends _i12.PageRouteInfo<void> {
  const TicketsRoute({List<_i12.PageRouteInfo>? children})
    : super(TicketsRoute.name, initialChildren: children);

  static const String name = 'TicketsRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i11.TicketsPage();
    },
  );
}
