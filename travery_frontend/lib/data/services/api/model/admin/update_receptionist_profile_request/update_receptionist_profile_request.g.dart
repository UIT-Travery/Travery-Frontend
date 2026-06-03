// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_receptionist_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateReceptionistProfileRequest _$UpdateReceptionistProfileRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateReceptionistProfileRequest(
  fullName: json['fullName'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  shiftType: json['shiftType'] as String?,
  hotelId: json['hotelId'] as String?,
);

Map<String, dynamic> _$UpdateReceptionistProfileRequestToJson(
  _UpdateReceptionistProfileRequest instance,
) => <String, dynamic>{
  'fullName': instance.fullName,
  'phoneNumber': instance.phoneNumber,
  'shiftType': instance.shiftType,
  'hotelId': instance.hotelId,
};
