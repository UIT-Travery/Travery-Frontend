// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_receptionist_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateReceptionistProfileRequestImpl
_$$UpdateReceptionistProfileRequestImplFromJson(Map<String, dynamic> json) =>
    _$UpdateReceptionistProfileRequestImpl(
      fullName: json['fullName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      shiftType: json['shiftType'] as String?,
      hotelId: json['hotelId'] as String?,
    );

Map<String, dynamic> _$$UpdateReceptionistProfileRequestImplToJson(
  _$UpdateReceptionistProfileRequestImpl instance,
) => <String, dynamic>{
  'fullName': instance.fullName,
  'phoneNumber': instance.phoneNumber,
  'shiftType': instance.shiftType,
  'hotelId': instance.hotelId,
};
