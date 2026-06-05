// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incident.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Incident _$IncidentFromJson(Map<String, dynamic> json) => _Incident(
  id: json['id'] as String?,
  handledBy: json['handled_by'] as String?,
  tourBookingId: json['tour_booking_id'] as String?,
  coachBookingId: json['coach_booking_id'] as String?,
  hotelBookingId: json['hotel_booking_id'] as String?,
  reportedByUserId: json['reported_by_user_id'] as String?,
  reportedByStaffId: json['reported_by_staff_id'] as String?,
  type: $enumDecode(_$IncidentTypeEnumMap, json['type']),
  severity: $enumDecode(_$IncidentSeverityEnumMap, json['severity']),
  description: json['description'] as String?,
  imageUrl: json['image_url'] as String?,
  location: json['location'] as String?,
  status: $enumDecode(_$IncidentStatusEnumMap, json['status']),
  reportedAt: json['reported_at'] == null
      ? null
      : DateTime.parse(json['reported_at'] as String),
  resolvedAt: json['resolved_at'] == null
      ? null
      : DateTime.parse(json['resolved_at'] as String),
  resolutionNotes: json['resolution_notes'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$IncidentToJson(_Incident instance) => <String, dynamic>{
  'id': instance.id,
  'handled_by': instance.handledBy,
  'tour_booking_id': instance.tourBookingId,
  'coach_booking_id': instance.coachBookingId,
  'hotel_booking_id': instance.hotelBookingId,
  'reported_by_user_id': instance.reportedByUserId,
  'reported_by_staff_id': instance.reportedByStaffId,
  'type': _$IncidentTypeEnumMap[instance.type]!,
  'severity': _$IncidentSeverityEnumMap[instance.severity]!,
  'description': instance.description,
  'image_url': instance.imageUrl,
  'location': instance.location,
  'status': _$IncidentStatusEnumMap[instance.status]!,
  'reported_at': instance.reportedAt?.toIso8601String(),
  'resolved_at': instance.resolvedAt?.toIso8601String(),
  'resolution_notes': instance.resolutionNotes,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};

const _$IncidentTypeEnumMap = {
  IncidentType.vehicle: 'vehicle',
  IncidentType.health: 'health',
  IncidentType.loss: 'loss',
  IncidentType.service: 'service',
  IncidentType.other: 'other',
};

const _$IncidentSeverityEnumMap = {
  IncidentSeverity.low: 'low',
  IncidentSeverity.medium: 'medium',
  IncidentSeverity.high: 'high',
};

const _$IncidentStatusEnumMap = {
  IncidentStatus.reported: 'reported',
  IncidentStatus.inProgress: 'inProgress',
  IncidentStatus.resolved: 'resolved',
};
