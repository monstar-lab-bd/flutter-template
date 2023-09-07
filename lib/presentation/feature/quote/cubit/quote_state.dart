import 'package:flutter_template/domain/entities/qoute/quote_entity.dart';
import 'package:flutter_template/presentation/common/base_status/base_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quote_state.freezed.dart';

@freezed
class QuoteState with _$QuoteState {
  const QuoteState._();

  factory QuoteState({
    required BaseStatus status,
    QuoteEntity? quoteEntity,
  }) = _QuoteState;
}
