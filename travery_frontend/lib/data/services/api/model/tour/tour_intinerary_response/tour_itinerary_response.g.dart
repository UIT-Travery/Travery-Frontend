// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_itinerary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TourItineraryResponse _$TourItineraryResponseFromJson(
  Map<String, dynamic> json,
) => _TourItineraryResponse(
  dayNumber: (json['dayNumber'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String,
  images:
      (json['images'] as List<dynamic>?)
          ?.map((e) => ImageResponse.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$TourItineraryResponseToJson(
  _TourItineraryResponse instance,
) => <String, dynamic>{
  'dayNumber': instance.dayNumber,
  'title': instance.title,
  'description': instance.description,
  'images': instance.images,
};
