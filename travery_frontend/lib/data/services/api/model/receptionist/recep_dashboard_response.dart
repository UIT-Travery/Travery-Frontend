import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/check_in_queue_item_response.dart';

part 'recep_dashboard_response.freezed.dart';
part 'recep_dashboard_response.g.dart';

@freezed
class RecepDashboardResponse with _$RecepDashboardResponse {
  factory RecepDashboardResponse({
    @Default(0) int availableRooms,
    @Default(0) int occupiedRooms,
    @Default(0) int cleaningRooms,
    @Default(0) int maintenanceRooms,
    @Default(0) int todayCheckInCount,
    @Default(0) int todayCheckOutCount,
    @Default([]) List<CheckInQueueItemResponse> checkInQueue,
    @Default([]) List<CheckInQueueItemResponse> checkOutQueue,
  }) = _RecepDashboardResponse;

  factory RecepDashboardResponse.fromJson(Map<String, dynamic> json) =>
      _$RecepDashboardResponseFromJson(json);
}
