import 'package:echo_chat/core/common_bloc_state.dart';
import 'package:echo_chat/features/chats_page/data/entity/chat_page_model.dart';

abstract class ChatPageState extends ApiState{
  ChatPageState.completed([super.data]) : super.completed();

  ChatPageState.loading([data]) : super.loading(data);

  ChatPageState.error(String error)
      : super.error(error);
}

class ChatState extends ChatPageState{

  ChatState.loading() : super.loading();

  ChatState.completed(Stream<ChatPageModel>? chatDetails) : super.completed(chatDetails);

  ChatState.error(String error) : super.error(error);

}

class SendMessageState extends ChatPageState{
  SendMessageState.loading() : super.loading();

  SendMessageState.completed() : super.completed();

  SendMessageState.error(String error) : super.error(error);
}