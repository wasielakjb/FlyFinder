import 'package:dio/dio.dart';
import 'package:flyfinder/core/http/interceptors/ignav_api_key_interceptor.dart';
import 'package:flyfinder/di.dart';

const IgnavHttpClient = 'IgnavHttpClient';

void setupInterceptors() {
  inject<Dio>(instanceName: IgnavHttpClient).interceptors.addAll([
    inject<LogInterceptor>(),
    inject<IgnavApiKeyInterceptor>(),
  ]);
}
