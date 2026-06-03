// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_payment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreatePaymentResponse _$CreatePaymentResponseFromJson(
  Map<String, dynamic> json,
) => _CreatePaymentResponse(
  httpStatus: (json['httpStatus'] as num).toInt(),
  message: json['message'] as String,
  data: PaymentResponseData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CreatePaymentResponseToJson(
  _CreatePaymentResponse instance,
) => <String, dynamic>{
  'httpStatus': instance.httpStatus,
  'message': instance.message,
  'data': instance.data,
};

_PaymentResponseData _$PaymentResponseDataFromJson(Map<String, dynamic> json) =>
    _PaymentResponseData(
      transactionId: json['transactionId'] as String,
      amount: (json['amount'] as num).toDouble(),
      paymentUrl: json['paymentUrl'] as String,
      expiresAt: json['expiresAt'] as String?,
    );

Map<String, dynamic> _$PaymentResponseDataToJson(
  _PaymentResponseData instance,
) => <String, dynamic>{
  'transactionId': instance.transactionId,
  'amount': instance.amount,
  'paymentUrl': instance.paymentUrl,
  'expiresAt': instance.expiresAt,
};
