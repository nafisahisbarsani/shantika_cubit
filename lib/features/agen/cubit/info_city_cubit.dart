import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shantika_cubit/utility/extensions/dio_exception_extensions.dart';
import '../../../config/service_locator.dart';
import '../../../model/info_city_model.dart';
import '../../../repository/info_agen_repository.dart';
import '../../../utility/resource/data_state.dart';

part 'info_city_state.dart';

class InfoCityCubit extends Cubit<InfoCityState> {
  late InfoCityRepository _infoCityRepository;
  List<InfoCityModel> _allCities = [];

  InfoCityCubit() : super(InfoCityInitial());

  void init() {
    _infoCityRepository = InfoCityRepository(serviceLocator.get());
  }

  Future<void> getCities() async {
    emit(InfoCityStateLoading());

    final DataState<List<InfoCityModel>> dataState = await _infoCityRepository
        .infoCities();

    switch (dataState) {
      case DataStateSuccess<List<InfoCityModel>>():
        _allCities = dataState.data ?? [];

        if (_allCities.isEmpty) {
          emit(InfoCityStateEmpty());
        } else {
          // Create a NEW list instance
          emit(InfoCityStateData(cityList: List.from(_allCities)));
        }

      case DataStateError<List<InfoCityModel>>():
        emit(
          InfoCityStateError(
            message: dataState.exception?.parseMessage() ?? "Terjadi kesalahan",
          ),
        );
    }
  }

  void searchCity(String query) {
    // Don't search if we don't have cities loaded yet
    if (_allCities.isEmpty) {
      return;
    }

    final trimmedQuery = query.trim();

    // If query is empty, show all cities
    if (trimmedQuery.isEmpty) {
      // IMPORTANT: Create a NEW list instance
      emit(InfoCityStateData(cityList: List.from(_allCities)));
      return;
    }

    // Filter cities based on query
    final filtered = _allCities.where((city) {
      final cityName = (city.name ?? "").toLowerCase();
      final searchQuery = trimmedQuery.toLowerCase();
      return cityName.contains(searchQuery);
    }).toList();

    // Emit appropriate state based on filtered results
    if (filtered.isEmpty) {
      emit(InfoCityStateEmpty());
    } else {
      // IMPORTANT: filtered is already a new list from .toList()
      emit(InfoCityStateData(cityList: filtered));
    }
  }
}
