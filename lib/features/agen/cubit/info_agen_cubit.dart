import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shantika_cubit/model/info_agen_model.dart';
import '../../../config/service_locator.dart';
import '../../../repository/info_agen_repository.dart';
import '../../../utility/resource/data_state.dart';

part 'info_agen_state.dart';

class InfoAgenCubit extends Cubit<InfoAgenState> {
  late InfoCityRepository _repository;

  List<InfoAgenModel> _allAgencies = [];

  InfoAgenCubit() : super(InfoAgenInitial());

  void init() {
    _repository = InfoCityRepository(serviceLocator.get());
  }

  Future<void> loadAgen(int cityId) async {
    emit(InfoAgenStateLoading());

    final DataState<List<InfoAgenModel>> dataState = await _repository
        .getInfoAgen(cityId);

    switch (dataState) {
      case DataStateSuccess<List<InfoAgenModel>>():
        _allAgencies = dataState.data ?? [];

        if (_allAgencies.isEmpty) {
          emit(InfoAgenStateEmpty());
        } else {
          emit(InfoAgenStateData(_allAgencies));
        }

      case DataStateError<List<InfoAgenModel>>():
        emit(
          InfoAgenStateError(dataState.exception?.message ?? "Unknown error"),
        );
    }
  }

  void searchAgen(String query) {
    if (query.isEmpty) {
      emit(
        _allAgencies.isEmpty
            ? InfoAgenStateEmpty()
            : InfoAgenStateData(_allAgencies),
      );
      return;
    }

    final filtered = _allAgencies
        .where(
          (a) =>
              (a.agencyName ?? "").toLowerCase().contains(query.toLowerCase()),
        )
        .toList();

    if (filtered.isEmpty) {
      emit(InfoAgenStateEmpty());
    } else {
      emit(InfoAgenStateData(filtered));
    }
  }
}
