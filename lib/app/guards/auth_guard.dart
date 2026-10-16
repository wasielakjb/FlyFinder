import 'package:auto_route/auto_route.dart';
import 'package:flyfinder/app/router/app_router.gr.dart';
import 'package:flyfinder/features/auth/auth_repository_impl.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthGuard extends AutoRouteGuard {
  AuthGuard({required this.repository});

  final AuthRepository repository;

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    if (!repository.isAuthenticated) {
      await router.root.replaceAll([const AuthRoute()]);
      return;
    }
    resolver.next();
  }
}
