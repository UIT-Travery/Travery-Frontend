// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_in_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CheckInRequest _$CheckInRequestFromJson(Map<String, dynamic> json) =>
    _CheckInRequest(
      roomIds: (json['roomIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CheckInRequestToJson(_CheckInRequest instance) =>
    <String, dynamic>{'roomIds': instance.roomIds};
