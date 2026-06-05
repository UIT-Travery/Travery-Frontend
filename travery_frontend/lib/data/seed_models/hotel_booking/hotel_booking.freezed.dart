// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hotel_booking.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HotelBooking {

 String? get id;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'room_id') String get roomId;@JsonKey(name: 'handled_by') String? get handledBy;@JsonKey(name: 'representative_name') String get representativeName;@JsonKey(name: 'representative_phone') String get representativePhone;@JsonKey(name: 'check_in_date') DateTime get checkInDate;@JsonKey(name: 'check_out_date') DateTime get checkOutDate;@JsonKey(name: 'night_count') int get nightCount;@JsonKey(name: 'guest_count') int get guestCount;@JsonKey(name: 'room_price') double get roomPrice;@JsonKey(name: 'late_checkout_fee') double? get lateCheckoutFee;@JsonKey(name: 'addon_total') double? get addonTotal;@JsonKey(name: 'total_price') double get totalPrice;@JsonKey(name: 'refund_amount') double? get refundAmount;@JsonKey(name: 'special_request') String? get specialRequest; HotelBookingStatus get status;@JsonKey(name: 'actual_check_in_at') DateTime? get actualCheckInAt;@JsonKey(name: 'actual_check_out_at') DateTime? get actualCheckOutAt;@JsonKey(name: 'cancelled_at') DateTime? get cancelledAt;@JsonKey(name: 'cancellation_reason') String? get cancellationReason;@JsonKey(name: 'cancelled_by') String? get cancelledBy;@JsonKey(name: 'no_show_note') String? get noShowNote;@JsonKey(name: 'no_show_at') DateTime? get noShowAt;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;/// RELATIONS
 List<HotelBookingMember>? get members; List<AddonOrder>? get addonOrders; HotelReview? get review;
/// Create a copy of HotelBooking
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HotelBookingCopyWith<HotelBooking> get copyWith => _$HotelBookingCopyWithImpl<HotelBooking>(this as HotelBooking, _$identity);

  /// Serializes this HotelBooking to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HotelBooking&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.handledBy, handledBy) || other.handledBy == handledBy)&&(identical(other.representativeName, representativeName) || other.representativeName == representativeName)&&(identical(other.representativePhone, representativePhone) || other.representativePhone == representativePhone)&&(identical(other.checkInDate, checkInDate) || other.checkInDate == checkInDate)&&(identical(other.checkOutDate, checkOutDate) || other.checkOutDate == checkOutDate)&&(identical(other.nightCount, nightCount) || other.nightCount == nightCount)&&(identical(other.guestCount, guestCount) || other.guestCount == guestCount)&&(identical(other.roomPrice, roomPrice) || other.roomPrice == roomPrice)&&(identical(other.lateCheckoutFee, lateCheckoutFee) || other.lateCheckoutFee == lateCheckoutFee)&&(identical(other.addonTotal, addonTotal) || other.addonTotal == addonTotal)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.refundAmount, refundAmount) || other.refundAmount == refundAmount)&&(identical(other.specialRequest, specialRequest) || other.specialRequest == specialRequest)&&(identical(other.status, status) || other.status == status)&&(identical(other.actualCheckInAt, actualCheckInAt) || other.actualCheckInAt == actualCheckInAt)&&(identical(other.actualCheckOutAt, actualCheckOutAt) || other.actualCheckOutAt == actualCheckOutAt)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&(identical(other.cancellationReason, cancellationReason) || other.cancellationReason == cancellationReason)&&(identical(other.cancelledBy, cancelledBy) || other.cancelledBy == cancelledBy)&&(identical(other.noShowNote, noShowNote) || other.noShowNote == noShowNote)&&(identical(other.noShowAt, noShowAt) || other.noShowAt == noShowAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.members, members)&&const DeepCollectionEquality().equals(other.addonOrders, addonOrders)&&(identical(other.review, review) || other.review == review));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,roomId,handledBy,representativeName,representativePhone,checkInDate,checkOutDate,nightCount,guestCount,roomPrice,lateCheckoutFee,addonTotal,totalPrice,refundAmount,specialRequest,status,actualCheckInAt,actualCheckOutAt,cancelledAt,cancellationReason,cancelledBy,noShowNote,noShowAt,createdAt,updatedAt,const DeepCollectionEquality().hash(members),const DeepCollectionEquality().hash(addonOrders),review]);

