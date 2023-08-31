import 'package:freezed_annotation/freezed_annotation.dart';

part 'quote_response.freezed.dart';
part 'quote_response.g.dart';

@freezed
class QuoteResponse with _$QuoteResponse {
  const factory QuoteResponse({
    required DateTime qotdDate,
    required Quote quote,
  }) = _QuoteResponse;

  factory QuoteResponse.fromJson(Map<String, dynamic> json) =>
      _$QuoteResponseFromJson(json);
}

@freezed
class Quote with _$Quote {
  const factory Quote({
    required int id,
    required bool dialogue,
    required bool private,
    required List<String> tags,
    required String url,
    required int favoritesCount,
    required int upvotesCount,
    required int downvotesCount,
    required String author,
    required String authorPermalink,
    required String body,
  }) = _Quote;

  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);
}
