import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:code_test_flutter/src/app/core/network/client/unsplash_client.dart';

const String _injectKeyHeader = "header";
const String _injectKeyLogger = "logger";

@module
abstract class NetworkModule {
  @Named(_injectKeyLogger)
  @singleton
  Interceptor get loggingInterceptor => LogInterceptor(
        request: true,
        requestBody: true,
        responseHeader: true,
        requestHeader: true,
        responseBody: true,
        error: true,
      );

  @Named(_injectKeyHeader)
  @singleton
  Interceptor get headerInterceptor => InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          // Add request mods here or headers
          return handler.next(options);
        },
      );

  @singleton
  Dio dio(
    @Named(_injectKeyLogger) Interceptor loggingInterceptor,
    @Named(_injectKeyHeader) Interceptor headerInterceptor,
  ) {
    final baseOptions = BaseOptions(
      connectTimeout: Duration(milliseconds: 50000),
      receiveTimeout: Duration(milliseconds: 30000),
    );
    final dio = Dio(baseOptions);
    dio.interceptors.add(headerInterceptor);
    if (!kReleaseMode) {
      dio.interceptors.add(loggingInterceptor);
    }
    return dio;
  }

  @factoryMethod
  UnsplashClient unsplashClient(Dio dio) => UnsplashClient(dio);
}
