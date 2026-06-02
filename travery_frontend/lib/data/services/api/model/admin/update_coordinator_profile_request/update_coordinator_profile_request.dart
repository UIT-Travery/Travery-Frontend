import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_coordinator_profile_request.freezed.dart';
part 'update_coordinator_profile_request.g.dart';

/// Matches UpdateCoordinatorProfileRequest schema.
@freezed
class UpdateCoordinatorProfileRequest with _$UpdateCoordinatorProfileRequest {
  const factory UpdateCoordinatorProfileRequest({
    String? fullName,
    String? phoneNumber,
    /// One of: TOUR, HOTEL, COACH
    String? department,
  }) = _UpdateCoordinatorProfileRequest;

  factory UpdateCoordinatorProfileRequest.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateCoordinatorProfileRequestFromJson(json);
}
