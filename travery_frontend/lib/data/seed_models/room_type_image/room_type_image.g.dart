// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_type_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RoomTypeImage _$RoomTypeImageFromJson(Map<String, dynamic> json) =>
    _RoomTypeImage(
      id: json['id'] as String?,
      roomTypeId: json['room_type_id'] as String,
      imageUrl: json['image_url'] as String,
      displayOrder: (json['display_order'] as num).toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$RoomTypeImageToJson(_RoomTypeImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'room_type_id': instance.roomTypeId,
      'image_url': instance.imageUrl,
      'display_order': instance.displayOrder,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
