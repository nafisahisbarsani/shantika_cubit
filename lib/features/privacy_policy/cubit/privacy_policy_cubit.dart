import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shantika_cubit/utility/extensions/dio_exception_extensions.dart';
import '../../../config/service_locator.dart';
import '../../../model/policy_model.dart';
import '../../../repository/app_settings_repository.dart';
import '../../../utility/resource/data_state.dart';

part 'privacy_policy_state.dart';

class PrivacyPolicyCubit extends Cubit<PrivacyPolicyState> {
  late AppSettingsRepository _AppSettingsRepository;
  PrivacyPolicyCubit() : super(PrivacyPolicyInitial());

  init() {
    _AppSettingsRepository = AppSettingsRepository(serviceLocator.get());
  }

  privacyPolicy() async {
    emit(PrivacyPolicyLoading());
    final DataState<PrivacyPolicyModel> dataState =
        await _AppSettingsRepository.privacyPolicy();
    switch (dataState) {
      case DataStateSuccess<PrivacyPolicyModel>():
        {
          emit(
            PrivacyPolicyStateData(
              privacyPolicyModel: dataState.data ?? PrivacyPolicyModel(),
            ),
          );
        }
      case DataStateError<PrivacyPolicyModel>():
        {
          emit(
            PrivacyPolicyError(
              message: dataState.exception?.parseMessage() ?? "",
            ),
          );
        }
    }
  }
}