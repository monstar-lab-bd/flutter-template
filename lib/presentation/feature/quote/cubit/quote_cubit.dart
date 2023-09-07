import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/data/services/response_error.dart';
import 'package:flutter_template/domain/usecases/profile/get_quote_usecase.dart';
import 'package:flutter_template/presentation/common/base_status/base_status.dart';
import 'package:flutter_template/presentation/feature/quote/cubit/quote_state.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class QuoteCubit extends Cubit<QuoteState> {
  final GetQuoteUseCase _getQuoteUseCase;

  QuoteCubit(
    this._getQuoteUseCase,
  ) : super(
          QuoteState(status: const BaseStatus.initial()),
        );

  Future<void> getQuote() async {
    if (state.status.isLoading) return;

    emit(state.copyWith(status: const BaseStatus.loading()));

    try {
      final result = await _getQuoteUseCase.run();

      if (!isClosed) {
        emit(
          state.copyWith(
            status: const BaseStatus.success(),
            quoteEntity: result,
          ),
        );
      }
    } catch (e) {
      if (isClosed) {
        return;
      }

      emit(
        state.copyWith(
          status: BaseStatus.failure(ResponseError.from(e)),
        ),
      );
    }
  }
}
