// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:firebase_core/firebase_core.dart' as _i982;
import 'package:flyfinder/app/cubit/app_theme_cubit.dart' as _i849;
import 'package:flyfinder/app/guards/auth_guard.dart' as _i308;
import 'package:flyfinder/app/router/app_router.dart' as _i246;
import 'package:flyfinder/core/di/app_module.dart' as _i418;
import 'package:flyfinder/features/auth/auth_repository_impl.dart' as _i1071;
import 'package:flyfinder/features/payment_methods/data/repository/payment_methods_repository_impl.dart'
    as _i321;
import 'package:flyfinder/features/payment_methods/domain/repository/payment_methods_repository.dart'
    as _i102;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.singleton<_i849.AppThemeCubit>(() => _i849.AppThemeCubit());
    await gh.singletonAsync<_i982.FirebaseApp>(
      () => appModule.getFirebase(),
      preResolve: true,
    );
    gh.singleton<_i1071.AuthRepository>(() => _i1071.AuthRepository());
    gh.lazySingleton<_i59.FirebaseAuth>(() => appModule.firebaseAuth);
    gh.lazySingleton<_i974.FirebaseFirestore>(() => appModule.firestore);
    gh.singleton<_i102.PaymentMethodsRepository>(
      () => _i321.PaymentMethodsRepositoryImpl(
        gh<_i974.FirebaseFirestore>(),
        gh<_i1071.AuthRepository>(),
      ),
    );
    gh.singleton<_i308.AuthGuard>(
      () => _i308.AuthGuard(repository: gh<_i1071.AuthRepository>()),
    );
    gh.singleton<_i246.AppRouter>(
      () => _i246.AppRouter(authGuard: gh<_i308.AuthGuard>()),
    );
    return this;
  }
}

class _$AppModule extends _i418.AppModule {}
