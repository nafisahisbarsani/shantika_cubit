part of 'order_history_cubit.dart';

sealed class OrderHistoryState extends Equatable {
  const OrderHistoryState();

  @override
  List<Object> get props => [];
}

final class OrderHistoryInitial extends OrderHistoryState {}

final class OrderHistoryLoading extends OrderHistoryState {}

final class OrderHistorySuccess extends OrderHistoryState {
  final List<OrderListModel> orders;

  OrderHistorySuccess({required this.orders});

  @override
  List<Object> get props => [orders];
}

final class OrderHistoryError extends OrderHistoryState {
  final String message;

  OrderHistoryError({required this.message});

  @override
  List<Object> get props => [message];
}