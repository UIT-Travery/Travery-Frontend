// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Room _$RoomFromJson(Map<String, dynamic> json) => _Room(
  id: json['id'] as String?,
  roomTypeId: json['room_type_id'] as String,
  roomNumber: json['room_number'] as String,
  floor: (json['floor'] as num).toInt(),
  status: $enumDecode(_$RoomStatusEnumMap, json['status']),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$RoomToJson(_Room instance) => <String, dynamic>{
  'id': instance.id,
  'room_type_id': instance.roomTypeId,
  'room_number': instance.roomNumber,
  'floor': instance.floor,
  'status': _$RoomStatusEnumMap[instance.status]!,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};

const _$RoomStatusEnumMap = {
  RoomStatus.available: 'available',
  RoomStatus.occupied: 'occupied',
  RoomStatus.maintenance: 'maintenance',
};
