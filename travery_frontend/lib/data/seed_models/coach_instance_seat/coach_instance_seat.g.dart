// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coach_instance_seat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CoachInstanceSeat _$CoachInstanceSeatFromJson(Map<String, dynamic> json) =>
    _CoachInstanceSeat(
      id: json['id'] as String?,
      instanceId: json['instance_id'] as String,
      seatId: json['seat_id'] as String,
      bookingId: json['booking_id'] as String?,
      status: $enumDecode(_$SeatStatusEnumMap, json['status']),
      lockedUntil: json['locked_until'] == null
          ? null
          : DateTime.parse(json['locked_until'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$CoachInstanceSeatToJson(_CoachInstanceSeat instance) =>
    <String, dynamic>{
      'id': instance.id,
      'instance_id': instance.instanceId,
      'seat_id': instance.seatId,
      'booking_id': instance.bookingId,
      'status': _$SeatStatusEnumMap[instance.status]!,
      'locked_until': instance.lockedUntil?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

const _$SeatStatusEnumMap = {
  SeatStatus.available: 'available',
  SeatStatus.locked: 'locked',
  SeatStatus.booked: 'booked',
};
