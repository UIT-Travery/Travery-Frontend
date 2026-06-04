// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_admin_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateAdminProfileRequest _$UpdateAdminProfileRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateAdminProfileRequest(
  fullName: json['fullName'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
);

Map<String, dynamic> _$UpdateAdminProfileRequestToJson(
  _UpdateAdminProfileRequest instance,
) => <String, dynamic>{
  'fullName': instance.fullName,
  'phoneNumber': instance.phoneNumber,
};
