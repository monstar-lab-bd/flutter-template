import 'package:flutter_template/data/services/quote_service/quote_remapper.dart';
import 'package:flutter_template/data/services/quote_service/sources/remote/quote_remote_data_source.dart';
import 'package:flutter_template/domain/entities/qoute/quote_entity.dart';
import 'package:flutter_template/domain/services/profile_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: QuoteService)
class QuoteServiceImpl extends QuoteService {
  QuoteServiceImpl(
    this._quoteRemoteDataSource,
    this._quoteRemapper,
  );

  final QuoteRemoteDataSource _quoteRemoteDataSource;
  final QuoteRemapper _quoteRemapper;

  @override
  Future<QuoteEntity> getQuote() async {
    final response = await _quoteRemoteDataSource.getQuote();

    final entity = _quoteRemapper.fromNetworkResponse(response);

    return entity;
  }
}
