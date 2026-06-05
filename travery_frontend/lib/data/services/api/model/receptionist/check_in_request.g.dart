// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_in_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CheckInRequestImpl _$$CheckInRequestImplFromJson(Map<String, dynamic> json) =>
    _$CheckInRequestImpl(
      roomIds: (json['roomIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$CheckInRequestImplToJson(
  _$CheckInRequestImpl instance,
) => <String, dynamic>{'roomIds': instance.roomIds};
