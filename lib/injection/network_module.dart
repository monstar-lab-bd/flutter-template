import 'package:dio/dio.dart';
import 'package:flutter_template/presentation/app_flavor.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Dio _createBaseDio(AppFlavor flavor) {
  final dio = Dio()
    ..httpClientAdapter = HttpClientAdapter()
    ..options.baseUrl = flavor.baseUrl;

  return dio;
}

@module
abstract class NetworkModule {
  @singleton
  Dio getDio(AppFlavor flavor) {
    final dio = _createBaseDio(flavor)
      ..interceptors.addAll(
        [
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            compact: true,
            maxWidth: 90,
          ),
        ],
      );

    return dio;
  }
}
