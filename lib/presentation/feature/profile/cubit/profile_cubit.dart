import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/data/services/response_error.dart';
import 'package:flutter_template/domain/usecases/profile/get_profile_name_usecase.dart';
import 'package:flutter_template/presentation/common/base_status/base_status.dart';
import 'package:flutter_template/presentation/feature/profile/cubit/profile_state.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileNameUseCase _getProfileNameUseCase;

  ProfileCubit(this._getProfileNameUseCase) : super(ProfileState.initial());

  Future<void> load() async {
    if (state.status.isLoading) return;

    emit(state.copyWith(status: const BaseStatus.loading()));

    try {
      final result = await _getProfileNameUseCase.run();
      if (isClosed) {
        return;
      }
      emit(state.copyWith(
        status: const BaseStatus.success(),
        name: result ?? '',
      ));
    } catch (e) {
      if (isClosed) {
        return;
      }
      emit(state.copyWith(
        status: BaseStatus.failure(ResponseError.from(e)),
        name: '',
      ));
    }
  }
}