@override
String toString() {
  return 'HotelBooking(id: $id, userId: $userId, roomId: $roomId, handledBy: $handledBy, representativeName: $representativeName, representativePhone: $representativePhone, checkInDate: $checkInDate, checkOutDate: $checkOutDate, nightCount: $nightCount, guestCount: $guestCount, roomPrice: $roomPrice, lateCheckoutFee: $lateCheckoutFee, addonTotal: $addonTotal, totalPrice: $totalPrice, refundAmount: $refundAmount, specialRequest: $specialRequest, status: $status, actualCheckInAt: $actualCheckInAt, actualCheckOutAt: $actualCheckOutAt, cancelledAt: $cancelledAt, cancellationReason: $cancellationReason, cancelledBy: $cancelledBy, noShowNote: $noShowNote, noShowAt: $noShowAt, createdAt: $createdAt, updatedAt: $updatedAt, members: $members, addonOrders: $addonOrders, review: $review)';
}


}

/// @nodoc
abstract mixin class $HotelBookingCopyWith<$Res>  {
  factory $HotelBookingCopyWith(HotelBooking value, $Res Function(HotelBooking) _then) = _$HotelBookingCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'room_id') String roomId,@JsonKey(name: 'handled_by') String? handledBy,@JsonKey(name: 'representative_name') String representativeName,@JsonKey(name: 'representative_phone') String representativePhone,@JsonKey(name: 'check_in_date') DateTime checkInDate,@JsonKey(name: 'check_out_date') DateTime checkOutDate,@JsonKey(name: 'night_count') int nightCount,@JsonKey(name: 'guest_count') int guestCount,@JsonKey(name: 'room_price') double roomPrice,@JsonKey(name: 'late_checkout_fee') double? lateCheckoutFee,@JsonKey(name: 'addon_total') double? addonTotal,@JsonKey(name: 'total_price') double totalPrice,@JsonKey(name: 'refund_amount') double? refundAmount,@JsonKey(name: 'special_request') String? specialRequest, HotelBookingStatus status,@JsonKey(name: 'actual_check_in_at') DateTime? actualCheckInAt,@JsonKey(name: 'actual_check_out_at') DateTime? actualCheckOutAt,@JsonKey(name: 'cancelled_at') DateTime? cancelledAt,@JsonKey(name: 'cancellation_reason') String? cancellationReason,@JsonKey(name: 'cancelled_by') String? cancelledBy,@JsonKey(name: 'no_show_note') String? noShowNote,@JsonKey(name: 'no_show_at') DateTime? noShowAt,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt, List<HotelBookingMember>? members, List<AddonOrder>? addonOrders, HotelReview? review
});


