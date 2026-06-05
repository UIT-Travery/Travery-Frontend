// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Hotel _$HotelFromJson(Map<String, dynamic> json) => _Hotel(
  id: json['id'] as String?,
  name: json['name'] as String,
  description: json['description'] as String?,
  address: json['address'] as String?,
  city: json['city'] as String?,
  locationCode: json['location_code'] as String?,
  amenities: json['amenities'] as Map<String, dynamic>?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'] == null
      ? null
      : DateTime.parse(json['deleted_at'] as String),
  images: (json['images'] as List<dynamic>?)
      ?.map((e) => HotelImage.fromJson(e as Map<String, dynamic>))
      .toList(),
  roomTypes: (json['roomTypes'] as List<dynamic>?)
      ?.map((e) => RoomType.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$HotelToJson(_Hotel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'address': instance.address,
  'city': instance.city,
  'location_code': instance.locationCode,
  'amenities': instance.amenities,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'deleted_at': instance.deletedAt?.toIso8601String(),
  'images': instance.images,
  'roomTypes': instance.roomTypes,
};
