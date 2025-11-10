part of 'read_notification_cubit.dart';

sealed class ReadNotificationState extends Equatable {
  const ReadNotificationState();

  @override
  List<Object> get props => [];
}

final class ReadNotificationInitial extends ReadNotificationState {}

final class ReadNotificationStateLoading extends ReadNotificationState {}

final class ReadNotificationStateSuccess extends ReadNotificationState {}

final class ReadNotificationStateError extends ReadNotificationState {
  final String message;

  ReadNotificationStateError({required this.message});
}

final class ReadAllNotificationStateLoading extends ReadNotificationState {}

final class ReadAllNotificationStateSuccess extends ReadNotificationState {}

final class ReadAllNotificationStateError extends ReadNotificationState {
  final String message;

  ReadAllNotificationStateError({required this.message});
}
