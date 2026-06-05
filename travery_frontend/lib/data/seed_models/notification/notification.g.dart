// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppNotification _$AppNotificationFromJson(Map<String, dynamic> json) =>
    _AppNotification(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      staffId: json['staff_id'] as String?,
      notificationType: json['notificationType'] as String,
      title: json['title'] as String,
      body: json['body'] as String?,
      referenceType: json['reference_type'] as String?,
      referenceId: json['referenceId'] as String?,
      isRead: json['is_read'] as bool,
      readAt: json['read_at'] == null
          ? null
          : DateTime.parse(json['read_at'] as String),
      sentAt: json['sent_at'] == null
          ? null
          : DateTime.parse(json['sent_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$AppNotificationToJson(_AppNotification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'staff_id': instance.staffId,
      'notificationType': instance.notificationType,
      'title': instance.title,
      'body': instance.body,
      'reference_type': instance.referenceType,
      'referenceId': instance.referenceId,
      'is_read': instance.isRead,
      'read_at': instance.readAt?.toIso8601String(),
      'sent_at': instance.sentAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
    };
