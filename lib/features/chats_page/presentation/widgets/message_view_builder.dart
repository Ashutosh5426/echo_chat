import 'package:echo_chat/features/chats_page/data/entity/chat_page_model.dart';
import 'package:flutter/material.dart';

class MessageView extends StatelessWidget {
  final List<MessageModel> messages;
  final String userID;

  MessageView({required this.messages, required this.userID, Key? key})
      : super(key: key);

  List<Widget> widgetList = [];

  @override
  Widget build(BuildContext context) {
    return Column(children: List.generate(messages.length, (i) =>  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        mainAxisAlignment: messages[i].userId == userID
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              messages[i].message,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    )).toList(),);
    return Column(children: buildWidget());
  }

  List<Widget> buildWidget() {
    for (int i = 0; i < messages.length; i++) {
      widgetList.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Row(
            mainAxisAlignment: messages[i].userId == userID
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  messages[i].message,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return widgetList;
  }
}
