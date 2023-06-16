import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:echo_chat/core/app_strings.dart';
import 'package:echo_chat/features/chats_page/data/data_source/chats_page_data_source.dart';
import 'package:echo_chat/features/chats_page/data/entity/chat_page_model.dart';
import 'package:echo_chat/features/chats_page/presentation/bloc/chat_page_event.dart';
import 'package:echo_chat/features/chats_page/presentation/bloc/chat_page_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPageBloc extends Bloc<ChatPageEvent, ChatPageState> {
  late String userId;

  ChatPageBloc() : super(ChatState.loading()) {
    on<FetchChatsEvent>(_fetchChatsEventToState);
    on<SendMessageEvent>(_sendMessageEventToState);
  }

  FutureOr<void> _fetchChatsEventToState(FetchChatsEvent event, emit) async {
    emit(ChatState.loading());
    userId = event.props[0].toString();
    Stream<ChatPageModel>? chatData = ChatsPageDataSource().getChatsDetails();
    debugPrint(chatData.toString());
    emit(ChatState.completed(chatData));
  }

  FutureOr<void> _sendMessageEventToState(SendMessageEvent event, emit) async {
    emit(SendMessageState.loading());

    var db = FirebaseFirestore.instance
        .collection(AppStrings.chats)
        .doc('wLQmgRKPRqA0k43D4qNo');

    List<MessageModel> messages = event.message;

    db
        .update({"message": parseToJson(messages)})
        .then((_) => debugPrint("Database updated successfully."))
        .catchError((error) {
          debugPrint("ERROR: $error");
        });

      emit(SendMessageState.completed());
  }

  List<Map<String, dynamic>> parseToJson(List<MessageModel> messages) {
    List<Map<String, dynamic>> messageJson = [];

    for (var i = 0; i < messages.length; i++) {
      messageJson
          .add({"userId": messages[i].userId, "value": messages[i].message});
    }
    return messageJson;
  }
}