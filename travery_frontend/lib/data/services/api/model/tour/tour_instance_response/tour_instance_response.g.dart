// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_instance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TourInstanceResponseImpl _$$TourInstanceResponseImplFromJson(
  Map<String, dynamic> json,
) => _$TourInstanceResponseImpl(
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

Map<String, dynamic> _$$TourInstanceResponseImplToJson(
  _$TourInstanceResponseImpl instance,
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
