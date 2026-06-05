// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_out_preview_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CheckOutPreviewResponse _$CheckOutPreviewResponseFromJson(
  Map<String, dynamic> json,
) => _CheckOutPreviewResponse(
  bookingId: json['bookingId'] as String,
  roomCharges: json['roomCharges'] as num,
  addOnCharges: json['addOnCharges'] as num,
  lateFees: json['lateFees'] as num,
  totalBill: json['totalBill'] as num,
  unpaidAddOns: (json['unpaidAddOns'] as List<dynamic>)
      .map((e) => RecepAddOnOrderResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CheckOutPreviewResponseToJson(
  _CheckOutPreviewResponse instance,
) => <String, dynamic>{
  'bookingId': instance.bookingId,
  'roomCharges': instance.roomCharges,
  'addOnCharges': instance.addOnCharges,
  'lateFees': instance.lateFees,
  'totalBill': instance.totalBill,
  'unpaidAddOns': instance.unpaidAddOns,
};