$HotelReviewCopyWith<$Res>? get review;

}
/// @nodoc
class _$HotelBookingCopyWithImpl<$Res>
    implements $HotelBookingCopyWith<$Res> {
  _$HotelBookingCopyWithImpl(this._self, this._then);

  final HotelBooking _self;
  final $Res Function(HotelBooking) _then;

/// Create a copy of HotelBooking
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? userId = null,Object? roomId = null,Object? handledBy = freezed,Object? representativeName = null,Object? representativePhone = null,Object? checkInDate = null,Object? checkOutDate = null,Object? nightCount = null,Object? guestCount = null,Object? roomPrice = null,Object? lateCheckoutFee = freezed,Object? addonTotal = freezed,Object? totalPrice = null,Object? refundAmount = freezed,Object? specialRequest = freezed,Object? status = null,Object? actualCheckInAt = freezed,Object? actualCheckOutAt = freezed,Object? cancelledAt = freezed,Object? cancellationReason = freezed,Object? cancelledBy = freezed,Object? noShowNote = freezed,Object? noShowAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? members = freezed,Object? addonOrders = freezed,Object? review = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,handledBy: freezed == handledBy ? _self.handledBy : handledBy // ignore: cast_nullable_to_non_nullable
as String?,representativeName: null == representativeName ? _self.representativeName : representativeName // ignore: cast_nullable_to_non_nullable
as String,representativePhone: null == representativePhone ? _self.representativePhone : representativePhone // ignore: cast_nullable_to_non_nullable
as String,checkInDate: null == checkInDate ? _self.checkInDate : checkInDate // ignore: cast_nullable_to_non_nullable
as DateTime,checkOutDate: null == checkOutDate ? _self.checkOutDate : checkOutDate // ignore: cast_nullable_to_non_nullable
as DateTime,nightCount: null == nightCount ? _self.nightCount : nightCount // ignore: cast_nullable_to_non_nullable
as int,guestCount: null == guestCount ? _self.guestCount : guestCount // ignore: cast_nullable_to_non_nullable
as int,roomPrice: null == roomPrice ? _self.roomPrice : roomPrice // ignore: cast_nullable_to_non_nullable
as double,lateCheckoutFee: freezed == lateCheckoutFee ? _self.lateCheckoutFee : lateCheckoutFee // ignore: cast_nullable_to_non_nullable
as double?,addonTotal: freezed == addonTotal ? _self.addonTotal : addonTotal // ignore: cast_nullable_to_non_nullable
as double?,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,refundAmount: freezed == refundAmount ? _self.refundAmount : refundAmount // ignore: cast_nullable_to_non_nullable
as double?,specialRequest: freezed == specialRequest ? _self.specialRequest : specialRequest // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HotelBookingStatus,actualCheckInAt: freezed == actualCheckInAt ? _self.actualCheckInAt : actualCheckInAt // ignore: cast_nullable_to_non_nullable
as DateTime?,actualCheckOutAt: freezed == actualCheckOutAt ? _self.actualCheckOutAt : actualCheckOutAt // ignore: cast_nullable_to_non_nullable
as DateTime?,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,cancellationReason: freezed == cancellationReason ? _self.cancellationReason : cancellationReason // ignore: cast_nullable_to_non_nullable
as String?,cancelledBy: freezed == cancelledBy ? _self.cancelledBy : cancelledBy // ignore: cast_nullable_to_non_nullable
as String?,noShowNote: freezed == noShowNote ? _self.noShowNote : noShowNote // ignore: cast_nullable_to_non_nullable
as String?,noShowAt: freezed == noShowAt ? _self.noShowAt : noShowAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,members: freezed == members ? _self.members : members // ignore: cast_nullable_to_non_nullable
as List<HotelBookingMember>?,addonOrders: freezed == addonOrders ? _self.addonOrders : addonOrders // ignore: cast_nullable_to_non_nullable
as List<AddonOrder>?,review: freezed == review ? _self.review : review // ignore: cast_nullable_to_non_nullable
as HotelReview?,
  ));
}
/// Create a copy of HotelBooking
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HotelReviewCopyWith<$Res>? get review {
    if (_self.review == null) {
    return null;
  }

  return $HotelReviewCopyWith<$Res>(_self.review!, (value) {
    return _then(_self.copyWith(review: value));
  });
}
}


