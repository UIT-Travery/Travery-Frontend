// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HotelBooking _$HotelBookingFromJson(Map<String, dynamic> json) =>
    _HotelBooking(
      id: json['id'] as String?,
      userId: json['user_id'] as String,
      roomId: json['room_id'] as String,
      handledBy: json['handled_by'] as String?,
      representativeName: json['representative_name'] as String,
      representativePhone: json['representative_phone'] as String,
      checkInDate: DateTime.parse(json['check_in_date'] as String),
      checkOutDate: DateTime.parse(json['check_out_date'] as String),
      nightCount: (json['night_count'] as num).toInt(),
      guestCount: (json['guest_count'] as num).toInt(),
      roomPrice: (json['room_price'] as num).toDouble(),
      lateCheckoutFee: (json['late_checkout_fee'] as num?)?.toDouble(),
      addonTotal: (json['addon_total'] as num?)?.toDouble(),
      totalPrice: (json['total_price'] as num).toDouble(),
      refundAmount: (json['refund_amount'] as num?)?.toDouble(),
      specialRequest: json['special_request'] as String?,
      status: $enumDecode(_$HotelBookingStatusEnumMap, json['status']),
      actualCheckInAt: json['actual_check_in_at'] == null
          ? null
          : DateTime.parse(json['actual_check_in_at'] as String),
      actualCheckOutAt: json['actual_check_out_at'] == null
          ? null
          : DateTime.parse(json['actual_check_out_at'] as String),
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
      members: (json['members'] as List<dynamic>?)
          ?.map((e) => HotelBookingMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      addonOrders: (json['addonOrders'] as List<dynamic>?)
          ?.map((e) => AddonOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
      review: json['review'] == null
          ? null
          : HotelReview.fromJson(json['review'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HotelBookingToJson(_HotelBooking instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'room_id': instance.roomId,
      'handled_by': instance.handledBy,
      'representative_name': instance.representativeName,
      'representative_phone': instance.representativePhone,
      'check_in_date': instance.checkInDate.toIso8601String(),
      'check_out_date': instance.checkOutDate.toIso8601String(),
      'night_count': instance.nightCount,
      'guest_count': instance.guestCount,
      'room_price': instance.roomPrice,
      'late_checkout_fee': instance.lateCheckoutFee,
      'addon_total': instance.addonTotal,
      'total_price': instance.totalPrice,
      'refund_amount': instance.refundAmount,
      'special_request': instance.specialRequest,
      'status': _$HotelBookingStatusEnumMap[instance.status]!,
      'actual_check_in_at': instance.actualCheckInAt?.toIso8601String(),
      'actual_check_out_at': instance.actualCheckOutAt?.toIso8601String(),
      'cancelled_at': instance.cancelledAt?.toIso8601String(),
      'cancellation_reason': instance.cancellationReason,
      'cancelled_by': instance.cancelledBy,
      'no_show_note': instance.noShowNote,
      'no_show_at': instance.noShowAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'members': instance.members,
      'addonOrders': instance.addonOrders,
      'review': instance.review,
    };

const _$HotelBookingStatusEnumMap = {
  HotelBookingStatus.pendingPayment: 'pendingPayment',
  HotelBookingStatus.confirmed: 'confirmed',
  HotelBookingStatus.checkedIn: 'checkedIn',
  HotelBookingStatus.pendingCheckout: 'pendingCheckout',
  HotelBookingStatus.checkedOut: 'checkedOut',
  HotelBookingStatus.completed: 'completed',
  HotelBookingStatus.cancelled: 'cancelled',
  HotelBookingStatus.expired: 'expired',
  HotelBookingStatus.noShow: 'noShow',
};
