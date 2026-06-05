import 'package:freezed_annotation/freezed_annotation.dart';

import '../vehicle_seat/vehicle_seat.dart';

part 'vehicle.freezed.dart';
part 'vehicle.g.dart';

@freezed
abstract class Vehicle with _$Vehicle {
  const factory Vehicle({
    String? id,

    @JsonKey(name: 'license_plate') required String licensePlate,

    required VehicleType vehicleType,

    @JsonKey(name: 'total_seats') required int totalSeats,

    @JsonKey(name: 'floor_count') required int floorCount,

    required CoachStatus status,

    @JsonKey(name: 'created_at') DateTime? createdAt,

    @JsonKey(name: 'updated_at') DateTime? updatedAt,

    /// RELATIONS
    List<VehicleSeat>? seats,
  }) = _Vehicle;

  factory Vehicle.fromJson(Map<String, dynamic> json) =>
      _$VehicleFromJson(json);
}

@JsonEnum()
enum VehicleType { seat, sleeper, limosine }

@JsonEnum()
enum CoachStatus { active, maintenance, retired }

