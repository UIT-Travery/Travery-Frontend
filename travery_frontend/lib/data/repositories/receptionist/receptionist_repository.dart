import 'package:flutter/foundation.dart';
import 'package:travery_frontend/utils/core_result.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/recep_dashboard_response.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/available_room_response.dart';

abstract class ReceptionistRepository extends ChangeNotifier {
  Future<Result<RecepDashboardResponse>> getDashboard();
  Future<Result<List<AvailableRoomResponse>>> getAvailableRooms(String roomTypeId);
}
