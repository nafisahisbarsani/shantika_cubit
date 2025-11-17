import 'package:shantika_cubit/model/info_agen_model.dart';
import 'package:shantika_cubit/model/response/info_agen_response.dart';
import '../data/api/api_service.dart';
import '../model/info_city_model.dart';
import '../model/response/info_city_response.dart';
import '../utility/resource/data_state.dart';
import 'base/base_repository.dart';

class InfoCityRepository extends BaseRepository {
  final ApiService _apiService;

  InfoCityRepository(this._apiService);

  Future<DataState<List<InfoCityModel>>> infoCities() async {
    DataState<InfoCityResponse> dataState = await getStateOf<InfoCityResponse>(
      request: () => _apiService.getInfoCities(),
    );

    if (dataState is DataStateSuccess) {
      return DataStateSuccess(dataState.data?.cities ?? []);
    } else {
      return DataStateError(dataState.exception!);
    }
  }

  Future<DataState<List<InfoAgenModel>>> getInfoAgen(int cityId) async {
    DataState<InfoAgenResponse> dataState =
    await getStateOf<InfoAgenResponse>(
      request: () => _apiService.getInfoAgen(cityId: cityId),
    );

    if (dataState is DataStateSuccess) {
      return DataStateSuccess(dataState.data?.agencies ?? []);
    } else {
      return DataStateError(dataState.exception!);
    }
  }
}
