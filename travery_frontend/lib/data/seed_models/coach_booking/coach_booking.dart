import 'package:freezed_annotation/freezed_annotation.dart';

part 'coach_booking.freezed.dart';
part 'coach_booking.g.dart';

@freezed
abstract class CoachBooking with _$CoachBooking {
  const factory CoachBooking({
    String? id,

    @JsonKey(name: 'user_id') required String userId,

    @JsonKey(name: 'coach_instance_id') required String coachInstanceId,

    @JsonKey(name: 'passenger_name') required String passengerName,

    @JsonKey(name: 'passenger_phone') required String passengerPhone,

    @JsonKey(name: 'pickup_station_id') String? pickupStationId,

    @JsonKey(name: 'dropoff_station_id') String? dropoffStationId,

    @JsonKey(name: 'ticket_code') required String ticketCode,

    @JsonKey(name: 'ticket_count') required int ticketCount,

    @JsonKey(name: 'total_price') required double totalPrice,

    @JsonKey(name: 'refund_amount') double? refundAmount,

    @JsonKey(name: 'special_notes') String? specialNotes,

    required CoachBookingStatus status,

    @JsonKey(name: 'cancelled_at') DateTime? cancelledAt,

    @JsonKey(name: 'cancellation_reason') String? cancellationReason,

    @JsonKey(name: 'cancelled_by') String? cancelledBy,

    @JsonKey(name: 'no_show_note') String? noShowNote,

    @JsonKey(name: 'no_show_at') DateTime? noShowAt,

    @JsonKey(name: 'created_at') DateTime? createdAt,

    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _CoachBooking;

  factory CoachBooking.fromJson(Map<String, dynamic> json) =>
      _$CoachBookingFromJson(json);
}

@JsonEnum()
enum CoachBookingStatus {
  pendingPayment,
  confirmed,
  departed,
  completed,
  cancelled,
  expired,
  noShow
}
