// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refund_policy_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RefundPolicyRuleRequest _$RefundPolicyRuleRequestFromJson(
  Map<String, dynamic> json,
) => _RefundPolicyRuleRequest(
  timeBefore: (json['timeBefore'] as num).toDouble(),
  timeUnit: json['timeUnit'] as String,
  refundPercentage: (json['refundPercentage'] as num).toDouble(),
);

Map<String, dynamic> _$RefundPolicyRuleRequestToJson(
  _RefundPolicyRuleRequest instance,
) => <String, dynamic>{
  'timeBefore': instance.timeBefore,
  'timeUnit': instance.timeUnit,
  'refundPercentage': instance.refundPercentage,
};

_RefundPolicyRequest _$RefundPolicyRequestFromJson(Map<String, dynamic> json) =>
    _RefundPolicyRequest(
      name: json['name'] as String,
      serviceType: json['serviceType'] as String,
      rules: (json['rules'] as List<dynamic>)
          .map(
            (e) => RefundPolicyRuleRequest.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$RefundPolicyRequestToJson(
  _RefundPolicyRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'serviceType': instance.serviceType,
  'rules': instance.rules,
};
