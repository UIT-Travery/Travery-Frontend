import 'package:freezed_annotation/freezed_annotation.dart';

import '../coach_booking/coach_booking.dart';
import '../coach_instance_seat/coach_instance_seat.dart';

part 'coach_instance.freezed.dart';
part 'coach_instance.g.dart';

@freezed
abstract class CoachInstance with _$CoachInstance {
  const factory CoachInstance({
    String? id,

    @JsonKey(name: 'route_id') required String routeId,

    @JsonKey(name: 'departure_date') required DateTime departureDate,

    @JsonKey(name: 'vehicle_id') String? vehicleId,

    @JsonKey(name: 'driver_id') String? driverId,

    @JsonKey(name: 'guide_id') String? guideId,

    @JsonKey(name: 'assigned_by') String? assignedBy,

    required CoachInstanceStatus status,

    @JsonKey(name: 'cancelled_at') DateTime? cancelledAt,

    @JsonKey(name: 'cancellation_reason') String? cancellationReason,

    @JsonKey(name: 'cancelled_by') String? cancelledBy,

    @JsonKey(name: 'created_at') DateTime? createdAt,

    @JsonKey(name: 'updated_at') DateTime? updatedAt,

    /// RELATIONS
    List<CoachBooking>? bookings,
    List<CoachInstanceSeat>? seats,
  }) = _CoachInstance;

  factory CoachInstance.fromJson(Map<String, dynamic> json) =>
      _$CoachInstanceFromJson(json);
}

@JsonEnum()
enum CoachInstanceStatus {
  scheduled,
  departed,
  inTransit,
  completed,
  cancelled
}
