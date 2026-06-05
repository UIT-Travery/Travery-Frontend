import 'package:freezed_annotation/freezed_annotation.dart';
import '../tour_booking/tour_booking.dart';

part 'tour_instance.freezed.dart';
part 'tour_instance.g.dart';

@freezed
abstract class TourInstance with _$TourInstance {
  const factory TourInstance({
    String? id,

    @JsonKey(name: 'startDate') required DateTime startDate,

    @JsonKey(name: 'endDate') required DateTime endDate,

    @JsonKey(name: 'status') required TourInstanceStatus status,

    @JsonKey(name: 'availableSlots') @Default(0) int availableSlots,

    /// RELATIONS
    List<TourBooking>? bookings,
  }) = _TourInstance;

  factory TourInstance.fromJson(Map<String, dynamic> json) =>
      _$TourInstanceFromJson(json);
}

@JsonEnum()
enum TourInstanceStatus {
  PLANNING,
  OPEN,
  FULL,
  IN_PROGRESS,
  COMPLETED,
  CANCELLED,
  POSTPONED,
}
