import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../config/service_locator.dart';
import '../../../model/home_model.dart';
import '../../../repository/home_repository.dart';
import '../../../utility/resource/data_state.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    _repository = HomeRepository(serviceLocator.get());
  }

  late final HomeRepository _repository;

  fetchHomeData() async {
    emit(HomeLoading());

    try {
      final DataState<HomeModel> dataState = await _repository.home();
      if (dataState is DataStateSuccess<HomeModel>) {
        final homeData = dataState.data ?? HomeModel.empty();
        emit(HomeSuccess(homeData: homeData));
      } else if (dataState is DataStateError<HomeModel>) {
        emit(
          HomeError(
            message: dataState.exception?.toString() ?? 'Unknown error',
          ),
        );
      }
    } catch (e, stackTrace) {
      emit(HomeError(message: e.toString()));
    }
  }
}
