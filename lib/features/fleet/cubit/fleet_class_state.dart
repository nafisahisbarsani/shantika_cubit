part of 'fleet_class_cubit.dart';

sealed class FleetClassState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class FleetClassInitial extends FleetClassState {}

final class FleetClassLoading extends FleetClassState {}

final class FleetClassEmpty extends FleetClassState {}

final class FleetClassError extends FleetClassState {
  final String message;
  FleetClassError({required this.message});

  @override
  List<Object?> get props => [message];
}

final class FleetClassData extends FleetClassState {
  final List<FleetModel> list;
  FleetClassData({required this.list});

  @override
  List<Object?> get props => [list];
}
