// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HotelReview _$HotelReviewFromJson(Map<String, dynamic> json) => _HotelReview(
  id: json['id'] as String?,
  hotelBookingId: json['hotel_booking_id'] as String,
  rating: (json['rating'] as num).toInt(),
  comment: json['comment'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$HotelReviewToJson(_HotelReview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hotel_booking_id': instance.hotelBookingId,
      'rating': instance.rating,
      'comment': instance.comment,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
