// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_itinerary_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TourItineraryDay _$TourItineraryDayFromJson(Map<String, dynamic> json) =>
    _TourItineraryDay(
      id: json['id'] as String?,
      tourId: json['tour_id'] as String,
      dayNumber: (json['day_number'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String?,
      mealCount: (json['meal_count'] as num).toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      images: (json['images'] as List<dynamic>?)
          ?.map(
            (e) => TourItineraryDayImage.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$TourItineraryDayToJson(_TourItineraryDay instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tour_id': instance.tourId,
      'day_number': instance.dayNumber,
      'title': instance.title,
      'description': instance.description,
      'meal_count': instance.mealCount,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'images': instance.images,
    };
