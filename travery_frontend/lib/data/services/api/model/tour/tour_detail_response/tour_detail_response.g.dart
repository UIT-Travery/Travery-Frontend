// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TourDetailResponse _$TourDetailResponseFromJson(Map<String, dynamic> json) =>
    _TourDetailResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      pricePerAdult: (json['pricePerAdult'] as num).toDouble(),
      pricePerChild: (json['pricePerChild'] as num).toDouble(),
      averageRating: (json['averageRating'] as num?)?.toDouble() ?? 0.0,
      ratingCount: (json['ratingCount'] as num?)?.toInt() ?? 0,
      startLocation: json['startLocation'] as String? ?? '',
      durationDays: (json['durationDays'] as num?)?.toInt() ?? 0,
      itineraryList:
          (json['itineraryList'] as List<dynamic>?)
              ?.map(
                (e) =>
                    TourItineraryResponse.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      images:
          (json['images'] as List<dynamic>?)
              ?.map((e) => ImageResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      destination: json['destination'] == null
          ? null
          : DestinationResponse.fromJson(
              json['destination'] as Map<String, dynamic>,
            ),
      refundPolicy: json['refundPolicy'] == null
          ? null
          : RefundPolicyResponse.fromJson(
              json['refundPolicy'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$TourDetailResponseToJson(_TourDetailResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'pricePerAdult': instance.pricePerAdult,
      'pricePerChild': instance.pricePerChild,
      'averageRating': instance.averageRating,
      'ratingCount': instance.ratingCount,
      'startLocation': instance.startLocation,
      'durationDays': instance.durationDays,
      'itineraryList': instance.itineraryList,
      'images': instance.images,
      'destination': instance.destination,
      'refundPolicy': instance.refundPolicy,
    };
