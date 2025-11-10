import '../data/api/api_service.dart';
import '../model/chat_model.dart';
import '../model/response/api_response.dart';
import '../utility/resource/data_state.dart';
import 'base/base_repository.dart';

class ChatRepository extends BaseRepository {
  final ApiService _apiService;

  ChatRepository(this._apiService);

  Future<DataState<List<ChatModel>>> fetchChats() async {
    final DataState<ApiResponse<List<ChatModel>>> dataState =
    await getStateOf<ApiResponse<List<ChatModel>>>(
      request: () => _apiService.fetchChats(),
    );

    if (dataState is DataStateSuccess) {
      return DataStateSuccess(dataState.data?.data ?? []);
    } else {
      return DataStateError(dataState.exception!);
    }
  }
}
