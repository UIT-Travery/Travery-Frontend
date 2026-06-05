// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coach_trip_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CoachTripDetailResponseImpl _$$CoachTripDetailResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CoachTripDetailResponseImpl(
  id: json['id'] as String?,
  departureTime: json['departureTime'] == null
      ? null
      : DateTime.parse(json['departureTime'] as String),
  arrivalTime: json['arrivalTime'] == null
      ? null
      : DateTime.parse(json['arrivalTime'] as String),
  status: json['status'] as String?,
  routeId: json['routeId'] as String?,
  originDestinationName: json['originDestinationName'] as String?,
  destinationDestinationName: json['destinationDestinationName'] as String?,
  basePrice: (json['basePrice'] as num?)?.toDouble(),
  coachId: json['coachId'] as String?,
  coachLicensePlate: json['coachLicensePlate'] as String?,
  coachType: json['coachType'] as String?,
  driverId: json['driverId'] as String?,
  driverName: json['driverName'] as String?,
  driverPhone: json['driverPhone'] as String?,
  guideId: json['guideId'] as String?,
  guideName: json['guideName'] as String?,
  guidePhone: json['guidePhone'] as String?,
  totalSeats: (json['totalSeats'] as num?)?.toInt(),
  availableSeats: (json['availableSeats'] as num?)?.toInt(),
  bookingsCount: (json['bookingsCount'] as num?)?.toInt(),
  passengersCount: (json['passengersCount'] as num?)?.toInt(),
);

Map<String, dynamic> _$$CoachTripDetailResponseImplToJson(
  _$CoachTripDetailResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'departureTime': instance.departureTime?.toIso8601String(),
  'arrivalTime': instance.arrivalTime?.toIso8601String(),
  'status': instance.status,
  'routeId': instance.routeId,
  'originDestinationName': instance.originDestinationName,
  'destinationDestinationName': instance.destinationDestinationName,
  'basePrice': instance.basePrice,
  'coachId': instance.coachId,
  'coachLicensePlate': instance.coachLicensePlate,
  'coachType': instance.coachType,
  'driverId': instance.driverId,
  'driverName': instance.driverName,
  'driverPhone': instance.driverPhone,
  'guideId': instance.guideId,
  'guideName': instance.guideName,
  'guidePhone': instance.guidePhone,
  'totalSeats': instance.totalSeats,
  'availableSeats': instance.availableSeats,
  'bookingsCount': instance.bookingsCount,
  'passengersCount': instance.passengersCount,
};
