// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TourReview _$TourReviewFromJson(Map<String, dynamic> json) => _TourReview(
  id: json['id'] as String?,
  tourBookingId: json['tour_booking_id'] as String,
  rating: (json['rating'] as num).toInt(),
  comment: json['comment'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$TourReviewToJson(_TourReview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tour_booking_id': instance.tourBookingId,
      'rating': instance.rating,
      'comment': instance.comment,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
