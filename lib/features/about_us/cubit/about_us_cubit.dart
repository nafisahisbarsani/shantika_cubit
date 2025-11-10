import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../config/service_locator.dart';
import '../../../model/about_us_model.dart';
import '../../../repository/app_settings_repository.dart';
import '../../../utility/resource/data_state.dart';

part 'about_us_state.dart';

class AboutUsCubit extends Cubit<AboutUsState> {
  late AppSettingsRepository _appSettingsRepository;
  AboutUsModel? _about;

  AboutUsCubit() : super(AboutUsInitial());

  void init() {
    _appSettingsRepository = AppSettingsRepository(serviceLocator.get());
  }

  Future<void> fetchAboutUs() async {
    emit(AboutUsLoading());
    final DataState<AboutUsModel> dataState = await _appSettingsRepository.aboutUs();

    switch (dataState) {
      case DataStateSuccess<AboutUsModel>():
        _about = dataState.data;
        if (_about == null) {
          emit(AboutUsEmpty());
        } else {
          emit(AboutUsLoaded(about: _about!));
        }
      case DataStateError<AboutUsModel>():
        emit(AboutUsError(message: dataState.exception?.toString() ?? ""));
    }
  }
}
