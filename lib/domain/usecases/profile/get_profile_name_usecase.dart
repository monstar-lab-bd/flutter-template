import 'package:flutter_template/domain/common/use_case.dart';
import 'package:flutter_template/domain/services/profile_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProfileNameUseCase extends FutureOutputUseCase<String?> {
  final ProfileService _profileService;

  GetProfileNameUseCase(this._profileService);

  @override
  Future<String?> run() => _profileService.getProfileName();
}
