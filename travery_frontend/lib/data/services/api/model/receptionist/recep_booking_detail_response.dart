import 'package:freezed_annotation/freezed_annotation.dart';
import 'recep_add_on_order_response.dart';

part 'recep_booking_detail_response.freezed.dart';
part 'recep_booking_detail_response.g.dart';

@freezed
abstract class RecepBookingDetailResponse with _$RecepBookingDetailResponse {
  const factory RecepBookingDetailResponse({
    required String id,
    required String guestName,
    required String phoneNumber,
    required String checkInDate,
    required String checkOutDate,
    required String status,
    required num totalPrice,
    required num totalAddOnCharges,
    required List<HotelGuestResponse>? manifest,
    required List<RoomAllocationResponse>? roomAllocations,
    required List<RecepAddOnOrderResponse>? addOnOrders,
  }) = _RecepBookingDetailResponse;

  factory RecepBookingDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$RecepBookingDetailResponseFromJson(json);
}

@freezed
abstract class HotelGuestResponse with _$HotelGuestResponse {
  const factory HotelGuestResponse({
    required String id,
    required String fullName,
    required String identityNumber,
    required String dateOfBirth,
    required String memberType,
  }) = _HotelGuestResponse;

  factory HotelGuestResponse.fromJson(Map<String, dynamic> json) =>
      _$HotelGuestResponseFromJson(json);
}

@freezed
abstract class RoomAllocationResponse with _$RoomAllocationResponse {
  const factory RoomAllocationResponse({
    required String roomTypeId,
    required String roomTypeName,
    required int quantity,
    required List<String> assignedRoomNumbers,
  }) = _RoomAllocationResponse;

  factory RoomAllocationResponse.fromJson(Map<String, dynamic> json) =>
      _$RoomAllocationResponseFromJson(json);
}
