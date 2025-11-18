import '../data/api/api_service.dart';
import '../model/fleet_model.dart';
import '../model/response/fleet_response.dart';
import '../utility/resource/data_state.dart';
import 'base/base_repository.dart';

class FleetClassRepository extends BaseRepository {
  final ApiService _apiService;

  FleetClassRepository(this._apiService);

  Future<DataState<List<FleetModel>>> getFleetClasses() async {
    DataState<FleetResponse> dataState = await getStateOf<FleetResponse>(
      request: () => _apiService.getFleet(),
    );

    if (dataState is DataStateSuccess) {
      return DataStateSuccess(dataState.data?.fleetClasses ?? []);
    } else {
      return DataStateError(dataState.exception!);
    }
  }
}
