import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:echo_chat/core/app_strings.dart';
import 'package:echo_chat/core/common_bloc_state.dart';
import 'package:echo_chat/core/common_error_page.dart';
import 'package:echo_chat/features/chats_page/data/entity/chat_page_model.dart';
import 'package:echo_chat/features/chats_page/presentation/bloc/chat_page_bloc.dart';
import 'package:echo_chat/features/chats_page/presentation/bloc/chat_page_event.dart';
import 'package:echo_chat/features/chats_page/presentation/bloc/chat_page_state.dart';
import 'package:echo_chat/features/chats_page/presentation/widgets/chat_box_widget.dart';
import 'package:echo_chat/features/chats_page/presentation/widgets/chat_page_shimmer.dart';
import 'package:echo_chat/features/chats_page/presentation/widgets/message_view_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatefulWidget {
  final String userId;

  const ChatPage({required this.userId, Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  Stream<QuerySnapshot> chatStream =
      FirebaseFirestore.instance.collection(AppStrings.chats).snapshots();

  ChatPageBloc chatBloc = ChatPageBloc();

  @override
  void initState() {
    super.initState();
    chatBloc.add(FetchChatsEvent(userId: widget.userId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatPageBloc, ChatPageState>(
      bloc: chatBloc,
      buildWhen: (prevState, currState) => currState is ChatState,
      builder: (context, ChatPageState state) {
        if (state.status == Status.loading) {
          return const Center(child: ChatPageShimmer());
        } else if (state.status == Status.error) {
          return const CommonErrorPage();
        } else {
          var chats = chatBloc.chatData;
          return StreamBuilder(
            stream: chats,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const CommonErrorPage();
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const ChatPageShimmer();
              } else {
                ChatPageModel data = snapshot.data! as ChatPageModel;
                print(data.userImage1);
                return Scaffold(
                  backgroundColor: const Color.fromRGBO(14, 27, 35, 0.5),
                  resizeToAvoidBottomInset: true,
                  /// Appbar- Profile Image and Name with back icon
                  appBar: AppBar(
                    title: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            widget.userId == data.userId1
                                ? data.userImage2
                                : data.userImage1,
                            width: 30,
                            height: 30,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          widget.userId == data.userId1
                              ? data.username2
                              : data.username1,
                        ),
                      ],
                    ),
                    backgroundColor: const Color.fromRGBO(14, 27, 35, 1),
                    foregroundColor: Colors.white,
                    elevation: 0,
                  ),

                  /// Page Body- Messages and ChatBox
                  body: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          reverse: true,
                          child: MessageView(
                            messages: data.messages,
                            userID: widget.userId == data.userId1
                                ? data.userId1
                                : data.userId2,
                          ),
                        ),
                      ),
                      /// ChatBox
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ChatBox(
                            blocInstance: chatBloc,
                            messages: data.messages,
                            userId: widget.userId,
                          ),
                        ],
                      ),
                    ],
                  ),
                );

              }
            },
          );
        }
      },
    );
  }
}
