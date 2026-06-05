// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spa_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SpaService _$SpaServiceFromJson(Map<String, dynamic> json) => _SpaService(
  id: json['id'] as String?,
  hotelId: json['hotel_id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  serviceType: $enumDecode(_$SpaServiceTypeEnumMap, json['serviceType']),
  durationMinutes: (json['duration_minutes'] as num).toInt(),
  price: (json['price'] as num).toDouble(),
  isAvailable: json['is_available'] as bool,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$SpaServiceToJson(_SpaService instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hotel_id': instance.hotelId,
      'name': instance.name,
      'description': instance.description,
      'serviceType': _$SpaServiceTypeEnumMap[instance.serviceType]!,
      'duration_minutes': instance.durationMinutes,
      'price': instance.price,
      'is_available': instance.isAvailable,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

const _$SpaServiceTypeEnumMap = {
  SpaServiceType.massage: 'massage',
  SpaServiceType.xonghoi: 'xonghoi',
  SpaServiceType.tamtien: 'tamtien',
};
