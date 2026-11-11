import 'package:dio/dio.dart';
import 'package:flyfinder/core/http/di/di.dart';
import 'package:injectable/injectable.dart';

@module
abstract class HttpModule {
  final jsonHeaders = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };

  @singleton
  LogInterceptor get logInterceptor => LogInterceptor(
    requestHeader: false,
    responseHeader: false,
  );

  @Named(IgnavHttpClient)
  @singleton
  Dio get ignavHttpClient => Dio(
    BaseOptions(
      baseUrl: 'https://ignav.com/api',
      headers: jsonHeaders,
    ),
  );
}
