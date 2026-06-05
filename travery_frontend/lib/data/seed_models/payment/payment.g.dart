// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Payment _$PaymentFromJson(Map<String, dynamic> json) => _Payment(
  id: json['id'] as String?,
  tourBookingId: json['tour_booking_id'] as String?,
  coachBookingId: json['coach_booking_id'] as String?,
  hotelBookingId: json['hotel_booking_id'] as String?,
  amount: (json['amount'] as num).toDouble(),
  paymentType: $enumDecode(_$PaymentTypeEnumMap, json['paymentType']),
  status: $enumDecode(_$PaymentStatusEnumMap, json['status']),
  vnpayTxnId: json['vnpay_txn_id'] as String,
  vnpayResponseCode: json['vnpay_response_code'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$PaymentToJson(_Payment instance) => <String, dynamic>{
  'id': instance.id,
  'tour_booking_id': instance.tourBookingId,
  'coach_booking_id': instance.coachBookingId,
  'hotel_booking_id': instance.hotelBookingId,
  'amount': instance.amount,
  'paymentType': _$PaymentTypeEnumMap[instance.paymentType]!,
  'status': _$PaymentStatusEnumMap[instance.status]!,
  'vnpay_txn_id': instance.vnpayTxnId,
  'vnpay_response_code': instance.vnpayResponseCode,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};

const _$PaymentTypeEnumMap = {
  PaymentType.booking: 'booking',
  PaymentType.addonCheckout: 'addonCheckout',
  PaymentType.refund: 'refund',
  PaymentType.lateFee: 'lateFee',
};

const _$PaymentStatusEnumMap = {
  PaymentStatus.pending: 'pending',
  PaymentStatus.success: 'success',
  PaymentStatus.failed: 'failed',
  PaymentStatus.refunded: 'refunded',
};
