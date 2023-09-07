import 'package:freezed_annotation/freezed_annotation.dart';

part 'quote_response.freezed.dart';
part 'quote_response.g.dart';

@freezed
class QuoteResponse with _$QuoteResponse {
  const factory QuoteResponse({
    String? qotdDate,
    Quote? quote,
  }) = _QuoteResponse;

  factory QuoteResponse.fromJson(Map<String, dynamic> json) =>
      _$QuoteResponseFromJson(json);
}

@freezed
class Quote with _$Quote {
  const factory Quote({
    int? id,
    bool? dialogue,
    bool? private,
    List<String>? tags,
    String? url,
    int? favoritesCount,
    int? upvotesCount,
    int? downvotesCount,
    String? author,
    String? authorPermalink,
    String? body,
  }) = _Quote;

  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);
}
