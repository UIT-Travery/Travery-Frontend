import 'package:flutter/foundation.dart';
import 'package:travery_frontend/utils/core_result.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/recep_dashboard_response.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/available_room_response.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/recep_room_response.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/recep_add_on_order_response.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/check_in_request.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/check_out_preview_response.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/recep_booking_list_response.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/recep_booking_detail_response.dart';
abstract class ReceptionistRepository extends ChangeNotifier {
  Future<Result<RecepDashboardResponse>> getDashboard();
  Future<Result<List<AvailableRoomResponse>>> getAvailableRooms(String roomTypeId);
  Future<Result<List<RecepRoomResponse>>> getRooms();
  Future<Result<void>> updateRoomStatus(String roomId, String status);
  Future<Result<List<RecepAddOnOrderResponse>>> getAddOnOrders();
  Future<Result<void>> updateAddOnOrderStatus(String orderId, String status);
  Future<Result<void>> checkIn(String bookingId, CheckInRequest requestBody);
  Future<Result<CheckOutPreviewResponse>> checkOutPreview(String bookingId);
  Future<Result<void>> confirmCheckOut(String bookingId);
  Future<Result<List<RecepBookingListResponse>>> getBookings({String? status, String? guestName, String? date});
  Future<Result<RecepBookingDetailResponse>> getBookingDetail(String bookingId);
}
