import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_user_response.freezed.dart';
part 'admin_user_response.g.dart';

@freezed
abstract class AdminUserResponse with _$AdminUserResponse {
  const factory AdminUserResponse({
    required String id,
    String? fullName,
    String? email,
    String? phoneNumber,
    String? avatarUrl,
    String? status,
    String? role,
    String? createdAt,
  }) = _AdminUserResponse;

  factory AdminUserResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminUserResponseFromJson(json);
}
