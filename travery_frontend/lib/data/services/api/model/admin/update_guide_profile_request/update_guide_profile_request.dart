import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_guide_profile_request.freezed.dart';
part 'update_guide_profile_request.g.dart';

/// Matches UpdateGuideProfileRequest schema.
@freezed
class UpdateGuideProfileRequest with _$UpdateGuideProfileRequest {
  const factory UpdateGuideProfileRequest({
    String? fullName,
    String? phoneNumber,
    String? guideLicense,
    int? yearsExperience,
    List<String>? languages,
  }) = _UpdateGuideProfileRequest;

  factory UpdateGuideProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateGuideProfileRequestFromJson(json);
}
