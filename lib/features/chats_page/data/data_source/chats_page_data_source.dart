import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:echo_chat/core/app_strings.dart';
import 'package:echo_chat/features/chats_page/data/entity/chat_page_model.dart';
import 'package:echo_chat/features/chats_page/data/models/chats_page_response_model.dart';

class ChatsPageDataSource {
  Stream<ChatPageModel> getChatsDetails() {
    StreamController<ChatPageModel> chatDetails = StreamController();
    Stream<DocumentSnapshot> documentStream = FirebaseFirestore.instance
        .collection(AppStrings.chats)
        .doc('wLQmgRKPRqA0k43D4qNo')
        .snapshots();
    ChatsPageResponseModel data;
    documentStream.listen((DocumentSnapshot event) {
      data =
          ChatsPageResponseModel.fromJson(event.data() as Map<String, dynamic>);
      chatDetails.add(parseJsonToModel(data));
    });
    return chatDetails.stream;
  }

  ChatPageModel parseJsonToModel(ChatsPageResponseModel data) {
    List<MessageModel> messages = [];
    for(int i=0; i<data.message!.length; i++){
      messages.add(MessageModel(userId: data.message![i].userId ?? '', message: data.message![i].value ?? ''));
    }
    return ChatPageModel(
      username1: data.user1 ?? '',
      username2: data.user2 ?? '',
      userId1: data.user1Id ?? '',
      userId2: data.user2Id ?? '',
      userImage1: data.user1Image ?? '',
      userImage2: data.user2Image ?? '',
      messages: messages,
    );
  }
}

//  Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
//             return ListTile(
//               title: Text(data['full_name']),
//               subtitle: Text(data['company']),
//             );
//           }).toList(),

//var db = FirebaseFirestore.instance.collection(AppStrings.chats).doc('wLQmgRKPRqA0k43D4qNo');
//     var response = await db.get();
//     debugPrint(response.data.toString());

// var value = snapshot.data!.docs;
//                 var response = value.map((DocumentSnapshot document) {
//                   Map<String, dynamic> d =
//                       document.data() as Map<String, dynamic>;
//                   return d;
//                 });
