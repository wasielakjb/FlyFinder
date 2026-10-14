import 'package:auto_route/auto_route.dart';
import 'package:flyfinder/app/router/app_router.gr.dart';

abstract class HomeRoutes {
  static List<AutoRoute> routes = [
    AutoRoute(
      path: '/home',
      page: HomeRoute.page,
      initial: true,
    ),
  ];
}
