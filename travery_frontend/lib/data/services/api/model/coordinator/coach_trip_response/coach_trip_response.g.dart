// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coach_trip_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CoachTripResponse _$CoachTripResponseFromJson(Map<String, dynamic> json) =>
    _CoachTripResponse(
      id: json['id'] as String?,
      departureTime: json['departureTime'] == null
          ? null
          : DateTime.parse(json['departureTime'] as String),
      arrivalTime: json['arrivalTime'] == null
          ? null
          : DateTime.parse(json['arrivalTime'] as String),
      coachType: json['coachType'] as String?,
      totalSeats: (json['totalSeats'] as num?)?.toInt(),
      availableSeats: (json['availableSeats'] as num?)?.toInt(),
      basePrice: (json['basePrice'] as num?)?.toDouble(),
      originDestination: json['originDestination'] == null
          ? null
          : DestinationResponse.fromJson(
              json['originDestination'] as Map<String, dynamic>,
            ),
      destinationDestination: json['destinationDestination'] == null
          ? null
          : DestinationResponse.fromJson(
              json['destinationDestination'] as Map<String, dynamic>,
            ),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$CoachTripResponseToJson(_CoachTripResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'departureTime': instance.departureTime?.toIso8601String(),
      'arrivalTime': instance.arrivalTime?.toIso8601String(),
      'coachType': instance.coachType,
      'totalSeats': instance.totalSeats,
      'availableSeats': instance.availableSeats,
      'basePrice': instance.basePrice,
      'originDestination': instance.originDestination,
      'destinationDestination': instance.destinationDestination,
      'status': instance.status,
    };
