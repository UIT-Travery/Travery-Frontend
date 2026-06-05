// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coach_booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CoachBooking _$CoachBookingFromJson(Map<String, dynamic> json) =>
    _CoachBooking(
      id: json['id'] as String?,
      userId: json['user_id'] as String,
      coachInstanceId: json['coach_instance_id'] as String,
      passengerName: json['passenger_name'] as String,
      passengerPhone: json['passenger_phone'] as String,
      pickupStationId: json['pickup_station_id'] as String?,
      dropoffStationId: json['dropoff_station_id'] as String?,
      ticketCode: json['ticket_code'] as String,
      ticketCount: (json['ticket_count'] as num).toInt(),
      totalPrice: (json['total_price'] as num).toDouble(),
      refundAmount: (json['refund_amount'] as num?)?.toDouble(),
      specialNotes: json['special_notes'] as String?,
      status: $enumDecode(_$CoachBookingStatusEnumMap, json['status']),
      cancelledAt: json['cancelled_at'] == null
          ? null
          : DateTime.parse(json['cancelled_at'] as String),
      cancellationReason: json['cancellation_reason'] as String?,
      cancelledBy: json['cancelled_by'] as String?,
      noShowNote: json['no_show_note'] as String?,
      noShowAt: json['no_show_at'] == null
          ? null
          : DateTime.parse(json['no_show_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$CoachBookingToJson(_CoachBooking instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'coach_instance_id': instance.coachInstanceId,
      'passenger_name': instance.passengerName,
      'passenger_phone': instance.passengerPhone,
      'pickup_station_id': instance.pickupStationId,
      'dropoff_station_id': instance.dropoffStationId,
      'ticket_code': instance.ticketCode,
      'ticket_count': instance.ticketCount,
      'total_price': instance.totalPrice,
      'refund_amount': instance.refundAmount,
      'special_notes': instance.specialNotes,
      'status': _$CoachBookingStatusEnumMap[instance.status]!,
      'cancelled_at': instance.cancelledAt?.toIso8601String(),
      'cancellation_reason': instance.cancellationReason,
      'cancelled_by': instance.cancelledBy,
      'no_show_note': instance.noShowNote,
      'no_show_at': instance.noShowAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

const _$CoachBookingStatusEnumMap = {
  CoachBookingStatus.pendingPayment: 'pendingPayment',
  CoachBookingStatus.confirmed: 'confirmed',
  CoachBookingStatus.departed: 'departed',
  CoachBookingStatus.completed: 'completed',
  CoachBookingStatus.cancelled: 'cancelled',
  CoachBookingStatus.expired: 'expired',
  CoachBookingStatus.noShow: 'noShow',
};
