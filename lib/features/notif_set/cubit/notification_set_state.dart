part of 'notification_set_cubit.dart';

sealed class NotificationSetState extends Equatable {
  const NotificationSetState();

  @override
  List<Object?> get props => [];
}

final class NotificationSetInitial extends NotificationSetState {}

final class NotificationSetLoading extends NotificationSetState {}

final class NotificationSetError extends NotificationSetState {
  final String message;
  const NotificationSetError(this.message);

  @override
  List<Object?> get props => [message];
}

final class NotificationSetSuccess extends NotificationSetState {
  final NotificationSetModel setting;
  const NotificationSetSuccess(this.setting);

  @override
  List<Object?> get props => [setting];
}
