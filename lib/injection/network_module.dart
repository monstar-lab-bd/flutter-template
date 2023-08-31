import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @Named('ApiDio')
  Dio get dio => Dio(BaseOptions(baseUrl: 'https://favqs.com/api/'));
}
