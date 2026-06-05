import 'package:freezed_annotation/freezed_annotation.dart';

part 'recep_booking_list_response.freezed.dart';
part 'recep_booking_list_response.g.dart';

@freezed
abstract class RecepBookingListResponse with _$RecepBookingListResponse {
  const factory RecepBookingListResponse({
    required String id,
    required String guestName,
    required String phoneNumber,
    required String checkInDate,
    required String checkOutDate,
    required String status,
  }) = _RecepBookingListResponse;

  factory RecepBookingListResponse.fromJson(Map<String, dynamic> json) =>
      _$RecepBookingListResponseFromJson(json);
}
