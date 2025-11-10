import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shantika_cubit/utility/extensions/dio_exception_extensions.dart';
import '../../../config/service_locator.dart';
import '../../../config/user_preference.dart';
import '../../../model/response/api_response.dart';
import '../../../model/user_model.dart';
import '../../../repository/profile_repository.dart';
import '../../../utility/resource/data_state.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  late ProfileRepository _repository;
  late UserPreference _preference;
  UserModel? _user;

  init() {
    _preference = serviceLocator.get<UserPreference>();
    _repository = ProfileRepository(serviceLocator.get());
    _user = null;
  }

  profile() async {
    emit(ProfileStateLoading());

    final savedUser = _preference.getUser();

    if (savedUser != null) {
      _user = savedUser;
      emit(ProfileStateSuccess(user: savedUser));
      return;
    }
  }
}
