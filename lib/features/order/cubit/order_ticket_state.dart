part of 'order_ticket_cubit.dart';

sealed class OrderTicketState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class OrderTicketInitial extends OrderTicketState {}

final class OrderTicketLoading extends OrderTicketState {}

final class OrderTicketEmpty extends OrderTicketState {}

final class OrderTicketError extends OrderTicketState {
  final String message;
  OrderTicketError({required this.message});
  @override
  List<Object?> get props => [message];
}

final class OrderTicketCityData extends OrderTicketState {
  final List<CityModel> cities;
  OrderTicketCityData({required this.cities});
  @override
  List<Object?> get props => [cities];
}

final class OrderTicketAgencyData extends OrderTicketState {
  final List<AgencyModel> agencies;
  OrderTicketAgencyData({required this.agencies});
  @override
  List<Object?> get props => [agencies];
}

class OrderTicketTimeClassificationData extends OrderTicketState {
  final List<TimeClassificationModel> timeClassifications;

  OrderTicketTimeClassificationData({required this.timeClassifications});
}

final class OrderTicketFleetData extends OrderTicketState {
  final List<FleetModel> fleetClasses;

  OrderTicketFleetData({required this.fleetClasses});

  @override
  List<Object?> get props => [fleetClasses];
}

final class OrderTicketAgencyByCityData extends OrderTicketState {
  final List<AgencyByCityModel> agencies;

  OrderTicketAgencyByCityData({required this.agencies});

  @override
  List<Object?> get props => [agencies];
}
final class OrderTicketRoutesData extends OrderTicketState {
  final List<AvailableRoutesModel> routes;

  OrderTicketRoutesData({required this.routes});

  @override
  List<Object?> get props => [routes];
}
