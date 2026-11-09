import 'package:auto_route/auto_route.dart';
import 'package:flyfinder/app/router/app_router.gr.dart';

abstract class TicketsRoutes {
  static List<AutoRoute> routes = [
    CustomRoute<void>(
      path: '/tickets',
      page: TicketsRoute.page,
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
  ];
}
