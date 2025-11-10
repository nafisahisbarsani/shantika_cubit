import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shantika_cubit/utility/extensions/dio_exception_extensions.dart';
import '../../../../repository/notif_set_repository.dart';
import '../../../../utility/resource/data_state.dart';
import '../../../config/service_locator.dart';
import '../../../model/notif_set_model.dart';

part 'notification_set_state.dart';

class NotificationSetCubit extends Cubit<NotificationSetState> {
  late NotificationSettingRepository _repository;

  NotificationSetCubit() : super(NotificationSetInitial());

  void init() {
    _repository = NotificationSettingRepository(serviceLocator.get());
  }

  Future<void> fetchSetting() async {
    emit(NotificationSetLoading());
    final dataState = await _repository.fetchSetting();

    if (dataState is DataStateSuccess<NotificationSetModel>) {
      emit(NotificationSetSuccess(dataState.data ?? NotificationSetModel()));
    } else if (dataState is DataStateError<NotificationSetModel>) {
      emit(NotificationSetError(
        dataState.exception?.parseMessage() ??
            "Gagal memuat pengaturan notifikasi.",
      ));
    }
  }

  void toggle(String key, bool value) {
    if (state is! NotificationSetSuccess) return;

    final current = (state as NotificationSetSuccess).setting;

    final updated = NotificationSetModel(
      id: current.id,
      userId: current.userId,
      activity: key == 'activity' ? value : current.activity,
      feature: key == 'special' ? value : current.feature,
      remember: key == 'reminder' ? value : current.remember,
    );

    emit(NotificationSetSuccess(updated));
    updateSetting(updated);
  }

  Future<void> updateSetting(NotificationSetModel newSetting) async {
    final dataState = await _repository.updateSetting(newSetting);

    if (dataState is DataStateSuccess<NotificationSetModel>) {
      emit(NotificationSetSuccess(dataState.data ?? newSetting));
    } else if (dataState is DataStateError<NotificationSetModel>) {
      emit(NotificationSetError(
        dataState.exception?.parseMessage() ??
            "Gagal memperbarui pengaturan notifikasi.",
      ));
    }
  }
}
