// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'addon_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddonOrder {

 String? get id;@JsonKey(name: 'hotel_booking_id') String? get hotelBookingId;@JsonKey(name: 'tour_booking_id') String? get tourBookingId; AddonServiceType get serviceType;@JsonKey(name: 'meal_service_id') String? get mealServiceId;@JsonKey(name: 'spa_service_id') String? get spaServiceId;@JsonKey(name: 'laundry_service_id') String? get laundryServiceId; int get quantity;@JsonKey(name: 'weight_kg') double? get weightKg;@JsonKey(name: 'laundry_unit_price') double? get laundryUnitPrice;@JsonKey(name: 'meal_unit_price') double? get mealUnitPrice;@JsonKey(name: 'spa_unit_price') double? get spaUnitPrice; double get totalPrice;@JsonKey(name: 'scheduled_at') DateTime? get scheduledAt;@JsonKey(name: 'special_notes') String? get specialNotes; AddonOrderStatus get status;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of AddonOrder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddonOrderCopyWith<AddonOrder> get copyWith => _$AddonOrderCopyWithImpl<AddonOrder>(this as AddonOrder, _$identity);

  /// Serializes this AddonOrder to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddonOrder&&(identical(other.id, id) || other.id == id)&&(identical(other.hotelBookingId, hotelBookingId) || other.hotelBookingId == hotelBookingId)&&(identical(other.tourBookingId, tourBookingId) || other.tourBookingId == tourBookingId)&&(identical(other.serviceType, serviceType) || other.serviceType == serviceType)&&(identical(other.mealServiceId, mealServiceId) || other.mealServiceId == mealServiceId)&&(identical(other.spaServiceId, spaServiceId) || other.spaServiceId == spaServiceId)&&(identical(other.laundryServiceId, laundryServiceId) || other.laundryServiceId == laundryServiceId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.laundryUnitPrice, laundryUnitPrice) || other.laundryUnitPrice == laundryUnitPrice)&&(identical(other.mealUnitPrice, mealUnitPrice) || other.mealUnitPrice == mealUnitPrice)&&(identical(other.spaUnitPrice, spaUnitPrice) || other.spaUnitPrice == spaUnitPrice)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.specialNotes, specialNotes) || other.specialNotes == specialNotes)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,hotelBookingId,tourBookingId,serviceType,mealServiceId,spaServiceId,laundryServiceId,quantity,weightKg,laundryUnitPrice,mealUnitPrice,spaUnitPrice,totalPrice,scheduledAt,specialNotes,status,createdAt,updatedAt);

