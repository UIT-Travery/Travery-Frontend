import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:travery_frontend/data/services/api/model/booking/create_tour_booking_response/create_tour_booking_response.dart';

part 'booking_detail_response.freezed.dart';
part 'booking_detail_response.g.dart';

@freezed
abstract class BookingDetailResponse with _$BookingDetailResponse {
  const factory BookingDetailResponse({required TourBookingData data}) =
      _BookingDetailResponse;

  factory BookingDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$BookingDetailResponseFromJson(json);
}
