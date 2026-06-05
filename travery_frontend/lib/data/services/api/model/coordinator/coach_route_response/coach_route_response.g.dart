// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coach_route_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CoachRouteResponseImpl _$$CoachRouteResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CoachRouteResponseImpl(
  id: json['id'] as String,
  originDestinationId: json['originDestinationId'] as String,
  originDestinationName: json['originDestinationName'] as String,
  destinationDestinationId: json['destinationDestinationId'] as String,
  destinationDestinationName: json['destinationDestinationName'] as String,
  distanceKm: (json['distanceKm'] as num).toDouble(),
  estimatedHours: (json['estimatedHours'] as num).toDouble(),
  basePrice: (json['basePrice'] as num).toDouble(),
  refundPolicyId: json['refundPolicyId'] as String?,
  refundPolicyName: json['refundPolicyName'] as String?,
  averageRating: (json['averageRating'] as num).toDouble(),
  reviewCount: (json['reviewCount'] as num).toInt(),
);

Map<String, dynamic> _$$CoachRouteResponseImplToJson(
  _$CoachRouteResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'originDestinationId': instance.originDestinationId,
  'originDestinationName': instance.originDestinationName,
  'destinationDestinationId': instance.destinationDestinationId,
  'destinationDestinationName': instance.destinationDestinationName,
  'distanceKm': instance.distanceKm,
  'estimatedHours': instance.estimatedHours,
  'basePrice': instance.basePrice,
  'refundPolicyId': instance.refundPolicyId,
  'refundPolicyName': instance.refundPolicyName,
  'averageRating': instance.averageRating,
  'reviewCount': instance.reviewCount,
};
