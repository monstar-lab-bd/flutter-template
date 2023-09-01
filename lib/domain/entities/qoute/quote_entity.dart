import 'package:freezed_annotation/freezed_annotation.dart';

part 'quote_entity.freezed.dart';
part 'quote_entity.g.dart';

@freezed
class QuoteEntity with _$QuoteEntity {
  const factory QuoteEntity({
    String? author,
    String? body,
  }) = _QuoteEntity;

  factory QuoteEntity.fromJson(Map<String, dynamic> json) =>
      _$QuoteEntityFromJson(json);
}
