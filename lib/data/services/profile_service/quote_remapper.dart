import 'package:flutter_template/data/services/response_objects/quote/quote_response.dart';
import 'package:flutter_template/domain/entities/qoute/quote_entity.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class QuoteRemapper {
  QuoteEntity fromNetworkResponse(QuoteResponse response) {
    final quote = response.quote;
    final entity = QuoteEntity(
      author: quote.author,
      body: quote.body,
    );

    return entity;
  }
}