@override
String toString() {
  return 'AddonOrder(id: $id, hotelBookingId: $hotelBookingId, tourBookingId: $tourBookingId, serviceType: $serviceType, mealServiceId: $mealServiceId, spaServiceId: $spaServiceId, laundryServiceId: $laundryServiceId, quantity: $quantity, weightKg: $weightKg, laundryUnitPrice: $laundryUnitPrice, mealUnitPrice: $mealUnitPrice, spaUnitPrice: $spaUnitPrice, totalPrice: $totalPrice, scheduledAt: $scheduledAt, specialNotes: $specialNotes, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $AddonOrderCopyWith<$Res>  {
  factory $AddonOrderCopyWith(AddonOrder value, $Res Function(AddonOrder) _then) = _$AddonOrderCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'hotel_booking_id') String? hotelBookingId,@JsonKey(name: 'tour_booking_id') String? tourBookingId, AddonServiceType serviceType,@JsonKey(name: 'meal_service_id') String? mealServiceId,@JsonKey(name: 'spa_service_id') String? spaServiceId,@JsonKey(name: 'laundry_service_id') String? laundryServiceId, int quantity,@JsonKey(name: 'weight_kg') double? weightKg,@JsonKey(name: 'laundry_unit_price') double? laundryUnitPrice,@JsonKey(name: 'meal_unit_price') double? mealUnitPrice,@JsonKey(name: 'spa_unit_price') double? spaUnitPrice, double totalPrice,@JsonKey(name: 'scheduled_at') DateTime? scheduledAt,@JsonKey(name: 'special_notes') String? specialNotes, AddonOrderStatus status,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$AddonOrderCopyWithImpl<$Res>
    implements $AddonOrderCopyWith<$Res> {
  _$AddonOrderCopyWithImpl(this._self, this._then);

  final AddonOrder _self;
  final $Res Function(AddonOrder) _then;

/// Create a copy of AddonOrder
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? hotelBookingId = freezed,Object? tourBookingId = freezed,Object? serviceType = null,Object? mealServiceId = freezed,Object? spaServiceId = freezed,Object? laundryServiceId = freezed,Object? quantity = null,Object? weightKg = freezed,Object? laundryUnitPrice = freezed,Object? mealUnitPrice = freezed,Object? spaUnitPrice = freezed,Object? totalPrice = null,Object? scheduledAt = freezed,Object? specialNotes = freezed,Object? status = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,hotelBookingId: freezed == hotelBookingId ? _self.hotelBookingId : hotelBookingId // ignore: cast_nullable_to_non_nullable
as String?,tourBookingId: freezed == tourBookingId ? _self.tourBookingId : tourBookingId // ignore: cast_nullable_to_non_nullable
as String?,serviceType: null == serviceType ? _self.serviceType : serviceType // ignore: cast_nullable_to_non_nullable
as AddonServiceType,mealServiceId: freezed == mealServiceId ? _self.mealServiceId : mealServiceId // ignore: cast_nullable_to_non_nullable
as String?,spaServiceId: freezed == spaServiceId ? _self.spaServiceId : spaServiceId // ignore: cast_nullable_to_non_nullable
as String?,laundryServiceId: freezed == laundryServiceId ? _self.laundryServiceId : laundryServiceId // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double?,laundryUnitPrice: freezed == laundryUnitPrice ? _self.laundryUnitPrice : laundryUnitPrice // ignore: cast_nullable_to_non_nullable
as double?,mealUnitPrice: freezed == mealUnitPrice ? _self.mealUnitPrice : mealUnitPrice // ignore: cast_nullable_to_non_nullable
as double?,spaUnitPrice: freezed == spaUnitPrice ? _self.spaUnitPrice : spaUnitPrice // ignore: cast_nullable_to_non_nullable
as double?,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,scheduledAt: freezed == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,specialNotes: freezed == specialNotes ? _self.specialNotes : specialNotes // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AddonOrderStatus,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [AddonOrder].
extension AddonOrderPatterns on AddonOrder {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddonOrder value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddonOrder() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddonOrder value)  $default,){
final _that = this;
switch (_that) {
case _AddonOrder():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddonOrder value)?  $default,){
final _that = this;
switch (_that) {
case _AddonOrder() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'hotel_booking_id')  String? hotelBookingId, @JsonKey(name: 'tour_booking_id')  String? tourBookingId,  AddonServiceType serviceType, @JsonKey(name: 'meal_service_id')  String? mealServiceId, @JsonKey(name: 'spa_service_id')  String? spaServiceId, @JsonKey(name: 'laundry_service_id')  String? laundryServiceId,  int quantity, @JsonKey(name: 'weight_kg')  double? weightKg, @JsonKey(name: 'laundry_unit_price')  double? laundryUnitPrice, @JsonKey(name: 'meal_unit_price')  double? mealUnitPrice, @JsonKey(name: 'spa_unit_price')  double? spaUnitPrice,  double totalPrice, @JsonKey(name: 'scheduled_at')  DateTime? scheduledAt, @JsonKey(name: 'special_notes')  String? specialNotes,  AddonOrderStatus status, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddonOrder() when $default != null:
return $default(_that.id,_that.hotelBookingId,_that.tourBookingId,_that.serviceType,_that.mealServiceId,_that.spaServiceId,_that.laundryServiceId,_that.quantity,_that.weightKg,_that.laundryUnitPrice,_that.mealUnitPrice,_that.spaUnitPrice,_that.totalPrice,_that.scheduledAt,_that.specialNotes,_that.status,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'hotel_booking_id')  String? hotelBookingId, @JsonKey(name: 'tour_booking_id')  String? tourBookingId,  AddonServiceType serviceType, @JsonKey(name: 'meal_service_id')  String? mealServiceId, @JsonKey(name: 'spa_service_id')  String? spaServiceId, @JsonKey(name: 'laundry_service_id')  String? laundryServiceId,  int quantity, @JsonKey(name: 'weight_kg')  double? weightKg, @JsonKey(name: 'laundry_unit_price')  double? laundryUnitPrice, @JsonKey(name: 'meal_unit_price')  double? mealUnitPrice, @JsonKey(name: 'spa_unit_price')  double? spaUnitPrice,  double totalPrice, @JsonKey(name: 'scheduled_at')  DateTime? scheduledAt, @JsonKey(name: 'special_notes')  String? specialNotes,  AddonOrderStatus status, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _AddonOrder():
return $default(_that.id,_that.hotelBookingId,_that.tourBookingId,_that.serviceType,_that.mealServiceId,_that.spaServiceId,_that.laundryServiceId,_that.quantity,_that.weightKg,_that.laundryUnitPrice,_that.mealUnitPrice,_that.spaUnitPrice,_that.totalPrice,_that.scheduledAt,_that.specialNotes,_that.status,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'hotel_booking_id')  String? hotelBookingId, @JsonKey(name: 'tour_booking_id')  String? tourBookingId,  AddonServiceType serviceType, @JsonKey(name: 'meal_service_id')  String? mealServiceId, @JsonKey(name: 'spa_service_id')  String? spaServiceId, @JsonKey(name: 'laundry_service_id')  String? laundryServiceId,  int quantity, @JsonKey(name: 'weight_kg')  double? weightKg, @JsonKey(name: 'laundry_unit_price')  double? laundryUnitPrice, @JsonKey(name: 'meal_unit_price')  double? mealUnitPrice, @JsonKey(name: 'spa_unit_price')  double? spaUnitPrice,  double totalPrice, @JsonKey(name: 'scheduled_at')  DateTime? scheduledAt, @JsonKey(name: 'special_notes')  String? specialNotes,  AddonOrderStatus status, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _AddonOrder() when $default != null:
return $default(_that.id,_that.hotelBookingId,_that.tourBookingId,_that.serviceType,_that.mealServiceId,_that.spaServiceId,_that.laundryServiceId,_that.quantity,_that.weightKg,_that.laundryUnitPrice,_that.mealUnitPrice,_that.spaUnitPrice,_that.totalPrice,_that.scheduledAt,_that.specialNotes,_that.status,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddonOrder implements AddonOrder {
  const _AddonOrder({this.id, @JsonKey(name: 'hotel_booking_id') this.hotelBookingId, @JsonKey(name: 'tour_booking_id') this.tourBookingId, required this.serviceType, @JsonKey(name: 'meal_service_id') this.mealServiceId, @JsonKey(name: 'spa_service_id') this.spaServiceId, @JsonKey(name: 'laundry_service_id') this.laundryServiceId, required this.quantity, @JsonKey(name: 'weight_kg') this.weightKg, @JsonKey(name: 'laundry_unit_price') this.laundryUnitPrice, @JsonKey(name: 'meal_unit_price') this.mealUnitPrice, @JsonKey(name: 'spa_unit_price') this.spaUnitPrice, required this.totalPrice, @JsonKey(name: 'scheduled_at') this.scheduledAt, @JsonKey(name: 'special_notes') this.specialNotes, required this.status, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _AddonOrder.fromJson(Map<String, dynamic> json) => _$AddonOrderFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'hotel_booking_id') final  String? hotelBookingId;
@override@JsonKey(name: 'tour_booking_id') final  String? tourBookingId;
@override final  AddonServiceType serviceType;
@override@JsonKey(name: 'meal_service_id') final  String? mealServiceId;
@override@JsonKey(name: 'spa_service_id') final  String? spaServiceId;
@override@JsonKey(name: 'laundry_service_id') final  String? laundryServiceId;
@override final  int quantity;
@override@JsonKey(name: 'weight_kg') final  double? weightKg;
@override@JsonKey(name: 'laundry_unit_price') final  double? laundryUnitPrice;
@override@JsonKey(name: 'meal_unit_price') final  double? mealUnitPrice;
@override@JsonKey(name: 'spa_unit_price') final  double? spaUnitPrice;
@override final  double totalPrice;
@override@JsonKey(name: 'scheduled_at') final  DateTime? scheduledAt;
@override@JsonKey(name: 'special_notes') final  String? specialNotes;
@override final  AddonOrderStatus status;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of AddonOrder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddonOrderCopyWith<_AddonOrder> get copyWith => __$AddonOrderCopyWithImpl<_AddonOrder>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddonOrderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddonOrder&&(identical(other.id, id) || other.id == id)&&(identical(other.hotelBookingId, hotelBookingId) || other.hotelBookingId == hotelBookingId)&&(identical(other.tourBookingId, tourBookingId) || other.tourBookingId == tourBookingId)&&(identical(other.serviceType, serviceType) || other.serviceType == serviceType)&&(identical(other.mealServiceId, mealServiceId) || other.mealServiceId == mealServiceId)&&(identical(other.spaServiceId, spaServiceId) || other.spaServiceId == spaServiceId)&&(identical(other.laundryServiceId, laundryServiceId) || other.laundryServiceId == laundryServiceId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.laundryUnitPrice, laundryUnitPrice) || other.laundryUnitPrice == laundryUnitPrice)&&(identical(other.mealUnitPrice, mealUnitPrice) || other.mealUnitPrice == mealUnitPrice)&&(identical(other.spaUnitPrice, spaUnitPrice) || other.spaUnitPrice == spaUnitPrice)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.specialNotes, specialNotes) || other.specialNotes == specialNotes)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,hotelBookingId,tourBookingId,serviceType,mealServiceId,spaServiceId,laundryServiceId,quantity,weightKg,laundryUnitPrice,mealUnitPrice,spaUnitPrice,totalPrice,scheduledAt,specialNotes,status,createdAt,updatedAt);

