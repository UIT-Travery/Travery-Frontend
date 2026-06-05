import 'package:freezed_annotation/freezed_annotation.dart';

part 'refund_policy_request.freezed.dart';
part 'refund_policy_request.g.dart';

@freezed
abstract class RefundPolicyRuleRequest with _$RefundPolicyRuleRequest {
  const factory RefundPolicyRuleRequest({
    required double timeBefore,
    required String timeUnit,
    required double refundPercentage,
  }) = _RefundPolicyRuleRequest;

  factory RefundPolicyRuleRequest.fromJson(Map<String, dynamic> json) =>
      _$RefundPolicyRuleRequestFromJson(json);
}

@freezed
abstract class RefundPolicyRequest with _$RefundPolicyRequest {
  const factory RefundPolicyRequest({
    required String name,
    required String serviceType,
    required List<RefundPolicyRuleRequest> rules,
  }) = _RefundPolicyRequest;

  factory RefundPolicyRequest.fromJson(Map<String, dynamic> json) =>
      _$RefundPolicyRequestFromJson(json);
}
