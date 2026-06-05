// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Driver _$DriverFromJson(Map<String, dynamic> json) => _Driver(
  id: json['id'] as String?,
  fullName: json['full_name'] as String,
  phone: json['phone'] as String,
  licenseNumber: json['license_number'] as String,
  status: $enumDecode(_$DriverStatusEnumMap, json['status']),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$DriverToJson(_Driver instance) => <String, dynamic>{
  'id': instance.id,
  'full_name': instance.fullName,
  'phone': instance.phone,
  'license_number': instance.licenseNumber,
  'status': _$DriverStatusEnumMap[instance.status]!,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};

const _$DriverStatusEnumMap = {
  DriverStatus.available: 'available',
  DriverStatus.onTrip: 'onTrip',
  DriverStatus.offDuty: 'offDuty',
};
