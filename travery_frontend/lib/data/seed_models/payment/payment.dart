import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment.freezed.dart';
part 'payment.g.dart';

@freezed
abstract class Payment with _$Payment {
  const factory Payment({
    String? id,

    @JsonKey(name: 'tour_booking_id') String? tourBookingId,

    @JsonKey(name: 'coach_booking_id') String? coachBookingId,

    @JsonKey(name: 'hotel_booking_id') String? hotelBookingId,

    required double amount,

    required PaymentType paymentType,

    required PaymentStatus status,

    @JsonKey(name: 'vnpay_txn_id') required String vnpayTxnId,

    @JsonKey(name: 'vnpay_response_code') String? vnpayResponseCode,

    @JsonKey(name: 'created_at') DateTime? createdAt,

    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Payment;

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);
}

@JsonEnum()
enum PaymentType { booking, addonCheckout, refund, lateFee }

@JsonEnum()
enum PaymentStatus { pending, success, failed, refunded }
