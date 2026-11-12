import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class IgnavApiKeyInterceptor extends QueuedInterceptor {
  static const apiKeyHeader = 'X-Api-Key';

  String get _apiKey => 'ignav_I-5UmYolabm0mgW67X5KTLr8_cXXnjBh';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_apiKey.isEmpty) {
      return handler.reject(
        DioException(
          requestOptions: options,
          message: 'Ignav API key is missing.',
        ),
      );
    }

    options.headers[apiKeyHeader] = _apiKey;
    handler.next(options);
  }
}
