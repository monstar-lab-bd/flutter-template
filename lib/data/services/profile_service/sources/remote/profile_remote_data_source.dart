import 'package:dio/dio.dart';
import 'package:flutter_template/data/services/response_objects/quote/quote_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_remote_data_source.g.dart';

@RestApi()
@injectable
abstract class ProfileRemoteDataSource {
  @factoryMethod
  factory ProfileRemoteDataSource(@Named('ApiDio') Dio dio, {String? baseUrl}) =
      _ProfileRemoteDataSource;

  @GET('qotd')
  Future<QuoteResponse> getQuote();
}
