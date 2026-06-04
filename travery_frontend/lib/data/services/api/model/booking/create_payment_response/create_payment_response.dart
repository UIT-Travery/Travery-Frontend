import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_payment_response.freezed.dart';
part 'create_payment_response.g.dart';

@freezed
class CreatePaymentResponse with _$CreatePaymentResponse {
  const factory CreatePaymentResponse({
    required int httpStatus,
    required String message,
    required PaymentResponseData data,
  }) = _CreatePaymentResponse;

  factory CreatePaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$CreatePaymentResponseFromJson(json);
}

@freezed
class PaymentResponseData with _$PaymentResponseData {
  const factory PaymentResponseData({
    required String transactionId,
    required double amount,
    required String paymentUrl,
    String? expiresAt,
  }) = _PaymentResponseData;

  factory PaymentResponseData.fromJson(Map<String, dynamic> json) =>
      _$PaymentResponseDataFromJson(json);
}
