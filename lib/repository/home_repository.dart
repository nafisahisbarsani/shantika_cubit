import '../data/api/api_service.dart';
import '../model/home_model.dart';
import '../model/response/api_response.dart';
import '../utility/resource/data_state.dart';
import 'base/base_repository.dart';

class HomeRepository extends BaseRepository {
  final ApiService _apiService;

  HomeRepository(this._apiService);

  Future<DataState<HomeModel>> home() async {
    DataState<HomeModel> dataState = await getStateOf<HomeModel>(
      request: () => _apiService.home(),
    );

    return dataState;
  }
}
