// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_incident_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TourIncidentResponse _$TourIncidentResponseFromJson(
  Map<String, dynamic> json,
) => _TourIncidentResponse(
  id: json['id'] as String,
  tourInstanceId: json['tourInstanceId'] as String,
  reporterId: json['reporterId'] as String,
  reporterName: json['reporterName'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  severity: json['severity'] as String,
  status: json['status'] as String,
  createdAt: json['createdAt'] as String? ?? '',
  updatedAt: json['updatedAt'] as String? ?? '',
);

Map<String, dynamic> _$TourIncidentResponseToJson(
  _TourIncidentResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'tourInstanceId': instance.tourInstanceId,
  'reporterId': instance.reporterId,
  'reporterName': instance.reporterName,
  'title': instance.title,
  'description': instance.description,
  'severity': instance.severity,
  'status': instance.status,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};