/// Adds pattern-matching-related methods to [HotelBooking].
extension HotelBookingPatterns on HotelBooking {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HotelBooking value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HotelBooking() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HotelBooking value)  $default,){
final _that = this;
switch (_that) {
case _HotelBooking():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HotelBooking value)?  $default,){
final _that = this;
switch (_that) {
case _HotelBooking() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'room_id')  String roomId, @JsonKey(name: 'handled_by')  String? handledBy, @JsonKey(name: 'representative_name')  String representativeName, @JsonKey(name: 'representative_phone')  String representativePhone, @JsonKey(name: 'check_in_date')  DateTime checkInDate, @JsonKey(name: 'check_out_date')  DateTime checkOutDate, @JsonKey(name: 'night_count')  int nightCount, @JsonKey(name: 'guest_count')  int guestCount, @JsonKey(name: 'room_price')  double roomPrice, @JsonKey(name: 'late_checkout_fee')  double? lateCheckoutFee, @JsonKey(name: 'addon_total')  double? addonTotal, @JsonKey(name: 'total_price')  double totalPrice, @JsonKey(name: 'refund_amount')  double? refundAmount, @JsonKey(name: 'special_request')  String? specialRequest,  HotelBookingStatus status, @JsonKey(name: 'actual_check_in_at')  DateTime? actualCheckInAt, @JsonKey(name: 'actual_check_out_at')  DateTime? actualCheckOutAt, @JsonKey(name: 'cancelled_at')  DateTime? cancelledAt, @JsonKey(name: 'cancellation_reason')  String? cancellationReason, @JsonKey(name: 'cancelled_by')  String? cancelledBy, @JsonKey(name: 'no_show_note')  String? noShowNote, @JsonKey(name: 'no_show_at')  DateTime? noShowAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  List<HotelBookingMember>? members,  List<AddonOrder>? addonOrders,  HotelReview? review)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HotelBooking() when $default != null:
return $default(_that.id,_that.userId,_that.roomId,_that.handledBy,_that.representativeName,_that.representativePhone,_that.checkInDate,_that.checkOutDate,_that.nightCount,_that.guestCount,_that.roomPrice,_that.lateCheckoutFee,_that.addonTotal,_that.totalPrice,_that.refundAmount,_that.specialRequest,_that.status,_that.actualCheckInAt,_that.actualCheckOutAt,_that.cancelledAt,_that.cancellationReason,_that.cancelledBy,_that.noShowNote,_that.noShowAt,_that.createdAt,_that.updatedAt,_that.members,_that.addonOrders,_that.review);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'room_id')  String roomId, @JsonKey(name: 'handled_by')  String? handledBy, @JsonKey(name: 'representative_name')  String representativeName, @JsonKey(name: 'representative_phone')  String representativePhone, @JsonKey(name: 'check_in_date')  DateTime checkInDate, @JsonKey(name: 'check_out_date')  DateTime checkOutDate, @JsonKey(name: 'night_count')  int nightCount, @JsonKey(name: 'guest_count')  int guestCount, @JsonKey(name: 'room_price')  double roomPrice, @JsonKey(name: 'late_checkout_fee')  double? lateCheckoutFee, @JsonKey(name: 'addon_total')  double? addonTotal, @JsonKey(name: 'total_price')  double totalPrice, @JsonKey(name: 'refund_amount')  double? refundAmount, @JsonKey(name: 'special_request')  String? specialRequest,  HotelBookingStatus status, @JsonKey(name: 'actual_check_in_at')  DateTime? actualCheckInAt, @JsonKey(name: 'actual_check_out_at')  DateTime? actualCheckOutAt, @JsonKey(name: 'cancelled_at')  DateTime? cancelledAt, @JsonKey(name: 'cancellation_reason')  String? cancellationReason, @JsonKey(name: 'cancelled_by')  String? cancelledBy, @JsonKey(name: 'no_show_note')  String? noShowNote, @JsonKey(name: 'no_show_at')  DateTime? noShowAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  List<HotelBookingMember>? members,  List<AddonOrder>? addonOrders,  HotelReview? review)  $default,) {final _that = this;
switch (_that) {
case _HotelBooking():
return $default(_that.id,_that.userId,_that.roomId,_that.handledBy,_that.representativeName,_that.representativePhone,_that.checkInDate,_that.checkOutDate,_that.nightCount,_that.guestCount,_that.roomPrice,_that.lateCheckoutFee,_that.addonTotal,_that.totalPrice,_that.refundAmount,_that.specialRequest,_that.status,_that.actualCheckInAt,_that.actualCheckOutAt,_that.cancelledAt,_that.cancellationReason,_that.cancelledBy,_that.noShowNote,_that.noShowAt,_that.createdAt,_that.updatedAt,_that.members,_that.addonOrders,_that.review);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'room_id')  String roomId, @JsonKey(name: 'handled_by')  String? handledBy, @JsonKey(name: 'representative_name')  String representativeName, @JsonKey(name: 'representative_phone')  String representativePhone, @JsonKey(name: 'check_in_date')  DateTime checkInDate, @JsonKey(name: 'check_out_date')  DateTime checkOutDate, @JsonKey(name: 'night_count')  int nightCount, @JsonKey(name: 'guest_count')  int guestCount, @JsonKey(name: 'room_price')  double roomPrice, @JsonKey(name: 'late_checkout_fee')  double? lateCheckoutFee, @JsonKey(name: 'addon_total')  double? addonTotal, @JsonKey(name: 'total_price')  double totalPrice, @JsonKey(name: 'refund_amount')  double? refundAmount, @JsonKey(name: 'special_request')  String? specialRequest,  HotelBookingStatus status, @JsonKey(name: 'actual_check_in_at')  DateTime? actualCheckInAt, @JsonKey(name: 'actual_check_out_at')  DateTime? actualCheckOutAt, @JsonKey(name: 'cancelled_at')  DateTime? cancelledAt, @JsonKey(name: 'cancellation_reason')  String? cancellationReason, @JsonKey(name: 'cancelled_by')  String? cancelledBy, @JsonKey(name: 'no_show_note')  String? noShowNote, @JsonKey(name: 'no_show_at')  DateTime? noShowAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  List<HotelBookingMember>? members,  List<AddonOrder>? addonOrders,  HotelReview? review)?  $default,) {final _that = this;
switch (_that) {
case _HotelBooking() when $default != null:
return $default(_that.id,_that.userId,_that.roomId,_that.handledBy,_that.representativeName,_that.representativePhone,_that.checkInDate,_that.checkOutDate,_that.nightCount,_that.guestCount,_that.roomPrice,_that.lateCheckoutFee,_that.addonTotal,_that.totalPrice,_that.refundAmount,_that.specialRequest,_that.status,_that.actualCheckInAt,_that.actualCheckOutAt,_that.cancelledAt,_that.cancellationReason,_that.cancelledBy,_that.noShowNote,_that.noShowAt,_that.createdAt,_that.updatedAt,_that.members,_that.addonOrders,_that.review);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HotelBooking implements HotelBooking {
  const _HotelBooking({this.id, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'room_id') required this.roomId, @JsonKey(name: 'handled_by') this.handledBy, @JsonKey(name: 'representative_name') required this.representativeName, @JsonKey(name: 'representative_phone') required this.representativePhone, @JsonKey(name: 'check_in_date') required this.checkInDate, @JsonKey(name: 'check_out_date') required this.checkOutDate, @JsonKey(name: 'night_count') required this.nightCount, @JsonKey(name: 'guest_count') required this.guestCount, @JsonKey(name: 'room_price') required this.roomPrice, @JsonKey(name: 'late_checkout_fee') this.lateCheckoutFee, @JsonKey(name: 'addon_total') this.addonTotal, @JsonKey(name: 'total_price') required this.totalPrice, @JsonKey(name: 'refund_amount') this.refundAmount, @JsonKey(name: 'special_request') this.specialRequest, required this.status, @JsonKey(name: 'actual_check_in_at') this.actualCheckInAt, @JsonKey(name: 'actual_check_out_at') this.actualCheckOutAt, @JsonKey(name: 'cancelled_at') this.cancelledAt, @JsonKey(name: 'cancellation_reason') this.cancellationReason, @JsonKey(name: 'cancelled_by') this.cancelledBy, @JsonKey(name: 'no_show_note') this.noShowNote, @JsonKey(name: 'no_show_at') this.noShowAt, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, final  List<HotelBookingMember>? members, final  List<AddonOrder>? addonOrders, this.review}): _members = members,_addonOrders = addonOrders;
  factory _HotelBooking.fromJson(Map<String, dynamic> json) => _$HotelBookingFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'room_id') final  String roomId;
@override@JsonKey(name: 'handled_by') final  String? handledBy;
@override@JsonKey(name: 'representative_name') final  String representativeName;
@override@JsonKey(name: 'representative_phone') final  String representativePhone;
@override@JsonKey(name: 'check_in_date') final  DateTime checkInDate;
@override@JsonKey(name: 'check_out_date') final  DateTime checkOutDate;
@override@JsonKey(name: 'night_count') final  int nightCount;
@override@JsonKey(name: 'guest_count') final  int guestCount;
@override@JsonKey(name: 'room_price') final  double roomPrice;
@override@JsonKey(name: 'late_checkout_fee') final  double? lateCheckoutFee;
@override@JsonKey(name: 'addon_total') final  double? addonTotal;
@override@JsonKey(name: 'total_price') final  double totalPrice;
@override@JsonKey(name: 'refund_amount') final  double? refundAmount;
@override@JsonKey(name: 'special_request') final  String? specialRequest;
@override final  HotelBookingStatus status;
@override@JsonKey(name: 'actual_check_in_at') final  DateTime? actualCheckInAt;
@override@JsonKey(name: 'actual_check_out_at') final  DateTime? actualCheckOutAt;
@override@JsonKey(name: 'cancelled_at') final  DateTime? cancelledAt;
@override@JsonKey(name: 'cancellation_reason') final  String? cancellationReason;
@override@JsonKey(name: 'cancelled_by') final  String? cancelledBy;
@override@JsonKey(name: 'no_show_note') final  String? noShowNote;
@override@JsonKey(name: 'no_show_at') final  DateTime? noShowAt;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;
/// RELATIONS
 final  List<HotelBookingMember>? _members;
/// RELATIONS
@override List<HotelBookingMember>? get members {
  final value = _members;
  if (value == null) return null;
  if (_members is EqualUnmodifiableListView) return _members;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<AddonOrder>? _addonOrders;
@override List<AddonOrder>? get addonOrders {
  final value = _addonOrders;
  if (value == null) return null;
  if (_addonOrders is EqualUnmodifiableListView) return _addonOrders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  HotelReview? review;

/// Create a copy of HotelBooking
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HotelBookingCopyWith<_HotelBooking> get copyWith => __$HotelBookingCopyWithImpl<_HotelBooking>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HotelBookingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HotelBooking&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.handledBy, handledBy) || other.handledBy == handledBy)&&(identical(other.representativeName, representativeName) || other.representativeName == representativeName)&&(identical(other.representativePhone, representativePhone) || other.representativePhone == representativePhone)&&(identical(other.checkInDate, checkInDate) || other.checkInDate == checkInDate)&&(identical(other.checkOutDate, checkOutDate) || other.checkOutDate == checkOutDate)&&(identical(other.nightCount, nightCount) || other.nightCount == nightCount)&&(identical(other.guestCount, guestCount) || other.guestCount == guestCount)&&(identical(other.roomPrice, roomPrice) || other.roomPrice == roomPrice)&&(identical(other.lateCheckoutFee, lateCheckoutFee) || other.lateCheckoutFee == lateCheckoutFee)&&(identical(other.addonTotal, addonTotal) || other.addonTotal == addonTotal)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.refundAmount, refundAmount) || other.refundAmount == refundAmount)&&(identical(other.specialRequest, specialRequest) || other.specialRequest == specialRequest)&&(identical(other.status, status) || other.status == status)&&(identical(other.actualCheckInAt, actualCheckInAt) || other.actualCheckInAt == actualCheckInAt)&&(identical(other.actualCheckOutAt, actualCheckOutAt) || other.actualCheckOutAt == actualCheckOutAt)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&(identical(other.cancellationReason, cancellationReason) || other.cancellationReason == cancellationReason)&&(identical(other.cancelledBy, cancelledBy) || other.cancelledBy == cancelledBy)&&(identical(other.noShowNote, noShowNote) || other.noShowNote == noShowNote)&&(identical(other.noShowAt, noShowAt) || other.noShowAt == noShowAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._members, _members)&&const DeepCollectionEquality().equals(other._addonOrders, _addonOrders)&&(identical(other.review, review) || other.review == review));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,roomId,handledBy,representativeName,representativePhone,checkInDate,checkOutDate,nightCount,guestCount,roomPrice,lateCheckoutFee,addonTotal,totalPrice,refundAmount,specialRequest,status,actualCheckInAt,actualCheckOutAt,cancelledAt,cancellationReason,cancelledBy,noShowNote,noShowAt,createdAt,updatedAt,const DeepCollectionEquality().hash(_members),const DeepCollectionEquality().hash(_addonOrders),review]);

