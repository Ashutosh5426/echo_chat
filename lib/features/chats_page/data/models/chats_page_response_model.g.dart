// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chats_page_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatsPageResponseModel _$ChatsPageResponseModelFromJson(
        Map<String, dynamic> json) =>
    ChatsPageResponseModel(
      json['user_1'] as String?,
      json['user_2'] as String?,
      json['user_1_id'] as String?,
      json['user_2_id'] as String?,
      json['user_2_image'] as String?,
      json['user_1_image'] as String?,
      (json['message'] as List<dynamic>?)
          ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatsPageResponseModelToJson(
        ChatsPageResponseModel instance) =>
    <String, dynamic>{
      'user_1': instance.user1,
      'user_2': instance.user2,
      'user_1_id': instance.user1Id,
      'user_2_id': instance.user2Id,
      'user_2_image': instance.user2Image,
      'user_1_image': instance.user1Image,
      'message': instance.message,
    };

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      json['value'] as String?,
      json['userId'] as String?,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'value': instance.value,
      'userId': instance.userId,
    };
