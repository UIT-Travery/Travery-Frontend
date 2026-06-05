// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Staff _$StaffFromJson(Map<String, dynamic> json) => _Staff(
  id: json['id'] as String?,
  hotelId: json['hotel_id'] as String?,
  fullName: json['full_name'] as String,
  email: json['email'] as String,
  phoneNumber: json['phone_number'] as String?,
  passwordHash: json['password_hash'] as String?,
  role: $enumDecode(_$StaffRoleEnumMap, json['role']),
  status: $enumDecode(_$StaffStatusEnumMap, json['status']),
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

Map<String, dynamic> _$StaffToJson(_Staff instance) => <String, dynamic>{
  'id': instance.id,
  'hotel_id': instance.hotelId,
  'full_name': instance.fullName,
  'email': instance.email,
  'phone_number': instance.phoneNumber,
  'password_hash': instance.passwordHash,
  'role': _$StaffRoleEnumMap[instance.role]!,
  'status': _$StaffStatusEnumMap[instance.status]!,
  'cometchat_uid': instance.cometchatUid,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'deleted_at': instance.deletedAt?.toIso8601String(),
};

const _$StaffRoleEnumMap = {
  StaffRole.admin: 'admin',
  StaffRole.coordinator: 'coordinator',
  StaffRole.guide: 'guide',
  StaffRole.receptionist: 'receptionist',
};

const _$StaffStatusEnumMap = {
  StaffStatus.active: 'active',
  StaffStatus.disabled: 'disabled',
};
