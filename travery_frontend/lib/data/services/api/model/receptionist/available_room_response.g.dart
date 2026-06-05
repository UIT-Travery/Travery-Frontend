// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_room_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AvailableRoomResponse _$AvailableRoomResponseFromJson(
  Map<String, dynamic> json,
) => _AvailableRoomResponse(
  id: json['id'] as String?,
  roomNumber: json['roomNumber'] as String?,
  roomTypeName: json['roomTypeName'] as String?,
  status: json['status'] as String?,
  floor: (json['floor'] as num?)?.toInt(),
);

Map<String, dynamic> _$AvailableRoomResponseToJson(
  _AvailableRoomResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'roomNumber': instance.roomNumber,
  'roomTypeName': instance.roomTypeName,
  'status': instance.status,
  'floor': instance.floor,
};
