import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    String? id,

    @JsonKey(name: 'full_name') required String fullName,

    required String email,

    @JsonKey(name: 'phone_number') String? phoneNumber,

    @JsonKey(name: 'password_hash') String? passwordHash,

    @JsonKey(name: 'avatar_url') String? avatarUrl,

    required UserStatus status,

    @JsonKey(name: 'auth_provider') required AuthProvider authProvider,

    @JsonKey(name: 'cometchat_uid') String? cometchatUid,

    @JsonKey(name: 'created_at') DateTime? createdAt,

    @JsonKey(name: 'updated_at') DateTime? updatedAt,

    @JsonKey(name: 'deleted_at') DateTime? deletedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@JsonEnum()
enum UserStatus { active, pending, disabled }

@JsonEnum()
enum AuthProvider { google, local }
