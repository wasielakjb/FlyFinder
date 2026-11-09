import 'package:auto_route/auto_route.dart';
import 'package:flyfinder/app/router/app_router.gr.dart';

abstract class FlightsRoutes {
  static List<AutoRoute> routes = [
    CustomRoute<void>(
      path: '/flights',
      page: FlightsRoute.page,
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
  ];
}
