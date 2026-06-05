import 'package:freezed_annotation/freezed_annotation.dart';

part 'station.freezed.dart';
part 'station.g.dart';

@freezed
abstract class Station with _$Station {
  const factory Station({
    String? id,

    @JsonKey(name: 'location_code') required String locationCode,

    required String name,

    String? address,

    @JsonKey(name: 'is_pickup_point') required bool isPickupPoint,

    @JsonKey(name: 'is_dropoff_point') required bool isDropoffPoint,

    @JsonKey(name: 'is_active') required bool isActive,

    @JsonKey(name: 'created_at') DateTime? createdAt,

    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Station;

  factory Station.fromJson(Map<String, dynamic> json) =>
      _$StationFromJson(json);
}
