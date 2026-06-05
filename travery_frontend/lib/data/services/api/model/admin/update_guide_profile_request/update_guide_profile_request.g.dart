// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_guide_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateGuideProfileRequest _$UpdateGuideProfileRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateGuideProfileRequest(
  fullName: json['fullName'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  guideLicense: json['guideLicense'] as String?,
  yearsExperience: (json['yearsExperience'] as num?)?.toInt(),
  languages: (json['languages'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$UpdateGuideProfileRequestToJson(
  _UpdateGuideProfileRequest instance,
) => <String, dynamic>{
  'fullName': instance.fullName,
  'phoneNumber': instance.phoneNumber,
  'guideLicense': instance.guideLicense,
  'yearsExperience': instance.yearsExperience,
  'languages': instance.languages,
};
