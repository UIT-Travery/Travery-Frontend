import 'package:freezed_annotation/freezed_annotation.dart';

import '../addon_order/addon_order.dart';
import '../hotel_booking_member/hotel_booking_member.dart';
import '../hotel_review/hotel_review.dart';

part 'hotel_booking.freezed.dart';
part 'hotel_booking.g.dart';

@freezed
abstract class HotelBooking with _$HotelBooking {
  const factory HotelBooking({
    String? id,

    @JsonKey(name: 'user_id') required String userId,

    @JsonKey(name: 'room_id') required String roomId,

    @JsonKey(name: 'handled_by') String? handledBy,

    @JsonKey(name: 'representative_name') required String representativeName,

    @JsonKey(name: 'representative_phone') required String representativePhone,

    @JsonKey(name: 'check_in_date') required DateTime checkInDate,

    @JsonKey(name: 'check_out_date') required DateTime checkOutDate,

    @JsonKey(name: 'night_count') required int nightCount,

    @JsonKey(name: 'guest_count') required int guestCount,

    @JsonKey(name: 'room_price') required double roomPrice,

    @JsonKey(name: 'late_checkout_fee') double? lateCheckoutFee,

    @JsonKey(name: 'addon_total') double? addonTotal,

    @JsonKey(name: 'total_price') required double totalPrice,

    @JsonKey(name: 'refund_amount') double? refundAmount,

    @JsonKey(name: 'special_request') String? specialRequest,

    required HotelBookingStatus status,

    @JsonKey(name: 'actual_check_in_at') DateTime? actualCheckInAt,

    @JsonKey(name: 'actual_check_out_at') DateTime? actualCheckOutAt,

    @JsonKey(name: 'cancelled_at') DateTime? cancelledAt,

    @JsonKey(name: 'cancellation_reason') String? cancellationReason,

    @JsonKey(name: 'cancelled_by') String? cancelledBy,

    @JsonKey(name: 'no_show_note') String? noShowNote,

    @JsonKey(name: 'no_show_at') DateTime? noShowAt,

    @JsonKey(name: 'created_at') DateTime? createdAt,

    @JsonKey(name: 'updated_at') DateTime? updatedAt,

    /// RELATIONS
    List<HotelBookingMember>? members,
    List<AddonOrder>? addonOrders,
    HotelReview? review,
  }) = _HotelBooking;

  factory HotelBooking.fromJson(Map<String, dynamic> json) =>
      _$HotelBookingFromJson(json);
}

@JsonEnum()
enum HotelBookingStatus {
  pendingPayment,
  confirmed,
  checkedIn,
  pendingCheckout,
  checkedOut,
  completed,
  cancelled,
  expired,
  noShow
}
