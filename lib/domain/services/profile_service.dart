import 'package:flutter_template/domain/entities/qoute/quote_entity.dart';

abstract class ProfileService {
  Future<String?> getProfileName();
  Future<QuoteEntity> getQuote();
}
