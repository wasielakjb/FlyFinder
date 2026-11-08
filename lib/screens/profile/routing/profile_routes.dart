import 'package:auto_route/auto_route.dart';
import 'package:flyfinder/app/router/app_router.gr.dart';
import 'package:flyfinder/features/payment_methods/ui/routing/payment_methods_routes.dart';

abstract class ProfileRoutes {
  static List<AutoRoute> routes = [
    AutoRoute(
      path: '/profile',
      page: ProfileRoute.page,
    ),
    AutoRoute(
      path: '/profile/theme-mode',
      page: ThemeModeRoute.page,
    ),
    ...PaymentMethodsRoutes.routes,
  ];
}
