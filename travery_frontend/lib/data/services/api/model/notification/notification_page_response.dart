import 'package:freezed_annotation/freezed_annotation.dart';
import 'notification_model.dart';

part 'notification_page_response.freezed.dart';
part 'notification_page_response.g.dart';

@freezed
abstract class NotificationPageResponse with _$NotificationPageResponse {
  const factory NotificationPageResponse({
    @Default([]) List<NotificationModel> content,
    @Default(0) int totalElements,
    @Default(0) int totalPages,
    @Default(0) int size,
    @Default(0) int number,
    @Default(true) bool first,
    @Default(true) bool last,
    @Default(true) bool empty,
  }) = _NotificationPageResponse;

  factory NotificationPageResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationPageResponseFromJson(json);
}
