import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_seat.freezed.dart';
part 'vehicle_seat.g.dart';

@freezed
abstract class VehicleSeat with _$VehicleSeat {
  const factory VehicleSeat({
    String? id,

    @JsonKey(name: 'vehicle_id') required String vehicleId,

    @JsonKey(name: 'seat_code') required String seatCode,

    required int floor,

    required SeatRowZone rowZone,

    @JsonKey(name: 'created_at') DateTime? createdAt,

    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _VehicleSeat;

  factory VehicleSeat.fromJson(Map<String, dynamic> json) =>
      _$VehicleSeatFromJson(json);
}

@JsonEnum()
enum SeatRowZone { front, middle, rear }
