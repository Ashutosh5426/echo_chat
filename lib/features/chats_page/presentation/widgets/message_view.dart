import 'package:echo_chat/features/chats_page/data/entity/chat_page_model.dart';
import 'package:flutter/material.dart';

class MessageView extends StatelessWidget {
  final List<MessageModel> messages;
  final String userID;
  final Radius borderRadius12 = const Radius.circular(12);
  final Radius borderRadius0 = const Radius.circular(0);
  final RegExp emojiDetector = RegExp(
      r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])');

  MessageView({required this.messages, required this.userID, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          messages.length,
          (i) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Row(
                  mainAxisAlignment: messages[i].userId == userID
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onLongPress: () {
                        print("LONG PRESSED");
                      },
                      child: Container(
                        padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.2),
                          borderRadius: BorderRadius.only(
                            topLeft: borderRadius12,
                            topRight: borderRadius12,
                            bottomLeft: messages[i].userId == userID
                                ? borderRadius0
                                : borderRadius12,
                            bottomRight: messages[i].userId == userID
                                ? borderRadius12
                                : borderRadius0,
                          ),
                        ),
                        child: MessageText(
                          message: messages[i].message,
                        ),
                        // child: Text(
                        //   messages[i].message,
                        //   style: TextStyle(
                        //     fontSize: emojiDetector.hasMatch(messages[i].message) ? 30 : 18,
                        //     color: Colors.white,
                        //     letterSpacing: 0.5
                        //   ),
                        // ),
                      ),
                    ),
                  ],
                ),
              )).toList(),
    );
  }
}

class MessageText extends StatelessWidget {
  final String message;
  final RegExp emojiDetector = RegExp(
      r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])');

  MessageText({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: const TextStyle(
          fontSize: 16, color: Colors.white, letterSpacing: 0.5),
    );
    // return RichText(
    //     text: TextSpan(
    //   children: createText(message),
    // ));
    // return RichText(
    //   text: TextSpan(
    //     children: [
    //       for (var i = 0; i < message.length; i++)
    //         TextSpan(
    //           text: message[i],
    //           style: TextStyle(
    //       //       fontSize: emojiDetector.hasMatch(message[i]) ? 24 : 16,
    //           )
    //         ),
    //     ],
    //   ),
    // );
  }

  List<TextSpan> createText(String message) {
    List<TextSpan> widgets = [];
    for (var i = 0; i < message.length; i++) {
      widgets.add(TextSpan(text: message[i].toString()));
    }
    return widgets;
  }
}
