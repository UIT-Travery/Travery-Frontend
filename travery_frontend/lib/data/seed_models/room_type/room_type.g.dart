// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RoomType _$RoomTypeFromJson(Map<String, dynamic> json) => _RoomType(
  id: json['id'] as String?,
  hotelId: json['hotel_id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  pricePerNight: (json['price_per_night'] as num).toDouble(),
  maxOccupancy: (json['max_occupancy'] as num).toInt(),
  bedCount: (json['bed_count'] as num).toInt(),
  bedType: $enumDecode(_$BedTypeEnumMap, json['bedType']),
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
      ?.map((e) => RoomTypeImage.fromJson(e as Map<String, dynamic>))
      .toList(),
  rooms: (json['rooms'] as List<dynamic>?)
      ?.map((e) => Room.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$RoomTypeToJson(_RoomType instance) => <String, dynamic>{
  'id': instance.id,
  'hotel_id': instance.hotelId,
  'name': instance.name,
  'description': instance.description,
  'price_per_night': instance.pricePerNight,
  'max_occupancy': instance.maxOccupancy,
  'bed_count': instance.bedCount,
  'bedType': _$BedTypeEnumMap[instance.bedType]!,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'deleted_at': instance.deletedAt?.toIso8601String(),
  'images': instance.images,
  'rooms': instance.rooms,
};

const _$BedTypeEnumMap = {
  BedType.single: 'single',
  BedType.double: 'double',
  BedType.twin: 'twin',
};
