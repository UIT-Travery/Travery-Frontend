// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coach_route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CoachRoute _$CoachRouteFromJson(Map<String, dynamic> json) => _CoachRoute(
  id: json['id'] as String?,
  originCode: json['origin_code'] as String,
  destinationCode: json['destination_code'] as String,
  departureTime: json['departure_time'] as String,
  estimatedDurationMinutes: (json['estimated_duration_minutes'] as num).toInt(),
  basePrice: (json['base_price'] as num).toDouble(),
  isActive: json['is_active'] as bool,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'] == null
      ? null
      : DateTime.parse(json['deleted_at'] as String),
);

Map<String, dynamic> _$CoachRouteToJson(_CoachRoute instance) =>
    <String, dynamic>{
      'id': instance.id,
      'origin_code': instance.originCode,
      'destination_code': instance.destinationCode,
      'departure_time': instance.departureTime,
      'estimated_duration_minutes': instance.estimatedDurationMinutes,
      'base_price': instance.basePrice,
      'is_active': instance.isActive,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };
