// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addon_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddonOrder _$AddonOrderFromJson(Map<String, dynamic> json) => _AddonOrder(
  id: json['id'] as String?,
  hotelBookingId: json['hotel_booking_id'] as String?,
  tourBookingId: json['tour_booking_id'] as String?,
  serviceType: $enumDecode(_$AddonServiceTypeEnumMap, json['serviceType']),
  mealServiceId: json['meal_service_id'] as String?,
  spaServiceId: json['spa_service_id'] as String?,
  laundryServiceId: json['laundry_service_id'] as String?,
  quantity: (json['quantity'] as num).toInt(),
  weightKg: (json['weight_kg'] as num?)?.toDouble(),
  laundryUnitPrice: (json['laundry_unit_price'] as num?)?.toDouble(),
  mealUnitPrice: (json['meal_unit_price'] as num?)?.toDouble(),
  spaUnitPrice: (json['spa_unit_price'] as num?)?.toDouble(),
  totalPrice: (json['totalPrice'] as num).toDouble(),
  scheduledAt: json['scheduled_at'] == null
      ? null
      : DateTime.parse(json['scheduled_at'] as String),
  specialNotes: json['special_notes'] as String?,
  status: $enumDecode(_$AddonOrderStatusEnumMap, json['status']),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$AddonOrderToJson(_AddonOrder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hotel_booking_id': instance.hotelBookingId,
      'tour_booking_id': instance.tourBookingId,
      'serviceType': _$AddonServiceTypeEnumMap[instance.serviceType]!,
      'meal_service_id': instance.mealServiceId,
      'spa_service_id': instance.spaServiceId,
      'laundry_service_id': instance.laundryServiceId,
      'quantity': instance.quantity,
      'weight_kg': instance.weightKg,
      'laundry_unit_price': instance.laundryUnitPrice,
      'meal_unit_price': instance.mealUnitPrice,
      'spa_unit_price': instance.spaUnitPrice,
      'totalPrice': instance.totalPrice,
      'scheduled_at': instance.scheduledAt?.toIso8601String(),
      'special_notes': instance.specialNotes,
      'status': _$AddonOrderStatusEnumMap[instance.status]!,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

const _$AddonServiceTypeEnumMap = {
  AddonServiceType.meal: 'meal',
  AddonServiceType.spa: 'spa',
  AddonServiceType.laundry: 'laundry',
};

const _$AddonOrderStatusEnumMap = {
  AddonOrderStatus.ordered: 'ordered',
  AddonOrderStatus.inProgress: 'inProgress',
  AddonOrderStatus.fulfilled: 'fulfilled',
  AddonOrderStatus.cancelled: 'cancelled',
};
