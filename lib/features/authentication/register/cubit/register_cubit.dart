import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shantika_cubit/utility/extensions/dio_exception_extensions.dart';
import '../../../../config/service_locator.dart';
import '../../../../config/user_preference.dart';
import '../../../../model/user_model.dart';
import '../../../../repository/auth_repository.dart';
import '../../../../utility/resource/data_state.dart';
import '../../../../model/response/auth_response.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  late AuthRepository _repository;
  late UserPreference _userPreference;
  String? _token;
  UserModel? _user;

  init() {
    _repository = AuthRepository(serviceLocator.get());
    _userPreference = serviceLocator.get();
    _token = null;
    _user = null;
  }

  register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    String? firebaseUid,
    String? gender,
    String? phone,
    String? birthDate,
    String? birthPlace,
    String? uuid,
  }) async {
    emit(RegisterStateLoading());

    DataState<AuthResponse> dataState = await _repository.register(
      name: name,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      firebaseUid: firebaseUid,
      gender: gender,
      phone: phone,
      birthDate: birthDate,
      birthPlace: birthPlace,
      uuid: uuid,
    );

    switch (dataState) {
      case DataStateSuccess<AuthResponse>():
        {
          _token = dataState.data?.token;
          _user = dataState.data?.user;

          _userPreference.setToken(_token ?? "");
          _userPreference.setUser(_user ?? UserModel());

          emit(RegisterStateSuccess());
        }
      case DataStateError<AuthResponse>():
        {
          emit(
            RegisterStateError(
              message: dataState.exception?.parseMessage() ?? "",
            ),
          );
        }
    }
  }
}