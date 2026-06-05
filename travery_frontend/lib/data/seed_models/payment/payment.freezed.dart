// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Payment {

 String? get id;@JsonKey(name: 'tour_booking_id') String? get tourBookingId;@JsonKey(name: 'coach_booking_id') String? get coachBookingId;@JsonKey(name: 'hotel_booking_id') String? get hotelBookingId; double get amount; PaymentType get paymentType; PaymentStatus get status;@JsonKey(name: 'vnpay_txn_id') String get vnpayTxnId;@JsonKey(name: 'vnpay_response_code') String? get vnpayResponseCode;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentCopyWith<Payment> get copyWith => _$PaymentCopyWithImpl<Payment>(this as Payment, _$identity);

  /// Serializes this Payment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Payment&&(identical(other.id, id) || other.id == id)&&(identical(other.tourBookingId, tourBookingId) || other.tourBookingId == tourBookingId)&&(identical(other.coachBookingId, coachBookingId) || other.coachBookingId == coachBookingId)&&(identical(other.hotelBookingId, hotelBookingId) || other.hotelBookingId == hotelBookingId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType)&&(identical(other.status, status) || other.status == status)&&(identical(other.vnpayTxnId, vnpayTxnId) || other.vnpayTxnId == vnpayTxnId)&&(identical(other.vnpayResponseCode, vnpayResponseCode) || other.vnpayResponseCode == vnpayResponseCode)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tourBookingId,coachBookingId,hotelBookingId,amount,paymentType,status,vnpayTxnId,vnpayResponseCode,createdAt,updatedAt);

