import 'package:freezed_annotation/freezed_annotation.dart';

part 'addon_order.freezed.dart';
part 'addon_order.g.dart';

@freezed
abstract class AddonOrder with _$AddonOrder {
  const factory AddonOrder({
    String? id,

    @JsonKey(name: 'hotel_booking_id') String? hotelBookingId,

    @JsonKey(name: 'tour_booking_id') String? tourBookingId,

    required AddonServiceType serviceType,

    @JsonKey(name: 'meal_service_id') String? mealServiceId,

    @JsonKey(name: 'spa_service_id') String? spaServiceId,

    @JsonKey(name: 'laundry_service_id') String? laundryServiceId,

    required int quantity,

    @JsonKey(name: 'weight_kg') double? weightKg,

    @JsonKey(name: 'laundry_unit_price') double? laundryUnitPrice,

    @JsonKey(name: 'meal_unit_price') double? mealUnitPrice,

    @JsonKey(name: 'spa_unit_price') double? spaUnitPrice,

    required double totalPrice,

    @JsonKey(name: 'scheduled_at') DateTime? scheduledAt,

    @JsonKey(name: 'special_notes') String? specialNotes,

    required AddonOrderStatus status,

    @JsonKey(name: 'created_at') DateTime? createdAt,

    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _AddonOrder;

  factory AddonOrder.fromJson(Map<String, dynamic> json) =>
      _$AddonOrderFromJson(json);
}

@JsonEnum()
enum AddonServiceType { meal, spa, laundry }

@JsonEnum()
enum AddonOrderStatus { ordered, inProgress, fulfilled, cancelled }
