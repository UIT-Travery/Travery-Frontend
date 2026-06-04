import 'package:freezed_annotation/freezed_annotation.dart';

part 'refund_response.freezed.dart';
part 'refund_response.g.dart';

@freezed
class RefundResponse with _$RefundResponse {
  const factory RefundResponse({
    required String id,
    required String userId,
    required String userName,
    required String userEmail,
    required double requestedAmount,
    double? actualRefunded,
    String? customerReason,
    String? rejectReason,
    required String bookingType,
    String? bankName,
    String? accountNumber,
    String? accountHolderName,
    required String createdAt,
    required String updatedAt,
  }) = _RefundResponse;

  factory RefundResponse.fromJson(Map<String, dynamic> json) =>
      _$RefundResponseFromJson(json);
}
