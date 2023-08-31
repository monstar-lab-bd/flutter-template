import 'package:flutter_template/data/services/profile_service/quote_remapper.dart';
import 'package:flutter_template/data/services/profile_service/sources/remote/profile_remote_data_source.dart';
import 'package:flutter_template/domain/entities/qoute/quote_entity.dart';
import 'package:flutter_template/domain/services/profile_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProfileService)
class ProfileServiceImpl extends ProfileService {
  ProfileServiceImpl(this._profileRemoteDataSource, this._quoteRemapper);

  final ProfileRemoteDataSource _profileRemoteDataSource;
  final QuoteRemapper _quoteRemapper;

  @override
  Future<String?> getProfileName() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return 'Michael Laudrup';
  }

  @override
  Future<QuoteEntity> getQuote() async {
    final response = await _profileRemoteDataSource.getQuote();

    final entity = _quoteRemapper.fromNetworkResponse(response);

    return entity;
  }
}
