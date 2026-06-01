import 'package:freezed_annotation/freezed_annotation.dart';

part 'refund_policy_response.freezed.dart';
part 'refund_policy_response.g.dart';

@freezed
class RefundPolicyRuleResponse with _$RefundPolicyRuleResponse {
  const factory RefundPolicyRuleResponse({
    String? id,
    double? timeBefore,
    String? timeUnit,
    double? refundPercentage,
  }) = _RefundPolicyRuleResponse;

  factory RefundPolicyRuleResponse.fromJson(Map<String, dynamic> json) =>
      _$RefundPolicyRuleResponseFromJson(json);
}

@freezed
class RefundPolicyResponse with _$RefundPolicyResponse {
  const factory RefundPolicyResponse({
    String? id,
    String? name,
    String? serviceType,
    @Default([]) List<RefundPolicyRuleResponse> rules,
  }) = _RefundPolicyResponse;

  factory RefundPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$RefundPolicyResponseFromJson(json);
}
