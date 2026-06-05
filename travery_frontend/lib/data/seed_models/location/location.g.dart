// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Location _$LocationFromJson(Map<String, dynamic> json) => _Location(
  code: json['code'] as String,
  name: json['name'] as String,
  isActive: json['is_active'] as bool,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  stations: (json['stations'] as List<dynamic>?)
      ?.map((e) => Station.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$LocationToJson(_Location instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'is_active': instance.isActive,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'stations': instance.stations,
};
