// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_payment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreatePaymentResponseImpl _$$CreatePaymentResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CreatePaymentResponseImpl(
  httpStatus: (json['httpStatus'] as num).toInt(),
  message: json['message'] as String,
  data: PaymentResponseData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$CreatePaymentResponseImplToJson(
  _$CreatePaymentResponseImpl instance,
) => <String, dynamic>{
  'httpStatus': instance.httpStatus,
  'message': instance.message,
  'data': instance.data,
};

_$PaymentResponseDataImpl _$$PaymentResponseDataImplFromJson(
  Map<String, dynamic> json,
) => _$PaymentResponseDataImpl(
  transactionId: json['transactionId'] as String,
  amount: (json['amount'] as num).toDouble(),
  paymentUrl: json['paymentUrl'] as String,
  expiresAt: json['expiresAt'] as String?,
);

Map<String, dynamic> _$$PaymentResponseDataImplToJson(
  _$PaymentResponseDataImpl instance,
) => <String, dynamic>{
  'transactionId': instance.transactionId,
  'amount': instance.amount,
  'paymentUrl': instance.paymentUrl,
  'expiresAt': instance.expiresAt,
};
