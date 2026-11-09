import 'package:auto_route/auto_route.dart';
import 'package:flyfinder/app/router/app_router.gr.dart';
import 'package:flyfinder/features/payment_methods/ui/routing/payment_methods_routes.dart';

abstract class ProfileRoutes {
  static List<AutoRoute> routes = [
    CustomRoute<void>(
      path: '/profile',
      page: ProfileRoute.page,
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    AutoRoute(
      path: '/profile/theme-mode',
      page: ThemeModeRoute.page,
    ),
    ...PaymentMethodsRoutes.routes,
  ];
}
