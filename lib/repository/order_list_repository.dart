import '../data/api/api_service.dart';
import '../model/response/order_list_response.dart';
import '../utility/resource/data_state.dart';
import 'base/base_repository.dart';

class OrderListRepository extends BaseRepository {
  final ApiService _apiService;

  OrderListRepository(this._apiService);

  Future<DataState<OrderListResponse>> getOrderHistory({
    required Map<String, dynamic> body,
  }) async {
    final DataState<OrderListResponse> dataState =
        await getStateOf<OrderListResponse>(
          request: () => _apiService.getOrderHistory(body),
        );

    return dataState;
  }
}
