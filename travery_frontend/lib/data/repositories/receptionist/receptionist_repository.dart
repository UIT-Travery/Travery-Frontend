import 'package:flutter/foundation.dart';
import 'package:travery_frontend/utils/core_result.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/recep_dashboard_response.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/available_room_response.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/recep_room_response.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/recep_add_on_order_response.dart';

abstract class ReceptionistRepository extends ChangeNotifier {
  Future<Result<RecepDashboardResponse>> getDashboard();
  Future<Result<List<AvailableRoomResponse>>> getAvailableRooms(String roomTypeId);
  Future<Result<List<RecepRoomResponse>>> getRooms();
  Future<Result<void>> updateRoomStatus(String roomId, String status);
  Future<Result<List<RecepAddOnOrderResponse>>> getAddOnOrders();
  Future<Result<void>> updateAddOnOrderStatus(String orderId, String status);
}
