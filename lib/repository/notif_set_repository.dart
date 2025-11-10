import '../data/api/api_service.dart';
import '../model/notif_set_model.dart';
import '../model/response/notification_set_response.dart';
import '../utility/resource/data_state.dart';
import 'base/base_repository.dart';

class NotificationSettingRepository extends BaseRepository {
  final ApiService _apiService;

  NotificationSettingRepository(this._apiService);

  /// Fetch notification setting
  Future<DataState<NotificationSetModel>> fetchSetting() async {
    final DataState<NotifSetResponse> dataState =
    await getStateOf<NotifSetResponse>(
      request: () => _apiService.fetchSetting(),
    );

    if (dataState is DataStateSuccess) {
      return DataStateSuccess(dataState.data?.setting ?? NotificationSetModel());
    } else {
      return DataStateError(dataState.exception!);
    }
  }

  /// Update notification setting
  Future<DataState<NotificationSetModel>> updateSetting(
      NotificationSetModel model) async {
    final DataState<NotifSetResponse> dataState =
    await getStateOf<NotifSetResponse>(
      request: () => _apiService.updateSetting(body: model.toJson()),
    );

    if (dataState is DataStateSuccess) {
      return DataStateSuccess(dataState.data?.setting ?? NotificationSetModel());
    } else {
      return DataStateError(dataState.exception!);
    }
  }
}
