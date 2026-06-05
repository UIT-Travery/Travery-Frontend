// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    _NotificationModel(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      type: json['type'] as String,
      dataId: json['dataId'] as String?,
      isRead: json['isRead'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$NotificationModelToJson(_NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'type': instance.type,
      'dataId': instance.dataId,
      'isRead': instance.isRead,
      'createdAt': instance.createdAt.toIso8601String(),
    };
