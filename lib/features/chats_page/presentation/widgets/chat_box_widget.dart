import 'package:echo_chat/core/app_images.dart';
import 'package:echo_chat/core/app_strings.dart';
import 'package:echo_chat/features/chats_page/data/entity/chat_page_model.dart';
import 'package:echo_chat/features/chats_page/presentation/bloc/chat_page_bloc.dart';
import 'package:echo_chat/features/chats_page/presentation/bloc/chat_page_event.dart';
import 'package:flutter/material.dart';

class ChatBox extends StatelessWidget {
  final List<MessageModel> messages;
  final String userId;

  ChatBox({
    required this.messages,
    required this.userId,
    super.key,
  });

  /// Chat text editing controller
  var chatController = TextEditingController();
  ChatPageBloc chatBloc = ChatPageBloc();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 50, top: 10),
      child: Row(
        children: [
          Expanded(
            flex: 9,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                controller: chatController,
                maxLines: 6,
                minLines: 1,
                style: const TextStyle(
                  color: Colors.white,
                  height: 1.3,
                  letterSpacing: 0.4,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsetsDirectional.only(
                    start: 16,
                    end: 16,
                    top: 8,
                    bottom: 8,
                  ),
                  hintText: AppStrings.typeYourMessageHere,
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                messages.add(
                    MessageModel(userId: userId, message: chatController.text));
                chatBloc.add(SendMessageEvent(message: messages));
              },
              child: Container(
                padding: const EdgeInsetsDirectional.only(
                  start: 4,
                  end: 8,
                  top: 8,
                  bottom: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.2),
                  border: Border.all(color: Colors.white),
                  shape: BoxShape.circle,
                ),
                child: Transform.rotate(
                  angle: 0.8,
                  child: Image.asset(
                    AppIcons.sendIcon,
                    width: 20,
                    height: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
