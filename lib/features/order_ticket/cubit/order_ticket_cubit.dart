import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shantika_cubit/utility/extensions/dio_exception_extensions.dart';
import '../../../config/service_locator.dart';
import '../../../model/agency_model.dart';
import '../../../model/city_model.dart';
import '../../../model/fleet_model.dart';
import '../../../model/time_classification_model.dart';
import '../../../repository/order_ticket_repository.dart';
import '../../../utility/resource/data_state.dart';

part 'order_ticket_state.dart';

class OrderTicketCubit extends Cubit<OrderTicketState> {
  final OrderTicketRepository _orderTicketRepository = OrderTicketRepository(
    serviceLocator.get(),
  );

  OrderTicketCubit() : super(OrderTicketInitial());

  Future<void> fetchCityDepartures() async {
    emit(OrderTicketLoading());

    final DataState<List<CityModel>> dataState = await _orderTicketRepository
        .getCityDepartures();

    switch (dataState) {
      case DataStateSuccess<List<CityModel>>():
        final cities = dataState.data ?? [];
        if (cities.isEmpty) {
          emit(OrderTicketEmpty());
        } else {
          emit(OrderTicketCityData(cities: cities));
        }
      case DataStateError<List<CityModel>>():
        emit(
          OrderTicketError(
            message: dataState.exception?.parseMessage() ?? "Terjadi kesalahan",
          ),
        );
    }
  }

  Future<void> fetchCityDestinations() async {
    emit(OrderTicketLoading());

    final DataState<List<CityModel>> dataState = await _orderTicketRepository
        .getCityDestinations();

    switch (dataState) {
      case DataStateSuccess<List<CityModel>>():
        final cities = dataState.data ?? [];
        if (cities.isEmpty) {
          emit(OrderTicketEmpty());
        } else {
          emit(OrderTicketCityData(cities: cities));
        }
      case DataStateError<List<CityModel>>():
        emit(
          OrderTicketError(
            message: dataState.exception?.parseMessage() ?? "Terjadi kesalahan",
          ),
        );
    }
  }

  Future<void> fetchAgenciesByCity(int cityId) async {
    emit(OrderTicketLoading());

    final DataState<List<AgencyModel>> dataState = await _orderTicketRepository
        .getAgenciesByCity(cityId);

    switch (dataState) {
      case DataStateSuccess<List<AgencyModel>>():
        final agencies = dataState.data ?? [];
        if (agencies.isEmpty) {
          emit(OrderTicketEmpty());
        } else {
          emit(OrderTicketAgencyData(agencies: agencies));
        }
      case DataStateError<List<AgencyModel>>():
        emit(
          OrderTicketError(
            message: dataState.exception?.parseMessage() ?? "Terjadi kesalahan",
          ),
        );
    }
  }

  Future<void> fetchTimeClassifications() async {
    emit(OrderTicketLoading());

    final DataState<List<TimeClassificationModel>> dataState =
        await _orderTicketRepository.getTimeClassification();

    switch (dataState) {
      case DataStateSuccess<List<TimeClassificationModel>>():
        final timeClassifications = dataState.data ?? [];
        if (timeClassifications.isEmpty) {
          emit(OrderTicketEmpty());
        } else {
          emit(
            OrderTicketTimeClassificationData(
              timeClassifications: timeClassifications,
            ),
          );
        }
      case DataStateError<List<TimeClassificationModel>>():
        emit(
          OrderTicketError(
            message: dataState.exception?.parseMessage() ?? "Terjadi kesalahan",
          ),
        );
    }
  }

  Future<void> fetchFleetClasses() async {
    emit(OrderTicketLoading());

    final DataState<List<FleetModel>> dataState = await _orderTicketRepository
        .getFleetClasses();

    switch (dataState) {
      case DataStateSuccess<List<FleetModel>>():
        final fleets = dataState.data ?? [];
        if (fleets.isEmpty) {
          emit(OrderTicketEmpty());
        } else {
          emit(OrderTicketFleetData(fleetClasses: fleets));
        }
      case DataStateError<List<FleetModel>>():
        emit(
          OrderTicketError(
            message: dataState.exception?.parseMessage() ?? "Terjadi kesalahan",
          ),
        );
    }
  }
}
