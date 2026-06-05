import 'package:freezed_annotation/freezed_annotation.dart';

import '../tour_booking_member/tour_booking_member.dart';
import '../tour_review/tour_review.dart';

part 'tour_booking.freezed.dart';
part 'tour_booking.g.dart';

@freezed
abstract class TourBooking with _$TourBooking {
  const factory TourBooking({
    String? id,

    @JsonKey(name: 'user_id') required String userId,

    @JsonKey(name: 'tour_instance_id') required String? tourInstanceId,

    @JsonKey(name: 'passenger_name') required String passengerName,

    @JsonKey(name: 'passenger_phone') required String passengerPhone,

    @JsonKey(name: 'adult_count') required int adultCount,

    @JsonKey(name: 'child_count') required int childCount,

    @JsonKey(name: 'total_price') required double totalPrice,

    @JsonKey(name: 'refund_amount') double? refundAmount,

    @JsonKey(name: 'special_notes') String? specialNotes,

    required BookingStatus status,

    @JsonKey(name: 'coordinator_id') String? coordinatorId,

    @JsonKey(name: 'coordinator_response') String? coordinatorResponse,

    @JsonKey(name: 'cancellation_reason') DateTime? cancellationReason,

    @JsonKey(name: 'cancelled_at') DateTime? cancelledAt,

    @JsonKey(name: 'no_show_note') String? noShowNote,

    @JsonKey(name: 'no_show_at') DateTime? noShowAt,

    @JsonKey(name: 'created_at') DateTime? createdAt,

    @JsonKey(name: 'updated_at') DateTime? updatedAt,

    /// RELATIONS
    List<TourBookingMember>? members,
    TourReview? review,
  }) = _TourBooking;

  factory TourBooking.fromJson(Map<String, dynamic> json) =>
      _$TourBookingFromJson(json);
}

@JsonEnum()
enum BookingStatus {
  pending,
  pendingPayment,
  confirmed,
  inProgress,
  completed,
  cancelled,
  noShow,
  refundRequested,
  refunded,
}
