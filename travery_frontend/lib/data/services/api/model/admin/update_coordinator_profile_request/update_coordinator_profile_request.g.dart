// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_coordinator_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateCoordinatorProfileRequest _$UpdateCoordinatorProfileRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateCoordinatorProfileRequest(
  fullName: json['fullName'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  department: json['department'] as String?,
);

Map<String, dynamic> _$UpdateCoordinatorProfileRequestToJson(
  _UpdateCoordinatorProfileRequest instance,
) => <String, dynamic>{
  'fullName': instance.fullName,
  'phoneNumber': instance.phoneNumber,
  'department': instance.department,
};