@override
String toString() {
  return 'Payment(id: $id, tourBookingId: $tourBookingId, coachBookingId: $coachBookingId, hotelBookingId: $hotelBookingId, amount: $amount, paymentType: $paymentType, status: $status, vnpayTxnId: $vnpayTxnId, vnpayResponseCode: $vnpayResponseCode, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $PaymentCopyWith<$Res>  {
  factory $PaymentCopyWith(Payment value, $Res Function(Payment) _then) = _$PaymentCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'tour_booking_id') String? tourBookingId,@JsonKey(name: 'coach_booking_id') String? coachBookingId,@JsonKey(name: 'hotel_booking_id') String? hotelBookingId, double amount, PaymentType paymentType, PaymentStatus status,@JsonKey(name: 'vnpay_txn_id') String vnpayTxnId,@JsonKey(name: 'vnpay_response_code') String? vnpayResponseCode,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$PaymentCopyWithImpl<$Res>
    implements $PaymentCopyWith<$Res> {
  _$PaymentCopyWithImpl(this._self, this._then);

  final Payment _self;
  final $Res Function(Payment) _then;

/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? tourBookingId = freezed,Object? coachBookingId = freezed,Object? hotelBookingId = freezed,Object? amount = null,Object? paymentType = null,Object? status = null,Object? vnpayTxnId = null,Object? vnpayResponseCode = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,tourBookingId: freezed == tourBookingId ? _self.tourBookingId : tourBookingId // ignore: cast_nullable_to_non_nullable
as String?,coachBookingId: freezed == coachBookingId ? _self.coachBookingId : coachBookingId // ignore: cast_nullable_to_non_nullable
as String?,hotelBookingId: freezed == hotelBookingId ? _self.hotelBookingId : hotelBookingId // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,paymentType: null == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as PaymentType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PaymentStatus,vnpayTxnId: null == vnpayTxnId ? _self.vnpayTxnId : vnpayTxnId // ignore: cast_nullable_to_non_nullable
as String,vnpayResponseCode: freezed == vnpayResponseCode ? _self.vnpayResponseCode : vnpayResponseCode // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Payment].
extension PaymentPatterns on Payment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Payment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Payment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Payment value)  $default,){
final _that = this;
switch (_that) {
case _Payment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Payment value)?  $default,){
final _that = this;
switch (_that) {
case _Payment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'tour_booking_id')  String? tourBookingId, @JsonKey(name: 'coach_booking_id')  String? coachBookingId, @JsonKey(name: 'hotel_booking_id')  String? hotelBookingId,  double amount,  PaymentType paymentType,  PaymentStatus status, @JsonKey(name: 'vnpay_txn_id')  String vnpayTxnId, @JsonKey(name: 'vnpay_response_code')  String? vnpayResponseCode, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Payment() when $default != null:
return $default(_that.id,_that.tourBookingId,_that.coachBookingId,_that.hotelBookingId,_that.amount,_that.paymentType,_that.status,_that.vnpayTxnId,_that.vnpayResponseCode,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'tour_booking_id')  String? tourBookingId, @JsonKey(name: 'coach_booking_id')  String? coachBookingId, @JsonKey(name: 'hotel_booking_id')  String? hotelBookingId,  double amount,  PaymentType paymentType,  PaymentStatus status, @JsonKey(name: 'vnpay_txn_id')  String vnpayTxnId, @JsonKey(name: 'vnpay_response_code')  String? vnpayResponseCode, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Payment():
return $default(_that.id,_that.tourBookingId,_that.coachBookingId,_that.hotelBookingId,_that.amount,_that.paymentType,_that.status,_that.vnpayTxnId,_that.vnpayResponseCode,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'tour_booking_id')  String? tourBookingId, @JsonKey(name: 'coach_booking_id')  String? coachBookingId, @JsonKey(name: 'hotel_booking_id')  String? hotelBookingId,  double amount,  PaymentType paymentType,  PaymentStatus status, @JsonKey(name: 'vnpay_txn_id')  String vnpayTxnId, @JsonKey(name: 'vnpay_response_code')  String? vnpayResponseCode, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Payment() when $default != null:
return $default(_that.id,_that.tourBookingId,_that.coachBookingId,_that.hotelBookingId,_that.amount,_that.paymentType,_that.status,_that.vnpayTxnId,_that.vnpayResponseCode,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Payment implements Payment {
  const _Payment({this.id, @JsonKey(name: 'tour_booking_id') this.tourBookingId, @JsonKey(name: 'coach_booking_id') this.coachBookingId, @JsonKey(name: 'hotel_booking_id') this.hotelBookingId, required this.amount, required this.paymentType, required this.status, @JsonKey(name: 'vnpay_txn_id') required this.vnpayTxnId, @JsonKey(name: 'vnpay_response_code') this.vnpayResponseCode, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _Payment.fromJson(Map<String, dynamic> json) => _$PaymentFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'tour_booking_id') final  String? tourBookingId;
@override@JsonKey(name: 'coach_booking_id') final  String? coachBookingId;
@override@JsonKey(name: 'hotel_booking_id') final  String? hotelBookingId;
@override final  double amount;
@override final  PaymentType paymentType;
@override final  PaymentStatus status;
@override@JsonKey(name: 'vnpay_txn_id') final  String vnpayTxnId;
@override@JsonKey(name: 'vnpay_response_code') final  String? vnpayResponseCode;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentCopyWith<_Payment> get copyWith => __$PaymentCopyWithImpl<_Payment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Payment&&(identical(other.id, id) || other.id == id)&&(identical(other.tourBookingId, tourBookingId) || other.tourBookingId == tourBookingId)&&(identical(other.coachBookingId, coachBookingId) || other.coachBookingId == coachBookingId)&&(identical(other.hotelBookingId, hotelBookingId) || other.hotelBookingId == hotelBookingId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType)&&(identical(other.status, status) || other.status == status)&&(identical(other.vnpayTxnId, vnpayTxnId) || other.vnpayTxnId == vnpayTxnId)&&(identical(other.vnpayResponseCode, vnpayResponseCode) || other.vnpayResponseCode == vnpayResponseCode)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tourBookingId,coachBookingId,hotelBookingId,amount,paymentType,status,vnpayTxnId,vnpayResponseCode,createdAt,updatedAt);

@override
String toString() {
  return 'Payment(id: $id, tourBookingId: $tourBookingId, coachBookingId: $coachBookingId, hotelBookingId: $hotelBookingId, amount: $amount, paymentType: $paymentType, status: $status, vnpayTxnId: $vnpayTxnId, vnpayResponseCode: $vnpayResponseCode, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$PaymentCopyWith<$Res> implements $PaymentCopyWith<$Res> {
  factory _$PaymentCopyWith(_Payment value, $Res Function(_Payment) _then) = __$PaymentCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'tour_booking_id') String? tourBookingId,@JsonKey(name: 'coach_booking_id') String? coachBookingId,@JsonKey(name: 'hotel_booking_id') String? hotelBookingId, double amount, PaymentType paymentType, PaymentStatus status,@JsonKey(name: 'vnpay_txn_id') String vnpayTxnId,@JsonKey(name: 'vnpay_response_code') String? vnpayResponseCode,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$PaymentCopyWithImpl<$Res>
    implements _$PaymentCopyWith<$Res> {
  __$PaymentCopyWithImpl(this._self, this._then);

  final _Payment _self;
  final $Res Function(_Payment) _then;

/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? tourBookingId = freezed,Object? coachBookingId = freezed,Object? hotelBookingId = freezed,Object? amount = null,Object? paymentType = null,Object? status = null,Object? vnpayTxnId = null,Object? vnpayResponseCode = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Payment(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,tourBookingId: freezed == tourBookingId ? _self.tourBookingId : tourBookingId // ignore: cast_nullable_to_non_nullable
as String?,coachBookingId: freezed == coachBookingId ? _self.coachBookingId : coachBookingId // ignore: cast_nullable_to_non_nullable
as String?,hotelBookingId: freezed == hotelBookingId ? _self.hotelBookingId : hotelBookingId // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,paymentType: null == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as PaymentType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PaymentStatus,vnpayTxnId: null == vnpayTxnId ? _self.vnpayTxnId : vnpayTxnId // ignore: cast_nullable_to_non_nullable
as String,vnpayResponseCode: freezed == vnpayResponseCode ? _self.vnpayResponseCode : vnpayResponseCode // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
