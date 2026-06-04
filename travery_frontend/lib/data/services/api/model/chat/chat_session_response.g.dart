// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_session_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatSessionResponse _$ChatSessionResponseFromJson(Map<String, dynamic> json) =>
    ChatSessionResponse(
      cometchatGuid: json['cometchatGuid'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$ChatSessionResponseToJson(
  ChatSessionResponse instance,
) => <String, dynamic>{
  'cometchatGuid': instance.cometchatGuid,
  'status': instance.status,
};
