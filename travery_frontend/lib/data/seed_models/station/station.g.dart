// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Station _$StationFromJson(Map<String, dynamic> json) => _Station(
  id: json['id'] as String?,
  locationCode: json['location_code'] as String,
  name: json['name'] as String,
  address: json['address'] as String?,
  isPickupPoint: json['is_pickup_point'] as bool,
  isDropoffPoint: json['is_dropoff_point'] as bool,
  isActive: json['is_active'] as bool,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$StationToJson(_Station instance) => <String, dynamic>{
  'id': instance.id,
  'location_code': instance.locationCode,
  'name': instance.name,
  'address': instance.address,
  'is_pickup_point': instance.isPickupPoint,
  'is_dropoff_point': instance.isDropoffPoint,
  'is_active': instance.isActive,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};
