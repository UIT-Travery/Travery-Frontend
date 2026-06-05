import 'package:freezed_annotation/freezed_annotation.dart';

part 'recep_room_response.freezed.dart';
part 'recep_room_response.g.dart';

@freezed
abstract class RecepRoomResponse with _$RecepRoomResponse {
  factory RecepRoomResponse({
    required String id,
    required String roomNumber,
    required String roomTypeName,
    required String status,
    int? floor,
  }) = _RecepRoomResponse;

  factory RecepRoomResponse.fromJson(Map<String, dynamic> json) =>
      _$RecepRoomResponseFromJson(json);
}
