// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_user_page_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminUserPageResponseImpl _$$AdminUserPageResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AdminUserPageResponseImpl(
  content:
      (json['content'] as List<dynamic>?)
          ?.map((e) => AdminUserResponse.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  totalElements: (json['totalElements'] as num?)?.toInt() ?? 0,
  totalPages: (json['totalPages'] as num?)?.toInt() ?? 0,
  size: (json['size'] as num?)?.toInt() ?? 20,
  number: (json['number'] as num?)?.toInt() ?? 0,
  last: json['last'] as bool? ?? false,
  first: json['first'] as bool? ?? false,
);

Map<String, dynamic> _$$AdminUserPageResponseImplToJson(
  _$AdminUserPageResponseImpl instance,
) => <String, dynamic>{
  'content': instance.content,
  'totalElements': instance.totalElements,
  'totalPages': instance.totalPages,
  'size': instance.size,
  'number': instance.number,
  'last': instance.last,
  'first': instance.first,
};
