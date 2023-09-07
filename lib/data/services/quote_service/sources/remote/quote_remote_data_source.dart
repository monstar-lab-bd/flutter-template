import 'package:dio/dio.dart';
import 'package:flutter_template/data/services/response_objects/quote/quote_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'quote_remote_data_source.g.dart';

@RestApi()
@injectable
abstract class QuoteRemoteDataSource {
  @factoryMethod
  factory QuoteRemoteDataSource(Dio dio) = _QuoteRemoteDataSource;

  @GET('qotd')
  Future<QuoteResponse> getQuote();
}
