// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recep_room_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecepRoomResponseImpl _$$RecepRoomResponseImplFromJson(
  Map<String, dynamic> json,
) => _$RecepRoomResponseImpl(
  id: json['id'] as String,
  roomNumber: json['roomNumber'] as String,
  roomTypeName: json['roomTypeName'] as String,
  status: json['status'] as String,
  floor: (json['floor'] as num?)?.toInt(),
);

Map<String, dynamic> _$$RecepRoomResponseImplToJson(
  _$RecepRoomResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'roomNumber': instance.roomNumber,
  'roomTypeName': instance.roomTypeName,
  'status': instance.status,
  'floor': instance.floor,
};
