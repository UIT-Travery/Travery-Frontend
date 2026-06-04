// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refund_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RefundResponseImpl _$$RefundResponseImplFromJson(Map<String, dynamic> json) =>
    _$RefundResponseImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      userEmail: json['userEmail'] as String,
      requestedAmount: (json['requestedAmount'] as num).toDouble(),
      actualRefunded: (json['actualRefunded'] as num?)?.toDouble(),
      customerReason: json['customerReason'] as String?,
      rejectReason: json['rejectReason'] as String?,
      bookingType: json['bookingType'] as String,
      bankName: json['bankName'] as String?,
      accountNumber: json['accountNumber'] as String?,
      accountHolderName: json['accountHolderName'] as String?,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$RefundResponseImplToJson(
  _$RefundResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'userName': instance.userName,
  'userEmail': instance.userEmail,
  'requestedAmount': instance.requestedAmount,
  'actualRefunded': instance.actualRefunded,
  'customerReason': instance.customerReason,
  'rejectReason': instance.rejectReason,
  'bookingType': instance.bookingType,
  'bankName': instance.bankName,
  'accountNumber': instance.accountNumber,
  'accountHolderName': instance.accountHolderName,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};
