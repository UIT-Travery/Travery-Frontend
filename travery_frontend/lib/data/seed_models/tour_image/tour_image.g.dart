// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TourImage _$TourImageFromJson(Map<String, dynamic> json) => _TourImage(
  id: json['id'] as String?,
  imageUrl: json['url'] as String,
  isThumbnail: json['isThumnail'] as bool? ?? false,
  displayOrder: (json['displayOrder'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$TourImageToJson(_TourImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.imageUrl,
      'isThumnail': instance.isThumbnail,
      'displayOrder': instance.displayOrder,
    };
