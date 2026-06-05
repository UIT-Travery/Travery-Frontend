// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Tour _$TourFromJson(Map<String, dynamic> json) => _Tour(
  id: json['id'] as String?,
  name: json['name'] as String,
  description: json['description'] as String?,
  pricePerAdult: (json['pricePerAdult'] as num).toDouble(),
  pricePerChild: (json['pricePerChild'] as num).toDouble(),
  averageRating: (json['averageRating'] as num?)?.toDouble() ?? 0.0,
  ratingCount: (json['ratingCount'] as num?)?.toInt() ?? 0,
  startLocation: json['startLocation'] as String? ?? '',
  durationDays: (json['durationDays'] as num?)?.toInt() ?? 0,
  images: (json['images'] as List<dynamic>?)
      ?.map((e) => TourImage.fromJson(e as Map<String, dynamic>))
      .toList(),
  instances: (json['instances'] as List<dynamic>?)
      ?.map((e) => TourInstance.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TourToJson(_Tour instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'pricePerAdult': instance.pricePerAdult,
  'pricePerChild': instance.pricePerChild,
  'averageRating': instance.averageRating,
  'ratingCount': instance.ratingCount,
  'startLocation': instance.startLocation,
  'durationDays': instance.durationDays,
  'images': instance.images,
  'instances': instance.instances,
};
