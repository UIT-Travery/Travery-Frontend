// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_guide_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateGuideProfileRequestImpl _$$UpdateGuideProfileRequestImplFromJson(
  Map<String, dynamic> json,
) => _$UpdateGuideProfileRequestImpl(
  fullName: json['fullName'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  guideLicense: json['guideLicense'] as String?,
  yearsExperience: (json['yearsExperience'] as num?)?.toInt(),
  languages: (json['languages'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$$UpdateGuideProfileRequestImplToJson(
  _$UpdateGuideProfileRequestImpl instance,
) => <String, dynamic>{
  'fullName': instance.fullName,
  'phoneNumber': instance.phoneNumber,
  'guideLicense': instance.guideLicense,
  'yearsExperience': instance.yearsExperience,
  'languages': instance.languages,
};
