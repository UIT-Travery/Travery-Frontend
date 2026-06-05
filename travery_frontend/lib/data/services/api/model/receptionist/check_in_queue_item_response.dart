import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_in_queue_item_response.freezed.dart';
part 'check_in_queue_item_response.g.dart';

@freezed
abstract class CheckInQueueItemResponse with _$CheckInQueueItemResponse {
  factory CheckInQueueItemResponse({
    @Default('') String bookingId,
    @Default('') String touristName,
    @Default('') String phoneNumber,
    @Default(0) int memberCount,
    @Default(0) int totalRooms,
    @Default({}) Map<String, int> roomTypeBreakdown,
  }) = _CheckInQueueItemResponse;

  factory CheckInQueueItemResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckInQueueItemResponseFromJson(json);
}
