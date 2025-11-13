import '../data/api/api_service.dart';
import '../model/agency_model.dart';
import '../model/city_model.dart';
import '../model/response/agency_response.dart';
import '../model/response/city_response.dart';
import '../utility/resource/data_state.dart';
import 'base/base_repository.dart';

class OrderTicketRepository extends BaseRepository {
  final ApiService _apiService;

  OrderTicketRepository(this._apiService);

  Future<DataState<List<CityModel>>> getCityDepartures() async {
    DataState<CityResponse> dataState = await getStateOf<CityResponse>(
      request: () => _apiService.getCityDepartures(),
    );

    if (dataState is DataStateSuccess) {
      return DataStateSuccess(dataState.data?.cities ?? []);
    } else {
      return DataStateError(dataState.exception!);
    }
  }

  Future<DataState<List<CityModel>>> getCityDestinations() async {
    DataState<CityResponse> dataState = await getStateOf<CityResponse>(
      request: () => _apiService.getCityDestinations(),
    );

    if (dataState is DataStateSuccess) {
      return DataStateSuccess(dataState.data?.cities ?? []);
    } else {
      return DataStateError(dataState.exception!);
    }
  }

  Future<DataState<List<AgencyModel>>> getAgenciesByCity(int cityId) async {
    DataState<AgencyResponse> dataState = await getStateOf<AgencyResponse>(
      request: () => _apiService.getAgenciesByCity(cityId),
    );

    if (dataState is DataStateSuccess) {
      return DataStateSuccess(dataState.data?.agenciesCity ?? []);
    } else {
      return DataStateError(dataState.exception!);
    }
  }
}