@override
String toString() {
  return 'HotelBooking(id: $id, userId: $userId, roomId: $roomId, handledBy: $handledBy, representativeName: $representativeName, representativePhone: $representativePhone, checkInDate: $checkInDate, checkOutDate: $checkOutDate, nightCount: $nightCount, guestCount: $guestCount, roomPrice: $roomPrice, lateCheckoutFee: $lateCheckoutFee, addonTotal: $addonTotal, totalPrice: $totalPrice, refundAmount: $refundAmount, specialRequest: $specialRequest, status: $status, actualCheckInAt: $actualCheckInAt, actualCheckOutAt: $actualCheckOutAt, cancelledAt: $cancelledAt, cancellationReason: $cancellationReason, cancelledBy: $cancelledBy, noShowNote: $noShowNote, noShowAt: $noShowAt, createdAt: $createdAt, updatedAt: $updatedAt, members: $members, addonOrders: $addonOrders, review: $review)';
}


}

/// @nodoc
abstract mixin class _$HotelBookingCopyWith<$Res> implements $HotelBookingCopyWith<$Res> {
  factory _$HotelBookingCopyWith(_HotelBooking value, $Res Function(_HotelBooking) _then) = __$HotelBookingCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'room_id') String roomId,@JsonKey(name: 'handled_by') String? handledBy,@JsonKey(name: 'representative_name') String representativeName,@JsonKey(name: 'representative_phone') String representativePhone,@JsonKey(name: 'check_in_date') DateTime checkInDate,@JsonKey(name: 'check_out_date') DateTime checkOutDate,@JsonKey(name: 'night_count') int nightCount,@JsonKey(name: 'guest_count') int guestCount,@JsonKey(name: 'room_price') double roomPrice,@JsonKey(name: 'late_checkout_fee') double? lateCheckoutFee,@JsonKey(name: 'addon_total') double? addonTotal,@JsonKey(name: 'total_price') double totalPrice,@JsonKey(name: 'refund_amount') double? refundAmount,@JsonKey(name: 'special_request') String? specialRequest, HotelBookingStatus status,@JsonKey(name: 'actual_check_in_at') DateTime? actualCheckInAt,@JsonKey(name: 'actual_check_out_at') DateTime? actualCheckOutAt,@JsonKey(name: 'cancelled_at') DateTime? cancelledAt,@JsonKey(name: 'cancellation_reason') String? cancellationReason,@JsonKey(name: 'cancelled_by') String? cancelledBy,@JsonKey(name: 'no_show_note') String? noShowNote,@JsonKey(name: 'no_show_at') DateTime? noShowAt,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt, List<HotelBookingMember>? members, List<AddonOrder>? addonOrders, HotelReview? review
});


