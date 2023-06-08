import 'package:echo_chat/features/chats_page/data/entity/chat_page_model.dart';
import 'package:equatable/equatable.dart';

abstract class ChatPageEvent extends Equatable{}

class FetchChatsEvent extends ChatPageEvent {
  FetchChatsEvent({required this.userId});
  final String userId;
  @override
  List<Object?> get props => [userId];
}

class SendMessageEvent extends ChatPageEvent{
  SendMessageEvent({required this.message});
  final List<MessageModel> message;
  @override
  List<Object?> get props => [message];
}