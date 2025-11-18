import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../model/fleet_model.dart';
import '../../../repository/fleet_class-repository.dart';
import '../../../config/service_locator.dart';
import '../../../utility/resource/data_state.dart';
import '../../../utility/extensions/dio_exception_extensions.dart';

part 'fleet_class_state.dart';

class FleetClassCubit extends Cubit<FleetClassState> {
  final FleetClassRepository _repository =
  FleetClassRepository(serviceLocator.get());

  List<FleetModel> _allFleets = [];

  FleetClassCubit() : super(FleetClassInitial());

  void init() {
    emit(FleetClassInitial());
  }

  Future<void> loadFleetClasses() async {
    emit(FleetClassLoading());

    final DataState<List<FleetModel>> dataState =
    await _repository.getFleetClasses();

    switch (dataState) {
      case DataStateSuccess<List<FleetModel>>():
        _allFleets = dataState.data ?? [];

        if (_allFleets.isEmpty) {
          emit(FleetClassEmpty());
        } else {
          emit(FleetClassData(list: _allFleets));
        }
        break;

      case DataStateError<List<FleetModel>>():
        emit(FleetClassError(
          message:
          dataState.exception?.parseMessage() ?? "Terjadi kesalahan",
        ));
        break;
    }
  }

  void searchFleet(String query) {
    if (query.isEmpty) {
      emit(FleetClassData(list: _allFleets));
      return;
    }

    final filtered = _allFleets
        .where((fleet) =>
    fleet.name?.toLowerCase().contains(query.toLowerCase()) ?? false)
        .toList();

    if (filtered.isEmpty) {
      emit(FleetClassEmpty());
    } else {
      emit(FleetClassData(list: filtered));
    }
  }
}
