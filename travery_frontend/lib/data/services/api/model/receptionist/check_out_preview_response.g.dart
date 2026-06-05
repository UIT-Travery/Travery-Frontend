// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_out_preview_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CheckOutPreviewResponseImpl _$$CheckOutPreviewResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CheckOutPreviewResponseImpl(
  bookingId: json['bookingId'] as String,
  roomCharges: json['roomCharges'] as num,
  addOnCharges: json['addOnCharges'] as num,
  lateFees: json['lateFees'] as num,
  totalBill: json['totalBill'] as num,
  unpaidAddOns: (json['unpaidAddOns'] as List<dynamic>)
      .map((e) => RecepAddOnOrderResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$CheckOutPreviewResponseImplToJson(
  _$CheckOutPreviewResponseImpl instance,
) => <String, dynamic>{
  'bookingId': instance.bookingId,
  'roomCharges': instance.roomCharges,
  'addOnCharges': instance.addOnCharges,
  'lateFees': instance.lateFees,
  'totalBill': instance.totalBill,
  'unpaidAddOns': instance.unpaidAddOns,
};
