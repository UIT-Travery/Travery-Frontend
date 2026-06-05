import 'package:freezed_annotation/freezed_annotation.dart';

part 'coach_instance_seat.freezed.dart';
part 'coach_instance_seat.g.dart';

@freezed
abstract class CoachInstanceSeat with _$CoachInstanceSeat {
  const factory CoachInstanceSeat({
    String? id,

    @JsonKey(name: 'instance_id') required String instanceId,

    @JsonKey(name: 'seat_id') required String seatId,

    @JsonKey(name: 'booking_id') String? bookingId,

    required SeatStatus status,

    @JsonKey(name: 'locked_until') DateTime? lockedUntil,

    @JsonKey(name: 'created_at') DateTime? createdAt,

    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _CoachInstanceSeat;

  factory CoachInstanceSeat.fromJson(Map<String, dynamic> json) =>
      _$CoachInstanceSeatFromJson(json);
}

@JsonEnum()
enum SeatStatus { available, locked, booked }
