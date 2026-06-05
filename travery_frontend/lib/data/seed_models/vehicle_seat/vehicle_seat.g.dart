// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_seat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VehicleSeat _$VehicleSeatFromJson(Map<String, dynamic> json) => _VehicleSeat(
  id: json['id'] as String?,
  vehicleId: json['vehicle_id'] as String,
  seatCode: json['seat_code'] as String,
  floor: (json['floor'] as num).toInt(),
  rowZone: $enumDecode(_$SeatRowZoneEnumMap, json['rowZone']),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$VehicleSeatToJson(_VehicleSeat instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehicle_id': instance.vehicleId,
      'seat_code': instance.seatCode,
      'floor': instance.floor,
      'rowZone': _$SeatRowZoneEnumMap[instance.rowZone]!,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

const _$SeatRowZoneEnumMap = {
  SeatRowZone.front: 'front',
  SeatRowZone.middle: 'middle',
  SeatRowZone.rear: 'rear',
};
