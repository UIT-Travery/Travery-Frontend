// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_summary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TourSummaryResponse _$TourSummaryResponseFromJson(Map<String, dynamic> json) =>
    _TourSummaryResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      averageRating: (json['averageRating'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      thumbnailUrl: json['thumbnailUrl'] as String?,
      destinationName: json['destinationName'] as String,
      durationDays: (json['durationDays'] as num).toInt(),
    );

Map<String, dynamic> _$TourSummaryResponseToJson(
  _TourSummaryResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'averageRating': instance.averageRating,
  'price': instance.price,
  'thumbnailUrl': instance.thumbnailUrl,
  'destinationName': instance.destinationName,
  'durationDays': instance.durationDays,
};
