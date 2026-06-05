// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TourResponse _$TourResponseFromJson(Map<String, dynamic> json) =>
    _TourResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      destinationName: json['destinationName'] as String? ?? '',
      hotelName: json['hotelName'] as String? ?? '',
      pickupLocation: json['pickupLocation'] as String? ?? '',
      pricePerAdult: (json['pricePerAdult'] as num?)?.toDouble() ?? 0.0,
      pricePerChild: (json['pricePerChild'] as num?)?.toDouble() ?? 0.0,
      custom: json['custom'] as bool? ?? false,
    );

Map<String, dynamic> _$TourResponseToJson(_TourResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'destinationName': instance.destinationName,
      'hotelName': instance.hotelName,
      'pickupLocation': instance.pickupLocation,
      'pricePerAdult': instance.pricePerAdult,
      'pricePerChild': instance.pricePerChild,
      'custom': instance.custom,
    };
