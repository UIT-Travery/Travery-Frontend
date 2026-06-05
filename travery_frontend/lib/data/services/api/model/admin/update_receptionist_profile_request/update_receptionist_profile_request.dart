import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_receptionist_profile_request.freezed.dart';
part 'update_receptionist_profile_request.g.dart';

/// Matches UpdateReceptionistProfileRequest schema.
@freezed
abstract class UpdateReceptionistProfileRequest with _$UpdateReceptionistProfileRequest {
  const factory UpdateReceptionistProfileRequest({
    String? fullName,
    String? phoneNumber,
    /// One of: MORNING, EVENING, NIGHT
    String? shiftType,
    String? hotelId,
  }) = _UpdateReceptionistProfileRequest;

  factory UpdateReceptionistProfileRequest.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateReceptionistProfileRequestFromJson(json);
}
