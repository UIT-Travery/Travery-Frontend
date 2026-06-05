import 'package:freezed_annotation/freezed_annotation.dart';

part 'driver.freezed.dart';
part 'driver.g.dart';

@freezed
abstract class Driver with _$Driver {
  const factory Driver({
    String? id,

    @JsonKey(name: 'full_name') required String fullName,

    required String phone,

    @JsonKey(name: 'license_number') required String licenseNumber,

    required DriverStatus status,

    @JsonKey(name: 'created_at') DateTime? createdAt,

    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Driver;

  factory Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);
}

@JsonEnum()
enum DriverStatus { available, onTrip, offDuty }
