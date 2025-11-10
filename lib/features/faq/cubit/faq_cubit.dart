import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shantika_cubit/utility/extensions/dio_exception_extensions.dart';
import '../../../config/service_locator.dart';
import '../../../model/faq_model.dart';
import '../../../repository/app_settings_repository.dart';
import '../../../utility/resource/data_state.dart';

part 'faq_state.dart';

class FaqCubit extends Cubit<FaqState> {
  late AppSettingsRepository _AppSettingsRepository;
  late List<FaqModel> _faqList;
  FaqCubit() : super(FaqInitial());

  init() {
    _AppSettingsRepository = AppSettingsRepository(serviceLocator.get());
    _faqList = [];
  }

  getFaq() async {
    emit(FaqStateLoading());
    final DataState<List<FaqModel>> dataState = await _AppSettingsRepository.faq();
    switch (dataState) {
      case DataStateSuccess<List<FaqModel>>():
        {
          _faqList = dataState.data ?? [];

          if (_faqList.isEmpty) {
            emit(FaqStateEmpty());
          } else {
            emit(FaqStateData(faqList: _faqList));
          }
        }
      case DataStateError<List<FaqModel>>():
        {
          emit(FaqStateError(message: dataState.exception?.parseMessage() ?? ""));
        }
    }
  }
}
