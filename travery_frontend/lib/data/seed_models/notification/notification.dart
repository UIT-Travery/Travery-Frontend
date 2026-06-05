import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
abstract class AppNotification with _$AppNotification {
  const factory AppNotification({
    String? id,

    @JsonKey(name: 'user_id') String? userId,

    @JsonKey(name: 'staff_id') String? staffId,

    required String notificationType,

    required String title,

    String? body,

    @JsonKey(name: 'reference_type') String? referenceType,

    String? referenceId,

    @JsonKey(name: 'is_read') required bool isRead,

    @JsonKey(name: 'read_at') DateTime? readAt,

    @JsonKey(name: 'sent_at') DateTime? sentAt,

    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _AppNotification;

  factory AppNotification.fromJson(Map<String, dynamic> json) =>
      _$AppNotificationFromJson(json);
}
