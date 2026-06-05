import 'package:freezed_annotation/freezed_annotation.dart';
import 'notification_page_response.dart';

part 'notification_response.freezed.dart';
part 'notification_response.g.dart';

@freezed
abstract class NotificationResponse with _$NotificationResponse {
  const factory NotificationResponse({
    required NotificationPageResponse notifications,
    @Default(0) int unreadCount,
  }) = _NotificationResponse;

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseFromJson(json);
}
