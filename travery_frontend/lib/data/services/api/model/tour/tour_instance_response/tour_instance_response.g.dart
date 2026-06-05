// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_instance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TourInstanceResponse _$TourInstanceResponseFromJson(
  Map<String, dynamic> json,
) => _TourInstanceResponse(
  id: json['id'] as String,
  tourName: json['tourName'] as String,
  startDate: json['startDate'] as String,
  endDate: json['endDate'] as String?,
  status: json['status'] as String,
  currentParticipants: (json['currentParticipants'] as num).toInt(),
  maxParticipants: (json['maxParticipants'] as num?)?.toInt(),
  availableSlots: (json['availableSlots'] as num?)?.toInt(),
  thumbnailUrl: json['thumbnailUrl'] as String?,
);

Map<String, dynamic> _$TourInstanceResponseToJson(
  _TourInstanceResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'tourName': instance.tourName,
  'startDate': instance.startDate,
  'endDate': instance.endDate,
  'status': instance.status,
  'currentParticipants': instance.currentParticipants,
  'maxParticipants': instance.maxParticipants,
  'availableSlots': instance.availableSlots,
  'thumbnailUrl': instance.thumbnailUrl,
};
