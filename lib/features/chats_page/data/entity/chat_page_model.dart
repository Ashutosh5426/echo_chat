class ChatPageModel {
  final String username1;
  final String userId1;
  final String username2;
  final String userId2;
  final String userImage1;
  final String userImage2;
  final List<MessageModel> messages;

  const ChatPageModel({
    required this.username1,
    required this.username2,
    required this.userId1,
    required this.userId2,
    required this.userImage1,
    required this.userImage2,
    required this.messages,
  });
}

class MessageModel {
  final String userId;
  final String message;

  const MessageModel({required this.userId, required this.message});
}
