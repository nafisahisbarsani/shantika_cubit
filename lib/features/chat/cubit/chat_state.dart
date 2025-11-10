part of 'chat_cubit.dart';

sealed class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

final class ChatInitial extends ChatState {}

final class ChatLoading extends ChatState {}

final class ChatEmpty extends ChatState {}

final class ChatError extends ChatState {
  final String message;
  const ChatError({required this.message});
}

// ignore: must_be_immutable
final class ChatStateData extends ChatState {
  List<ChatModel> chatList;
  ChatStateData({required this.chatList});
}
