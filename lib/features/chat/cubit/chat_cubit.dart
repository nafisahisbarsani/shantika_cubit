import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shantika_cubit/utility/extensions/dio_exception_extensions.dart';
import '../../../config/service_locator.dart';
import '../../../model/chat_model.dart';
import '../../../repository/chat_repository.dart';
import '../../../utility/resource/data_state.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  late ChatRepository _chatRepository;
  ChatCubit() : super(ChatInitial());

  init() {
    _chatRepository = ChatRepository(serviceLocator.get());
  }

  fetchChats() async {
    emit(ChatLoading());
    final DataState<List<ChatModel>> dataState =
    await _chatRepository.fetchChats();

    switch (dataState) {
      case DataStateSuccess<List<ChatModel>>():
        {
          final chats = dataState.data ?? [];
          if (chats.isEmpty) {
            emit(ChatEmpty());
          } else {
            emit(ChatStateData(chatList: chats));
          }
        }
      case DataStateError<List<ChatModel>>():
        {
          emit(
            ChatError(
              message: dataState.exception?.parseMessage() ?? "",
            ),
          );
        }
    }
  }
}
