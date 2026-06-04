// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_room_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AvailableRoomResponseImpl _$$AvailableRoomResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AvailableRoomResponseImpl(
  id: json['id'] as String?,
  roomNumber: json['roomNumber'] as String?,
  roomTypeName: json['roomTypeName'] as String?,
  status: json['status'] as String?,
  floor: (json['floor'] as num?)?.toInt(),
);

Map<String, dynamic> _$$AvailableRoomResponseImplToJson(
  _$AvailableRoomResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'roomNumber': instance.roomNumber,
  'roomTypeName': instance.roomTypeName,
  'status': instance.status,
  'floor': instance.floor,
};
