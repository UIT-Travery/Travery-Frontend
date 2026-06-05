// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_itinerary_day_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TourItineraryDayImage _$TourItineraryDayImageFromJson(
  Map<String, dynamic> json,
) => _TourItineraryDayImage(
  id: json['id'] as String?,
  itineraryDayId: json['itinerary_day_id'] as String,
  imageUrl: json['image_url'] as String,
  caption: json['caption'] as String?,
  displayOrder: (json['display_order'] as num).toInt(),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$TourItineraryDayImageToJson(
  _TourItineraryDayImage instance,
) => <String, dynamic>{
  'id': instance.id,
  'itinerary_day_id': instance.itineraryDayId,
  'image_url': instance.imageUrl,
  'caption': instance.caption,
  'display_order': instance.displayOrder,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};
