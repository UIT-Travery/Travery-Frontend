// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destination_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DestinationResponseImpl _$$DestinationResponseImplFromJson(
  Map<String, dynamic> json,
) => _$DestinationResponseImpl(
  id: json['id'] as String?,
  code: json['code'] as String?,
  name: json['name'] as String?,
  region: json['region'] as String?,
  imageUrl: json['imageUrl'] as String?,
  description: json['description'] as String?,
);

Map<String, dynamic> _$$DestinationResponseImplToJson(
  _$DestinationResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'name': instance.name,
  'region': instance.region,
  'imageUrl': instance.imageUrl,
  'description': instance.description,
};
