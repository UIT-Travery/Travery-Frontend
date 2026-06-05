// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MealService _$MealServiceFromJson(Map<String, dynamic> json) => _MealService(
  id: json['id'] as String?,
  hotelId: json['hotel_id'] as String,
  name: json['name'] as String,
  mealType: $enumDecode(_$MealTypeEnumMap, json['mealType']),
  description: json['description'] as String?,
  price: (json['price'] as num).toDouble(),
  isAvailable: json['is_available'] as bool,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$MealServiceToJson(_MealService instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hotel_id': instance.hotelId,
      'name': instance.name,
      'mealType': _$MealTypeEnumMap[instance.mealType]!,
      'description': instance.description,
      'price': instance.price,
      'is_available': instance.isAvailable,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

const _$MealTypeEnumMap = {
  MealType.breakfast: 'breakfast',
  MealType.lunch: 'lunch',
  MealType.dinner: 'dinner',
};
