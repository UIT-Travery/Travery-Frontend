// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminUserResponse _$AdminUserResponseFromJson(Map<String, dynamic> json) =>
    _AdminUserResponse(
      id: json['id'] as String,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      status: json['status'] as String?,
      role: json['role'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$AdminUserResponseToJson(_AdminUserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'avatarUrl': instance.avatarUrl,
      'status': instance.status,
      'role': instance.role,
      'createdAt': instance.createdAt,
    };
