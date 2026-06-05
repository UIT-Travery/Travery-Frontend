import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:travery_frontend/data/services/api/model/admin/admin_user_response/admin_user_response.dart';

part 'admin_user_page_response.freezed.dart';
part 'admin_user_page_response.g.dart';

@freezed
abstract class AdminUserPageResponse with _$AdminUserPageResponse {
  const factory AdminUserPageResponse({
    @Default([]) List<AdminUserResponse> content,
    @Default(0) int totalElements,
    @Default(0) int totalPages,
    @Default(20) int size,
    @Default(0) int number,
    @Default(false) bool last,
    @Default(false) bool first,
  }) = _AdminUserPageResponse;

  factory AdminUserPageResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminUserPageResponseFromJson(json);
}
