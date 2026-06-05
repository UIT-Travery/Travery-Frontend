import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_admin_profile_request.freezed.dart';
part 'update_admin_profile_request.g.dart';

@freezed
abstract class UpdateAdminProfileRequest with _$UpdateAdminProfileRequest {
  const factory UpdateAdminProfileRequest({
    String? fullName,
    String? phoneNumber,
  }) = _UpdateAdminProfileRequest;

  factory UpdateAdminProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateAdminProfileRequestFromJson(json);
}
