import 'package:freezed_annotation/freezed_annotation.dart';

part 'staff.freezed.dart';
part 'staff.g.dart';

@freezed
abstract class Staff with _$Staff {
  const factory Staff({
    String? id,

    @JsonKey(name: 'hotel_id') String? hotelId,

    @JsonKey(name: 'full_name') required String fullName,

    required String email,

    @JsonKey(name: 'phone_number') String? phoneNumber,

    @JsonKey(name: 'password_hash') String? passwordHash,

    required StaffRole role,

    required StaffStatus status,

    @JsonKey(name: 'cometchat_uid') String? cometchatUid,

    @JsonKey(name: 'created_at') DateTime? createdAt,

    @JsonKey(name: 'updated_at') DateTime? updatedAt,

    @JsonKey(name: 'deleted_at') DateTime? deletedAt,
  }) = _Staff;

  factory Staff.fromJson(Map<String, dynamic> json) => _$StaffFromJson(json);
}

@JsonEnum()
enum StaffRole { admin, coordinator, guide, receptionist }

@JsonEnum()
enum StaffStatus { active, disabled }
