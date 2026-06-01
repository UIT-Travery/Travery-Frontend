import 'package:freezed_annotation/freezed_annotation.dart';

part 'guide_tour.freezed.dart';
part 'guide_tour.g.dart';

@freezed
class GuideTour with _$GuideTour {
  const factory GuideTour({
    String? id,

    @JsonKey(name: 'tour_instance_id') required String tourInstanceId,

    @JsonKey(name: 'tour_id') required String tourId,

    required String tourName,

    @JsonKey(name: 'start_date') required DateTime startDate,

    @JsonKey(name: 'end_date') required DateTime endDate,

    @JsonKey(name: 'group_size') required int groupSize,

    @JsonKey(name: 'group_description') required String groupDescription,

    required GuideTourStatus status,

    @JsonKey(name: 'booking_id') String? bookingId,

    @JsonKey(name: 'customer_name') String? customerName,

    @JsonKey(name: 'customer_phone') String? customerPhone,

    @JsonKey(name: 'vehicle_plate') String? vehiclePlate,

    @JsonKey(name: 'driver_name') String? driverName,

    @JsonKey(name: 'created_at') DateTime? createdAt,

    @JsonKey(name: 'updated_at') DateTime? updatedAt,

    // Extended fields from API response
    String? driverPhone,
    String? coachType,
    String? pickupLocation,
    int? passengerCount,
    int? bookingsCount,
  }) = _GuideTour;

  factory GuideTour.fromJson(Map<String, dynamic> json) =>
      _$GuideTourFromJson(json);
}

@JsonEnum()
enum GuideTourStatus {
  @JsonValue('ongoing')
  ongoing,
  @JsonValue('completed')
  completed,
  @JsonValue('upcoming')
  upcoming,
}
