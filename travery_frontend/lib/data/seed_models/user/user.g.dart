// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['id'] as String?,
  fullName: json['full_name'] as String,
  email: json['email'] as String,
  phoneNumber: json['phone_number'] as String?,
  passwordHash: json['password_hash'] as String?,
  avatarUrl: json['avatar_url'] as String?,
  status: $enumDecode(_$UserStatusEnumMap, json['status']),
  authProvider: $enumDecode(_$AuthProviderEnumMap, json['auth_provider']),
  cometchatUid: json['cometchat_uid'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'] == null
      ? null
      : DateTime.parse(json['deleted_at'] as String),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'full_name': instance.fullName,
  'email': instance.email,
  'phone_number': instance.phoneNumber,
  'password_hash': instance.passwordHash,
  'avatar_url': instance.avatarUrl,
  'status': _$UserStatusEnumMap[instance.status]!,
  'auth_provider': _$AuthProviderEnumMap[instance.authProvider]!,
  'cometchat_uid': instance.cometchatUid,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'deleted_at': instance.deletedAt?.toIso8601String(),
};

const _$UserStatusEnumMap = {
  UserStatus.active: 'active',
  UserStatus.pending: 'pending',
  UserStatus.disabled: 'disabled',
};

const _$AuthProviderEnumMap = {
  AuthProvider.google: 'google',
  AuthProvider.local: 'local',
};
