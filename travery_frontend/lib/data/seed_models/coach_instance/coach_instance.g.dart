// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coach_instance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CoachInstance _$CoachInstanceFromJson(Map<String, dynamic> json) =>
    _CoachInstance(
      id: json['id'] as String?,
      routeId: json['route_id'] as String,
      departureDate: DateTime.parse(json['departure_date'] as String),
      vehicleId: json['vehicle_id'] as String?,
      driverId: json['driver_id'] as String?,
      guideId: json['guide_id'] as String?,
      assignedBy: json['assigned_by'] as String?,
      status: $enumDecode(_$CoachInstanceStatusEnumMap, json['status']),
      cancelledAt: json['cancelled_at'] == null
          ? null
          : DateTime.parse(json['cancelled_at'] as String),
      cancellationReason: json['cancellation_reason'] as String?,
      cancelledBy: json['cancelled_by'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      bookings: (json['bookings'] as List<dynamic>?)
          ?.map((e) => CoachBooking.fromJson(e as Map<String, dynamic>))
          .toList(),
      seats: (json['seats'] as List<dynamic>?)
          ?.map((e) => CoachInstanceSeat.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CoachInstanceToJson(_CoachInstance instance) =>
    <String, dynamic>{
      'id': instance.id,
      'route_id': instance.routeId,
      'departure_date': instance.departureDate.toIso8601String(),
      'vehicle_id': instance.vehicleId,
      'driver_id': instance.driverId,
      'guide_id': instance.guideId,
      'assigned_by': instance.assignedBy,
      'status': _$CoachInstanceStatusEnumMap[instance.status]!,
      'cancelled_at': instance.cancelledAt?.toIso8601String(),
      'cancellation_reason': instance.cancellationReason,
      'cancelled_by': instance.cancelledBy,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'bookings': instance.bookings,
      'seats': instance.seats,
    };

const _$CoachInstanceStatusEnumMap = {
  CoachInstanceStatus.scheduled: 'scheduled',
  CoachInstanceStatus.departed: 'departed',
  CoachInstanceStatus.inTransit: 'inTransit',
  CoachInstanceStatus.completed: 'completed',
  CoachInstanceStatus.cancelled: 'cancelled',
};
