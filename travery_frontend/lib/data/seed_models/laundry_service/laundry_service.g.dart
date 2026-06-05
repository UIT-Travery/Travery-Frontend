// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'laundry_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LaundryService _$LaundryServiceFromJson(Map<String, dynamic> json) =>
    _LaundryService(
      id: json['id'] as String?,
      hotelId: json['hotel_id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      serviceType: $enumDecode(
        _$LaundryServiceTypeEnumMap,
        json['serviceType'],
      ),
      pricePerKg: (json['price_per_kg'] as num).toDouble(),
      isAvailable: json['is_available'] as bool,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$LaundryServiceToJson(_LaundryService instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hotel_id': instance.hotelId,
      'name': instance.name,
      'description': instance.description,
      'serviceType': _$LaundryServiceTypeEnumMap[instance.serviceType]!,
      'price_per_kg': instance.pricePerKg,
      'is_available': instance.isAvailable,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

const _$LaundryServiceTypeEnumMap = {
  LaundryServiceType.washDry: 'washDry',
  LaundryServiceType.steamPress: 'steamPress',
};
