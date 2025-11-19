import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shantika_cubit/utility/extensions/dio_exception_extensions.dart';
import '../../../config/service_locator.dart';
import '../../../model/social_media_model.dart';
import '../../../repository/social_media_repository.dart';
import '../../../utility/resource/data_state.dart';

part 'social_media_state.dart';

class SocialMediaCubit extends Cubit<SocialMediaState> {
  late SocialMediaRepository _repository;

  SocialMediaCubit() : super(SocialMediaInitial());

  init() {
    _repository = SocialMediaRepository(serviceLocator.get());
  }

  fetchSocialMedia() async {
    emit(SocialMediaLoading());
    final DataState<List<SocialMediaModel>> dataState = await _repository
        .fetchSocialMedia();

    switch (dataState) {
      case DataStateSuccess<List<SocialMediaModel>>():
        {
          final items = dataState.data ?? [];
          if (items.isEmpty) {
            emit(SocialMediaEmpty());
          } else {
            emit(SocialMediaStateData(items: items));
          }
        }
      case DataStateError<List<SocialMediaModel>>():
        {
          emit(
            SocialMediaError(
              message: dataState.exception?.parseMessage() ?? "",
            ),
          );
        }
    }
  }
}
