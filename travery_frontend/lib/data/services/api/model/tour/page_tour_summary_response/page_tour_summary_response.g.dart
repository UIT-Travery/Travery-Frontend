// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_tour_summary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PageTourSummaryResponse _$PageTourSummaryResponseFromJson(
  Map<String, dynamic> json,
) => _PageTourSummaryResponse(
  content:
      (json['content'] as List<dynamic>?)
          ?.map((e) => TourSummaryResponse.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  totalElements: (json['totalElements'] as num?)?.toInt() ?? 0,
  totalPages: (json['totalPages'] as num?)?.toInt() ?? 0,
  size: (json['size'] as num?)?.toInt() ?? 0,
  number: (json['number'] as num?)?.toInt() ?? 0,
  first: json['first'] as bool? ?? true,
  last: json['last'] as bool? ?? true,
  empty: json['empty'] as bool? ?? true,
);

Map<String, dynamic> _$PageTourSummaryResponseToJson(
  _PageTourSummaryResponse instance,
) => <String, dynamic>{
  'content': instance.content,
  'totalElements': instance.totalElements,
  'totalPages': instance.totalPages,
  'size': instance.size,
  'number': instance.number,
  'first': instance.first,
  'last': instance.last,
  'empty': instance.empty,
};
