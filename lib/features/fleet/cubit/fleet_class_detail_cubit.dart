import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../config/service_locator.dart';
import '../../../model/fleet_class_detail_model.dart';
import '../../../repository/fleet_class_repository.dart';
import '../../../utility/resource/data_state.dart';

part 'fleet_class_detail_state.dart';

class FleetClassDetailCubit extends Cubit<FleetClassDetailState> {
  late FleetClassRepository _repository;

  FleetClassDetailCubit() : super(FleetClassDetailInitial());

  void init() {
    _repository = FleetClassRepository(serviceLocator.get());
  }

  Future<void> loadFleetClassDetail(int fleetClassId) async {
    emit(FleetClassDetailStateLoading());

    final DataState<FleetClassDetailModel> dataState =
    await _repository.getFleetClassDetail(fleetClassId);

    switch (dataState) {
      case DataStateSuccess<FleetClassDetailModel>():
        final fleet = dataState.data;

        if (fleet == null || fleet.id == null) {
          emit(FleetClassDetailStateEmpty());
        } else {
          emit(FleetClassDetailStateData(fleet));
        }

      case DataStateError<FleetClassDetailModel>():
        emit(
          FleetClassDetailStateError(dataState.exception?.message ?? "Unknown error"),
        );
    }
  }
}