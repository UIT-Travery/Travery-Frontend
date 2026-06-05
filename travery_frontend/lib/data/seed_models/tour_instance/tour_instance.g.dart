// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_instance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TourInstance _$TourInstanceFromJson(Map<String, dynamic> json) =>
    _TourInstance(
      id: json['id'] as String?,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      status: $enumDecode(_$TourInstanceStatusEnumMap, json['status']),
      availableSlots: (json['availableSlots'] as num?)?.toInt() ?? 0,
      bookings: (json['bookings'] as List<dynamic>?)
          ?.map((e) => TourBooking.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TourInstanceToJson(_TourInstance instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'status': _$TourInstanceStatusEnumMap[instance.status]!,
      'availableSlots': instance.availableSlots,
      'bookings': instance.bookings,
    };

const _$TourInstanceStatusEnumMap = {
  TourInstanceStatus.PLANNING: 'PLANNING',
  TourInstanceStatus.OPEN: 'OPEN',
  TourInstanceStatus.FULL: 'FULL',
  TourInstanceStatus.IN_PROGRESS: 'IN_PROGRESS',
  TourInstanceStatus.COMPLETED: 'COMPLETED',
  TourInstanceStatus.CANCELLED: 'CANCELLED',
  TourInstanceStatus.POSTPONED: 'POSTPONED',
};
