import 'package:freezed_annotation/freezed_annotation.dart';

part 'available_room_response.freezed.dart';
part 'available_room_response.g.dart';

@freezed
class AvailableRoomResponse with _$AvailableRoomResponse {
  factory AvailableRoomResponse({
    String? id,
    String? roomNumber,
    String? roomTypeName,
    String? status,
    int? floor,
  }) = _AvailableRoomResponse;

  factory AvailableRoomResponse.fromJson(Map<String, dynamic> json) =>
      _$AvailableRoomResponseFromJson(json);
}
