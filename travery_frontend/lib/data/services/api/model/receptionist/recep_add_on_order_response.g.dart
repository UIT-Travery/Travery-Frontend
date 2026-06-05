// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recep_add_on_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecepAddOnOrderResponseImpl _$$RecepAddOnOrderResponseImplFromJson(
  Map<String, dynamic> json,
) => _$RecepAddOnOrderResponseImpl(
  id: json['id'] as String,
  serviceName: json['serviceName'] as String,
  category: json['category'] as String,
  quantity: (json['quantity'] as num).toInt(),
  unitPrice: (json['unitPrice'] as num).toInt(),
  totalPrice: (json['totalPrice'] as num).toInt(),
  scheduledTime: json['scheduledTime'] as String,
  status: json['status'] as String,
);

Map<String, dynamic> _$$RecepAddOnOrderResponseImplToJson(
  _$RecepAddOnOrderResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'serviceName': instance.serviceName,
  'category': instance.category,
  'quantity': instance.quantity,
  'unitPrice': instance.unitPrice,
  'totalPrice': instance.totalPrice,
  'scheduledTime': instance.scheduledTime,
  'status': instance.status,
};
