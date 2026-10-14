import 'package:auto_route/auto_route.dart';
import 'package:flyfinder/app/router/app_router.gr.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthGuard extends AutoRouteGuard {
  bool get isAuthenticated => false;

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    if (!isAuthenticated) {
      await router.root.replaceAll([const AuthRoute()]);
      return;
    }
    resolver.next();
  }
}
