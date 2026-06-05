import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_tourist_profile_request.freezed.dart';
part 'update_tourist_profile_request.g.dart';

@freezed
abstract class UpdateTouristProfileRequest with _$UpdateTouristProfileRequest {
  const factory UpdateTouristProfileRequest({
    String? fullName,
    String? phoneNumber,
  }) = _UpdateTouristProfileRequest;

  factory UpdateTouristProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateTouristProfileRequestFromJson(json);
}
