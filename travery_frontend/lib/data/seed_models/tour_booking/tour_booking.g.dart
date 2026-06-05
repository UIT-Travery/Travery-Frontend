// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TourBooking _$TourBookingFromJson(Map<String, dynamic> json) => _TourBooking(
  id: json['id'] as String?,
  userId: json['user_id'] as String,
  tourInstanceId: json['tour_instance_id'] as String?,
  passengerName: json['passenger_name'] as String,
  passengerPhone: json['passenger_phone'] as String,
  adultCount: (json['adult_count'] as num).toInt(),
  childCount: (json['child_count'] as num).toInt(),
  totalPrice: (json['total_price'] as num).toDouble(),
  refundAmount: (json['refund_amount'] as num?)?.toDouble(),
  specialNotes: json['special_notes'] as String?,
  status: $enumDecode(_$BookingStatusEnumMap, json['status']),
  coordinatorId: json['coordinator_id'] as String?,
  coordinatorResponse: json['coordinator_response'] as String?,
  cancellationReason: json['cancellation_reason'] == null
      ? null
      : DateTime.parse(json['cancellation_reason'] as String),
  cancelledAt: json['cancelled_at'] == null
      ? null
      : DateTime.parse(json['cancelled_at'] as String),
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
  members: (json['members'] as List<dynamic>?)
      ?.map((e) => TourBookingMember.fromJson(e as Map<String, dynamic>))
      .toList(),
  review: json['review'] == null
      ? null
      : TourReview.fromJson(json['review'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TourBookingToJson(_TourBooking instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'tour_instance_id': instance.tourInstanceId,
      'passenger_name': instance.passengerName,
      'passenger_phone': instance.passengerPhone,
      'adult_count': instance.adultCount,
      'child_count': instance.childCount,
      'total_price': instance.totalPrice,
      'refund_amount': instance.refundAmount,
      'special_notes': instance.specialNotes,
      'status': _$BookingStatusEnumMap[instance.status]!,
      'coordinator_id': instance.coordinatorId,
      'coordinator_response': instance.coordinatorResponse,
      'cancellation_reason': instance.cancellationReason?.toIso8601String(),
      'cancelled_at': instance.cancelledAt?.toIso8601String(),
      'no_show_note': instance.noShowNote,
      'no_show_at': instance.noShowAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'members': instance.members,
      'review': instance.review,
    };

const _$BookingStatusEnumMap = {
  BookingStatus.pending: 'pending',
  BookingStatus.pendingPayment: 'pendingPayment',
  BookingStatus.confirmed: 'confirmed',
  BookingStatus.inProgress: 'inProgress',
  BookingStatus.completed: 'completed',
  BookingStatus.cancelled: 'cancelled',
  BookingStatus.noShow: 'noShow',
  BookingStatus.refundRequested: 'refundRequested',
  BookingStatus.refunded: 'refunded',
};