@override
String toString() {
  return 'AddonOrder(id: $id, hotelBookingId: $hotelBookingId, tourBookingId: $tourBookingId, serviceType: $serviceType, mealServiceId: $mealServiceId, spaServiceId: $spaServiceId, laundryServiceId: $laundryServiceId, quantity: $quantity, weightKg: $weightKg, laundryUnitPrice: $laundryUnitPrice, mealUnitPrice: $mealUnitPrice, spaUnitPrice: $spaUnitPrice, totalPrice: $totalPrice, scheduledAt: $scheduledAt, specialNotes: $specialNotes, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$AddonOrderCopyWith<$Res> implements $AddonOrderCopyWith<$Res> {
  factory _$AddonOrderCopyWith(_AddonOrder value, $Res Function(_AddonOrder) _then) = __$AddonOrderCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'hotel_booking_id') String? hotelBookingId,@JsonKey(name: 'tour_booking_id') String? tourBookingId, AddonServiceType serviceType,@JsonKey(name: 'meal_service_id') String? mealServiceId,@JsonKey(name: 'spa_service_id') String? spaServiceId,@JsonKey(name: 'laundry_service_id') String? laundryServiceId, int quantity,@JsonKey(name: 'weight_kg') double? weightKg,@JsonKey(name: 'laundry_unit_price') double? laundryUnitPrice,@JsonKey(name: 'meal_unit_price') double? mealUnitPrice,@JsonKey(name: 'spa_unit_price') double? spaUnitPrice, double totalPrice,@JsonKey(name: 'scheduled_at') DateTime? scheduledAt,@JsonKey(name: 'special_notes') String? specialNotes, AddonOrderStatus status,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$AddonOrderCopyWithImpl<$Res>
    implements _$AddonOrderCopyWith<$Res> {
  __$AddonOrderCopyWithImpl(this._self, this._then);

  final _AddonOrder _self;
  final $Res Function(_AddonOrder) _then;

/// Create a copy of AddonOrder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? hotelBookingId = freezed,Object? tourBookingId = freezed,Object? serviceType = null,Object? mealServiceId = freezed,Object? spaServiceId = freezed,Object? laundryServiceId = freezed,Object? quantity = null,Object? weightKg = freezed,Object? laundryUnitPrice = freezed,Object? mealUnitPrice = freezed,Object? spaUnitPrice = freezed,Object? totalPrice = null,Object? scheduledAt = freezed,Object? specialNotes = freezed,Object? status = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_AddonOrder(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,hotelBookingId: freezed == hotelBookingId ? _self.hotelBookingId : hotelBookingId // ignore: cast_nullable_to_non_nullable
as String?,tourBookingId: freezed == tourBookingId ? _self.tourBookingId : tourBookingId // ignore: cast_nullable_to_non_nullable
as String?,serviceType: null == serviceType ? _self.serviceType : serviceType // ignore: cast_nullable_to_non_nullable
as AddonServiceType,mealServiceId: freezed == mealServiceId ? _self.mealServiceId : mealServiceId // ignore: cast_nullable_to_non_nullable
as String?,spaServiceId: freezed == spaServiceId ? _self.spaServiceId : spaServiceId // ignore: cast_nullable_to_non_nullable
as String?,laundryServiceId: freezed == laundryServiceId ? _self.laundryServiceId : laundryServiceId // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double?,laundryUnitPrice: freezed == laundryUnitPrice ? _self.laundryUnitPrice : laundryUnitPrice // ignore: cast_nullable_to_non_nullable
as double?,mealUnitPrice: freezed == mealUnitPrice ? _self.mealUnitPrice : mealUnitPrice // ignore: cast_nullable_to_non_nullable
as double?,spaUnitPrice: freezed == spaUnitPrice ? _self.spaUnitPrice : spaUnitPrice // ignore: cast_nullable_to_non_nullable
as double?,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,scheduledAt: freezed == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,specialNotes: freezed == specialNotes ? _self.specialNotes : specialNotes // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AddonOrderStatus,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
