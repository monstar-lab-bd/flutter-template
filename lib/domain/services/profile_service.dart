import 'package:flutter_template/domain/entities/qoute/quote_entity.dart';

abstract class QuoteService {
  Future<QuoteEntity> getQuote();
}
