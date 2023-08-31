import 'package:flutter_template/domain/common/use_case.dart';
import 'package:flutter_template/domain/entities/qoute/quote_entity.dart';
import 'package:flutter_template/domain/services/profile_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetQuoteUseCase extends FutureOutputUseCase<QuoteEntity> {
  final ProfileService _profileService;

  GetQuoteUseCase(this._profileService);

  @override
  Future<QuoteEntity> run() async => _profileService.getQuote();
}
