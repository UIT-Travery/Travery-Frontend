// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Vehicle _$VehicleFromJson(Map<String, dynamic> json) => _Vehicle(
  id: json['id'] as String?,
  licensePlate: json['license_plate'] as String,
  vehicleType: $enumDecode(_$VehicleTypeEnumMap, json['vehicleType']),
  totalSeats: (json['total_seats'] as num).toInt(),
  floorCount: (json['floor_count'] as num).toInt(),
  status: $enumDecode(_$CoachStatusEnumMap, json['status']),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  seats: (json['seats'] as List<dynamic>?)
      ?.map((e) => VehicleSeat.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$VehicleToJson(_Vehicle instance) => <String, dynamic>{
  'id': instance.id,
  'license_plate': instance.licensePlate,
  'vehicleType': _$VehicleTypeEnumMap[instance.vehicleType]!,
  'total_seats': instance.totalSeats,
  'floor_count': instance.floorCount,
  'status': _$CoachStatusEnumMap[instance.status]!,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'seats': instance.seats,
};

const _$VehicleTypeEnumMap = {
  VehicleType.seat: 'seat',
  VehicleType.sleeper: 'sleeper',
  VehicleType.limosine: 'limosine',
};

const _$CoachStatusEnumMap = {
  CoachStatus.active: 'active',
  CoachStatus.maintenance: 'maintenance',
  CoachStatus.retired: 'retired',
};
