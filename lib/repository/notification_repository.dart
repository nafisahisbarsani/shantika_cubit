import '../data/api/api_service.dart';
import '../model/response/api_response.dart';
import '../model/response/notification_response.dart';
import '../utility/resource/data_state.dart';
import 'base/base_repository.dart';

class NotificationRepository extends BaseRepository {
  final ApiService _apiService;

  NotificationRepository(this._apiService);

  Future<DataState<ApiResponse<NotificationResponse>>> notifications({required int page}) async {
    DataState<ApiResponse<NotificationResponse>> dataStateAuthResponse =
        await getStateOf<ApiResponse<NotificationResponse>>(
      request: () => _apiService.notifications(page: page),
    );

    if (dataStateAuthResponse is DataStateSuccess) {
      return DataStateSuccess(dataStateAuthResponse.data!);
    } else {
      return DataStateError(dataStateAuthResponse.exception!);
    }
  }

  Future<DataState<ApiResponse>> readNotification({required String id}) async {
    DataState<ApiResponse> dataStateAuthResponse =
        await getStateOf<ApiResponse>(request: () => _apiService.readNotification(id: id));

    if (dataStateAuthResponse is DataStateSuccess) {
      return DataStateSuccess(dataStateAuthResponse.data!);
    } else {
      return DataStateError(dataStateAuthResponse.exception!);
    }
  }

  Future<DataState<ApiResponse>> readAllNotification() async {
    DataState<ApiResponse> dataStateAuthResponse = await getStateOf<ApiResponse>(
      request: () => _apiService.readAllNotification(),
    );

    if (dataStateAuthResponse is DataStateSuccess) {
      return DataStateSuccess(dataStateAuthResponse.data!);
    } else {
      return DataStateError(dataStateAuthResponse.exception!);
    }
  }
}
