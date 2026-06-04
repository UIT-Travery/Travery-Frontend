// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refund_policy_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RefundPolicyRuleRequestImpl _$$RefundPolicyRuleRequestImplFromJson(
  Map<String, dynamic> json,
) => _$RefundPolicyRuleRequestImpl(
  timeBefore: (json['timeBefore'] as num).toDouble(),
  timeUnit: json['timeUnit'] as String,
  refundPercentage: (json['refundPercentage'] as num).toDouble(),
);

Map<String, dynamic> _$$RefundPolicyRuleRequestImplToJson(
  _$RefundPolicyRuleRequestImpl instance,
) => <String, dynamic>{
  'timeBefore': instance.timeBefore,
  'timeUnit': instance.timeUnit,
  'refundPercentage': instance.refundPercentage,
};

_$RefundPolicyRequestImpl _$$RefundPolicyRequestImplFromJson(
  Map<String, dynamic> json,
) => _$RefundPolicyRequestImpl(
  name: json['name'] as String,
  serviceType: json['serviceType'] as String,
  rules: (json['rules'] as List<dynamic>)
      .map((e) => RefundPolicyRuleRequest.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$RefundPolicyRequestImplToJson(
  _$RefundPolicyRequestImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'serviceType': instance.serviceType,
  'rules': instance.rules,
};
