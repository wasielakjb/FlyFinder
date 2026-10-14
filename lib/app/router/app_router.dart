import 'package:auto_route/auto_route.dart';
import 'package:flyfinder/app/guards/auth_guard.dart';
import 'package:flyfinder/screens/auth/routing/auth_routes.dart';
import 'package:flyfinder/screens/home/routing/home_routes.dart';
import 'package:injectable/injectable.dart';

@singleton
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter({required this.authGuard});

  final AuthGuard authGuard;

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  List<AutoRoute> _protectedRoutes(List<AutoRoute> routes) {
    return routes
        .map((route) => route.copyWith(guards: [...route.guards, authGuard]))
        .toList();
  }

  @override
  List<AutoRoute> get routes => [
    ...AuthRoutes.routes,
    ..._protectedRoutes(HomeRoutes.routes),
  ];
}
