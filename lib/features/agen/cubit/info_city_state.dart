part of 'info_city_cubit.dart';

sealed class InfoCityState extends Equatable {
  const InfoCityState();

  @override
  List<Object> get props => [];
}

final class InfoCityInitial extends InfoCityState {}

final class InfoCityStateLoading extends InfoCityState {}

final class InfoCityStateEmpty extends InfoCityState {}

final class InfoCityStateData extends InfoCityState {
  final List<InfoCityModel> cityList;

  const InfoCityStateData({required this.cityList});

  @override
  List<Object> get props => [cityList];
}

final class InfoCityStateError extends InfoCityState {
  final String message;

  const InfoCityStateError({required this.message});

  @override
  List<Object> get props => [message];
}