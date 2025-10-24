import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:shantika_cubit/utility/extensions/dio_exception_extensions.dart';
import '../../../config/service_locator.dart';
import '../../../config/user_preference.dart';
import '../../../model/response/auth_response.dart';
import '../../../model/user_model.dart';
import '../../../repository/profile_repository.dart';
import '../../../utility/resource/data_state.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());

  late ProfileRepository _repository;
  late UserPreference _preference;

  init() {
    _preference = serviceLocator.get();
    _repository = ProfileRepository(serviceLocator.get());
  }

  updateProfile({
    required String name,
    required String gender,
    required String email,
    File? avatar,
    String? birth,
    String? birthPlace,
    String? phone,
    String? address,
  }) async {
    emit(UpdateProfileStateLoading());

    MultipartFile? multipart;

    if (avatar != null) {
      multipart = await MultipartFile.fromFile(
        avatar.path,
        filename: avatar.path.split('/').last,
      );
    }

    DataState<AuthResponse> dataState = await _repository.updateProfile(
      name: name,
      gender: gender,
      email: email,
      avatar: multipart != null ? [multipart] : null,
      birth: birth,
      birthPlace: birthPlace,
      phone: phone,
      address: address,
    );

    switch (dataState) {
      case DataStateSuccess<AuthResponse>():
        {
          final userData = dataState.data?.user ?? UserModel();
          await _preference.setUser(userData);
          emit(UpdateProfileStateSuccess(user: userData));
        }
      case DataStateError<AuthResponse>():
        {
          emit(
            UpdateProfileStateError(
              message: dataState.exception?.parseMessage() ?? "",
            ),
          );
        }
    }
  }
}
