// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_instance_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TourInstanceDetailResponse _$TourInstanceDetailResponseFromJson(
  Map<String, dynamic> json,
) => _TourInstanceDetailResponse(
  id: json['id'] as String,
  tourName: json['tourName'] as String,
  destinationName: json['destinationName'] as String,
  pickupLocation: json['pickupLocation'] as String? ?? '',
  startDate: json['startDate'] as String,
  endDate: json['endDate'] as String,
  minParticipants: (json['minParticipants'] as num?)?.toInt() ?? 0,
  maxParticipants: (json['maxParticipants'] as num?)?.toInt() ?? 0,
  currentParticipants: (json['currentParticipants'] as num?)?.toInt() ?? 0,
  status: json['status'] as String,
  guideId: json['guideId'] as String?,
  guideName: json['guideName'] as String?,
  guidePhone: json['guidePhone'] as String?,
  coachId: json['coachId'] as String?,
  coachLicensePlate: json['coachLicensePlate'] as String?,
  coachType: json['coachType'] as String?,
  driverId: json['driverId'] as String?,
  driverName: json['driverName'] as String?,
  driverPhone: json['driverPhone'] as String?,
);

Map<String, dynamic> _$TourInstanceDetailResponseToJson(
  _TourInstanceDetailResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'tourName': instance.tourName,
  'destinationName': instance.destinationName,
  'pickupLocation': instance.pickupLocation,
  'startDate': instance.startDate,
  'endDate': instance.endDate,
  'minParticipants': instance.minParticipants,
  'maxParticipants': instance.maxParticipants,
  'currentParticipants': instance.currentParticipants,
  'status': instance.status,
  'guideId': instance.guideId,
  'guideName': instance.guideName,
  'guidePhone': instance.guidePhone,
  'coachId': instance.coachId,
  'coachLicensePlate': instance.coachLicensePlate,
  'coachType': instance.coachType,
  'driverId': instance.driverId,
  'driverName': instance.driverName,
  'driverPhone': instance.driverPhone,
};
