import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shantika_cubit/utility/extensions/dio_exception_extensions.dart';

import '../../../config/service_locator.dart';
import '../../../model/response/api_response.dart';
import '../../../repository/notification_repository.dart';
import '../../../utility/resource/data_state.dart';
part 'read_notification_state.dart';

class ReadNotificationCubit extends Cubit<ReadNotificationState> {
  ReadNotificationCubit() : super(ReadNotificationInitial());

  late NotificationRepository _repository;

  init() {
    _repository = NotificationRepository(serviceLocator.get());
  }

  readNotif({required String id}) async {
    emit(ReadNotificationStateLoading());

    DataState<ApiResponse> dataState = await _repository.readNotification(
      id: id,
    );

    switch (dataState) {
      case DataStateSuccess<ApiResponse>():
        {
          emit(ReadNotificationStateSuccess());
        }
      case DataStateError<ApiResponse>():
        {
          emit(
            ReadNotificationStateError(
              message: dataState.exception?.parseMessage() ?? "",
            ),
          );
        }
    }
  }

  readAllNotif() async {
    emit(ReadAllNotificationStateLoading());

    DataState<ApiResponse> dataState = await _repository.readAllNotification();

    switch (dataState) {
      case DataStateSuccess<ApiResponse>():
        {
          emit(ReadAllNotificationStateSuccess());
        }
      case DataStateError<ApiResponse>():
        {
          emit(
            ReadAllNotificationStateError(
              message: dataState.exception?.parseMessage() ?? "",
            ),
          );
        }
    }
  }
}
