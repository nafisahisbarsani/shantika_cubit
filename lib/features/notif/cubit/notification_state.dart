part of 'notification_cubit.dart';

sealed class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

final class NotificationInitial extends NotificationState {}

final class NotificationStateLoading extends NotificationState {}

final class NotificationStateLoadingNextPage extends NotificationState {}

final class NotificationStateSuccess extends NotificationState {
  final List<NotificationModel> notifications;

  NotificationStateSuccess({required this.notifications});
}

final class NotificationStateError extends NotificationState {
  final String message;

  NotificationStateError({required this.message});
}
