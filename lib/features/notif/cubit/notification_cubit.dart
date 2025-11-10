import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shantika_cubit/utility/extensions/dio_exception_extensions.dart';
import '../../../config/service_locator.dart';
import '../../../model/notification_model.dart';
import '../../../model/response/api_response.dart';
import '../../../model/response/notification_response.dart';
import '../../../repository/notification_repository.dart';
import '../../../utility/resource/data_state.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  late NotificationRepository _repository;
  List<NotificationModel> _notifications = [];
  int _currentPage = 1;
  bool _endPage = false;

  init() {
    _repository = NotificationRepository(serviceLocator.get());
    _notifications = [];
    _currentPage = 1;
    _endPage = false;
  }

  setPage() {
    _currentPage = 1;
    notifications();
  }

  notifications() async {
    emit(NotificationStateLoading());

    DataState<ApiResponse<NotificationResponse>> dataState = await _repository
        .notifications(page: _currentPage);

    switch (dataState) {
      case DataStateSuccess<ApiResponse<NotificationResponse>>():
        {
          _notifications = dataState.data?.data?.notifications ?? [];

          emit(NotificationStateSuccess(notifications: _notifications));
        }
      case DataStateError<ApiResponse<NotificationResponse>>():
        {
          emit(
            NotificationStateError(
              message: dataState.exception?.parseMessage() ?? "",
            ),
          );
        }
    }
  }

  nextPage() async {
    if (!_endPage) {
      emit(NotificationStateLoadingNextPage());
      final DataState<ApiResponse<NotificationResponse>> dataState =
          await _repository.notifications(page: _currentPage + 1);
      switch (dataState) {
        case DataStateSuccess<ApiResponse<NotificationResponse>>():
          {
            if (dataState.data?.data?.notifications?.isEmpty == true) {
              _endPage = true;
            } else {
              _currentPage++;
              _notifications.addAll(dataState.data?.data?.notifications ?? []);
            }

            emit(NotificationStateSuccess(notifications: _notifications));
          }
        case DataStateError<ApiResponse<NotificationResponse>>():
          {
            emit(
              NotificationStateError(
                message: dataState.exception?.parseMessage() ?? "",
              ),
            );
          }
      }
    }
  }
}
