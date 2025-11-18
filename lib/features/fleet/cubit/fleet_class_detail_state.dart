part of 'fleet_class_detail_cubit.dart';

@immutable
sealed class FleetClassDetailState {}

class FleetClassDetailInitial extends FleetClassDetailState {}

class FleetClassDetailStateLoading extends FleetClassDetailState {}

class FleetClassDetailStateData extends FleetClassDetailState {
  final FleetClassDetailModel fleet;

  FleetClassDetailStateData(this.fleet);
}

class FleetClassDetailStateEmpty extends FleetClassDetailState {}

class FleetClassDetailStateError extends FleetClassDetailState {
  final String message;

  FleetClassDetailStateError(this.message);
}