@override $HotelReviewCopyWith<$Res>? get review;

}
/// @nodoc
class __$HotelBookingCopyWithImpl<$Res>
    implements _$HotelBookingCopyWith<$Res> {
  __$HotelBookingCopyWithImpl(this._self, this._then);

  final _HotelBooking _self;
  final $Res Function(_HotelBooking) _then;

/// Create a copy of HotelBooking
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? userId = null,Object? roomId = null,Object? handledBy = freezed,Object? representativeName = null,Object? representativePhone = null,Object? checkInDate = null,Object? checkOutDate = null,Object? nightCount = null,Object? guestCount = null,Object? roomPrice = null,Object? lateCheckoutFee = freezed,Object? addonTotal = freezed,Object? totalPrice = null,Object? refundAmount = freezed,Object? specialRequest = freezed,Object? status = null,Object? actualCheckInAt = freezed,Object? actualCheckOutAt = freezed,Object? cancelledAt = freezed,Object? cancellationReason = freezed,Object? cancelledBy = freezed,Object? noShowNote = freezed,Object? noShowAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? members = freezed,Object? addonOrders = freezed,Object? review = freezed,}) {
  return _then(_HotelBooking(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,handledBy: freezed == handledBy ? _self.handledBy : handledBy // ignore: cast_nullable_to_non_nullable
as String?,representativeName: null == representativeName ? _self.representativeName : representativeName // ignore: cast_nullable_to_non_nullable
as String,representativePhone: null == representativePhone ? _self.representativePhone : representativePhone // ignore: cast_nullable_to_non_nullable
as String,checkInDate: null == checkInDate ? _self.checkInDate : checkInDate // ignore: cast_nullable_to_non_nullable
as DateTime,checkOutDate: null == checkOutDate ? _self.checkOutDate : checkOutDate // ignore: cast_nullable_to_non_nullable
as DateTime,nightCount: null == nightCount ? _self.nightCount : nightCount // ignore: cast_nullable_to_non_nullable
as int,guestCount: null == guestCount ? _self.guestCount : guestCount // ignore: cast_nullable_to_non_nullable
as int,roomPrice: null == roomPrice ? _self.roomPrice : roomPrice // ignore: cast_nullable_to_non_nullable
as double,lateCheckoutFee: freezed == lateCheckoutFee ? _self.lateCheckoutFee : lateCheckoutFee // ignore: cast_nullable_to_non_nullable
as double?,addonTotal: freezed == addonTotal ? _self.addonTotal : addonTotal // ignore: cast_nullable_to_non_nullable
as double?,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,refundAmount: freezed == refundAmount ? _self.refundAmount : refundAmount // ignore: cast_nullable_to_non_nullable
as double?,specialRequest: freezed == specialRequest ? _self.specialRequest : specialRequest // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HotelBookingStatus,actualCheckInAt: freezed == actualCheckInAt ? _self.actualCheckInAt : actualCheckInAt // ignore: cast_nullable_to_non_nullable
as DateTime?,actualCheckOutAt: freezed == actualCheckOutAt ? _self.actualCheckOutAt : actualCheckOutAt // ignore: cast_nullable_to_non_nullable
as DateTime?,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,cancellationReason: freezed == cancellationReason ? _self.cancellationReason : cancellationReason // ignore: cast_nullable_to_non_nullable
as String?,cancelledBy: freezed == cancelledBy ? _self.cancelledBy : cancelledBy // ignore: cast_nullable_to_non_nullable
as String?,noShowNote: freezed == noShowNote ? _self.noShowNote : noShowNote // ignore: cast_nullable_to_non_nullable
as String?,noShowAt: freezed == noShowAt ? _self.noShowAt : noShowAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,members: freezed == members ? _self._members : members // ignore: cast_nullable_to_non_nullable
as List<HotelBookingMember>?,addonOrders: freezed == addonOrders ? _self._addonOrders : addonOrders // ignore: cast_nullable_to_non_nullable
as List<AddonOrder>?,review: freezed == review ? _self.review : review // ignore: cast_nullable_to_non_nullable
as HotelReview?,
  ));
}

/// Create a copy of HotelBooking
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HotelReviewCopyWith<$Res>? get review {
    if (_self.review == null) {
    return null;
  }

  return $HotelReviewCopyWith<$Res>(_self.review!, (value) {
    return _then(_self.copyWith(review: value));
  });
}
}

// dart format on
