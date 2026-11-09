import 'package:auto_route/auto_route.dart';
import 'package:flyfinder/app/router/app_router.gr.dart';

abstract class PaymentMethodsRoutes {
  static List<AutoRoute> get routes => [
    AutoRoute(
      path: '/payment-methods',
      page: PaymentMethodsListRoute.page,
    ),
    AutoRoute(
      path: '/payment-methods-form',
      page: PaymentMethodFormRoute.page,
    ),
  ];
}
