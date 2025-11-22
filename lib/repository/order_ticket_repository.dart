import 'package:shantika_cubit/model/available_routes_model.dart';

import '../data/api/api_service.dart';
import '../model/agency_by_city_model.dart';
import '../model/agency_model.dart';
import '../model/city_model.dart';
import '../model/fleet_model.dart';
import '../model/response/agency_by_city_response.dart';
import '../model/response/agency_response.dart';
import '../model/response/available_routes_response.dart';
import '../model/response/city_response.dart';
import '../model/response/fleet_response.dart';
import '../model/response/time_classification_response.dart';
import '../model/time_classification_model.dart';
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

  Future<DataState<List<AgencyModel>>> getAgenciesWithCity(int cityId) async {
    DataState<AgencyResponse> dataState = await getStateOf<AgencyResponse>(
      request: () => _apiService.getAgenciesWithCity(cityId),
    );

    if (dataState is DataStateSuccess) {
      return DataStateSuccess(dataState.data?.agenciesCity ?? []);
    } else {
      return DataStateError(dataState.exception!);
    }
  }

  Future<DataState<List<AgencyByCityModel>>> getAgencyByCity(int cityId) async {
    DataState<AgencyByCityResponse> dataState =
        await getStateOf<AgencyByCityResponse>(
          request: () => _apiService.getAgencyByCity(cityId),
        );

    if (dataState is DataStateSuccess) {
      return DataStateSuccess(dataState.data?.agencies ?? []);
    } else {
      return DataStateError(dataState.exception!);
    }
  }

  Future<DataState<List<TimeClassificationModel>>>
  getTimeClassification() async {
    DataState<TimeClassificationResponse> dataState =
        await getStateOf<TimeClassificationResponse>(
          request: () => _apiService.getTimeClassification(),
        );

    if (dataState is DataStateSuccess) {
      return DataStateSuccess(dataState.data?.time ?? []);
    } else {
      return DataStateError(dataState.exception!);
    }
  }

  Future<DataState<List<FleetModel>>> getAvailableFleets({
    required int agencyId,
    required int timeClassificationId,
    required String date,
    required int agencyDepartureId,
  }) async {
    DataState<FleetResponse> dataState = await getStateOf<FleetResponse>(
      request: () => _apiService.getAvailableFleets(
        agencyId: agencyId,
        timeClassificationId: timeClassificationId,
        date: date,
        agencyDepartureId: agencyDepartureId,
      ),
    );

    if (dataState is DataStateSuccess) {
      return DataStateSuccess(dataState.data?.fleetClasses ?? []);
    } else {
      return DataStateError(dataState.exception!);
    }
  }

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

  Future<DataState<List<AvailableRoutesModel>>> getAvailableRoutes({
    required int fleetClassId,
    required int agencyDepartureId,
    required int agencyArrivedId,
    required int timeClassificationId,
    required String date, // format: yyyy-MM-dd
  }) async {
    DataState<AvailableRoutesResponse> dataState =
        await getStateOf<AvailableRoutesResponse>(
          request: () => _apiService.getAvailableRoutes(
            fleetClassId: fleetClassId,
            agencyDepartureId: agencyDepartureId,
            agencyArrivedId: agencyArrivedId,
            timeClassificationId: timeClassificationId,
            date: date,
          ),
        );

    if (dataState is DataStateSuccess) {
      return DataStateSuccess(dataState.data?.routes ?? []);
    } else {
      return DataStateError(dataState.exception!);
    }
  }
}
