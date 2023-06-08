import 'package:json_annotation/json_annotation.dart';

part 'chats_page_response_model.g.dart';


@JsonSerializable()
class ChatsPageResponseModel extends Object {

  @JsonKey(name: 'user_1')
  String? user1;

  @JsonKey(name: 'user_2')
  String? user2;

  @JsonKey(name: 'user_1_id')
  String? user1Id;

  @JsonKey(name: 'user_2_id')
  String? user2Id;

  @JsonKey(name: 'user_2_image')
  String? user2Image;

  @JsonKey(name: 'user_1_image')
  String? user1Image;

  @JsonKey(name: 'message')
  List<Message>? message;

  ChatsPageResponseModel(this.user1,this.user2,this.user1Id,this.user2Id,this.user2Image,this.user1Image,this.message,);

  factory ChatsPageResponseModel.fromJson(Map<String, dynamic> srcJson) => _$ChatsPageResponseModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ChatsPageResponseModelToJson(this);

}


@JsonSerializable()
class Message extends Object {

  @JsonKey(name: 'value')
  String? value;

  @JsonKey(name: 'userId')
  String? userId;

  Message(this.value,this.userId,);

  factory Message.fromJson(Map<String, dynamic> srcJson) => _$MessageFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MessageToJson(this);

}