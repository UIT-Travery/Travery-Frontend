// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refund_policy_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RefundPolicyRuleResponse _$RefundPolicyRuleResponseFromJson(
  Map<String, dynamic> json,
) => _RefundPolicyRuleResponse(
  id: json['id'] as String?,
  timeBefore: (json['timeBefore'] as num?)?.toDouble(),
  timeUnit: json['timeUnit'] as String?,
  refundPercentage: (json['refundPercentage'] as num?)?.toDouble(),
);

Map<String, dynamic> _$RefundPolicyRuleResponseToJson(
  _RefundPolicyRuleResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'timeBefore': instance.timeBefore,
  'timeUnit': instance.timeUnit,
  'refundPercentage': instance.refundPercentage,
};

_RefundPolicyResponse _$RefundPolicyResponseFromJson(
  Map<String, dynamic> json,
) => _RefundPolicyResponse(
  id: json['id'] as String?,
  name: json['name'] as String?,
  serviceType: json['serviceType'] as String?,
  rules:
      (json['rules'] as List<dynamic>?)
          ?.map(
            (e) => RefundPolicyRuleResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$RefundPolicyResponseToJson(
  _RefundPolicyResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'serviceType': instance.serviceType,
  'rules': instance.rules,
};
