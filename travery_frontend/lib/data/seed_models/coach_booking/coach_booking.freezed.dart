// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coach_booking.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoachBooking {

 String? get id;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'coach_instance_id') String get coachInstanceId;@JsonKey(name: 'passenger_name') String get passengerName;@JsonKey(name: 'passenger_phone') String get passengerPhone;@JsonKey(name: 'pickup_station_id') String? get pickupStationId;@JsonKey(name: 'dropoff_station_id') String? get dropoffStationId;@JsonKey(name: 'ticket_code') String get ticketCode;@JsonKey(name: 'ticket_count') int get ticketCount;@JsonKey(name: 'total_price') double get totalPrice;@JsonKey(name: 'refund_amount') double? get refundAmount;@JsonKey(name: 'special_notes') String? get specialNotes; CoachBookingStatus get status;@JsonKey(name: 'cancelled_at') DateTime? get cancelledAt;@JsonKey(name: 'cancellation_reason') String? get cancellationReason;@JsonKey(name: 'cancelled_by') String? get cancelledBy;@JsonKey(name: 'no_show_note') String? get noShowNote;@JsonKey(name: 'no_show_at') DateTime? get noShowAt;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of CoachBooking
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoachBookingCopyWith<CoachBooking> get copyWith => _$CoachBookingCopyWithImpl<CoachBooking>(this as CoachBooking, _$identity);

  /// Serializes this CoachBooking to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoachBooking&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.coachInstanceId, coachInstanceId) || other.coachInstanceId == coachInstanceId)&&(identical(other.passengerName, passengerName) || other.passengerName == passengerName)&&(identical(other.passengerPhone, passengerPhone) || other.passengerPhone == passengerPhone)&&(identical(other.pickupStationId, pickupStationId) || other.pickupStationId == pickupStationId)&&(identical(other.dropoffStationId, dropoffStationId) || other.dropoffStationId == dropoffStationId)&&(identical(other.ticketCode, ticketCode) || other.ticketCode == ticketCode)&&(identical(other.ticketCount, ticketCount) || other.ticketCount == ticketCount)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.refundAmount, refundAmount) || other.refundAmount == refundAmount)&&(identical(other.specialNotes, specialNotes) || other.specialNotes == specialNotes)&&(identical(other.status, status) || other.status == status)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&(identical(other.cancellationReason, cancellationReason) || other.cancellationReason == cancellationReason)&&(identical(other.cancelledBy, cancelledBy) || other.cancelledBy == cancelledBy)&&(identical(other.noShowNote, noShowNote) || other.noShowNote == noShowNote)&&(identical(other.noShowAt, noShowAt) || other.noShowAt == noShowAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,coachInstanceId,passengerName,passengerPhone,pickupStationId,dropoffStationId,ticketCode,ticketCount,totalPrice,refundAmount,specialNotes,status,cancelledAt,cancellationReason,cancelledBy,noShowNote,noShowAt,createdAt,updatedAt]);

@override
String toString() {
  return 'CoachBooking(id: $id, userId: $userId, coachInstanceId: $coachInstanceId, passengerName: $passengerName, passengerPhone: $passengerPhone, pickupStationId: $pickupStationId, dropoffStationId: $dropoffStationId, ticketCode: $ticketCode, ticketCount: $ticketCount, totalPrice: $totalPrice, refundAmount: $refundAmount, specialNotes: $specialNotes, status: $status, cancelledAt: $cancelledAt, cancellationReason: $cancellationReason, cancelledBy: $cancelledBy, noShowNote: $noShowNote, noShowAt: $noShowAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CoachBookingCopyWith<$Res>  {
  factory $CoachBookingCopyWith(CoachBooking value, $Res Function(CoachBooking) _then) = _$CoachBookingCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'coach_instance_id') String coachInstanceId,@JsonKey(name: 'passenger_name') String passengerName,@JsonKey(name: 'passenger_phone') String passengerPhone,@JsonKey(name: 'pickup_station_id') String? pickupStationId,@JsonKey(name: 'dropoff_station_id') String? dropoffStationId,@JsonKey(name: 'ticket_code') String ticketCode,@JsonKey(name: 'ticket_count') int ticketCount,@JsonKey(name: 'total_price') double totalPrice,@JsonKey(name: 'refund_amount') double? refundAmount,@JsonKey(name: 'special_notes') String? specialNotes, CoachBookingStatus status,@JsonKey(name: 'cancelled_at') DateTime? cancelledAt,@JsonKey(name: 'cancellation_reason') String? cancellationReason,@JsonKey(name: 'cancelled_by') String? cancelledBy,@JsonKey(name: 'no_show_note') String? noShowNote,@JsonKey(name: 'no_show_at') DateTime? noShowAt,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$CoachBookingCopyWithImpl<$Res>
    implements $CoachBookingCopyWith<$Res> {
  _$CoachBookingCopyWithImpl(this._self, this._then);

  final CoachBooking _self;
  final $Res Function(CoachBooking) _then;

/// Create a copy of CoachBooking
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? userId = null,Object? coachInstanceId = null,Object? passengerName = null,Object? passengerPhone = null,Object? pickupStationId = freezed,Object? dropoffStationId = freezed,Object? ticketCode = null,Object? ticketCount = null,Object? totalPrice = null,Object? refundAmount = freezed,Object? specialNotes = freezed,Object? status = null,Object? cancelledAt = freezed,Object? cancellationReason = freezed,Object? cancelledBy = freezed,Object? noShowNote = freezed,Object? noShowAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,coachInstanceId: null == coachInstanceId ? _self.coachInstanceId : coachInstanceId // ignore: cast_nullable_to_non_nullable
as String,passengerName: null == passengerName ? _self.passengerName : passengerName // ignore: cast_nullable_to_non_nullable
as String,passengerPhone: null == passengerPhone ? _self.passengerPhone : passengerPhone // ignore: cast_nullable_to_non_nullable
as String,pickupStationId: freezed == pickupStationId ? _self.pickupStationId : pickupStationId // ignore: cast_nullable_to_non_nullable
as String?,dropoffStationId: freezed == dropoffStationId ? _self.dropoffStationId : dropoffStationId // ignore: cast_nullable_to_non_nullable
as String?,ticketCode: null == ticketCode ? _self.ticketCode : ticketCode // ignore: cast_nullable_to_non_nullable
as String,ticketCount: null == ticketCount ? _self.ticketCount : ticketCount // ignore: cast_nullable_to_non_nullable
as int,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,refundAmount: freezed == refundAmount ? _self.refundAmount : refundAmount // ignore: cast_nullable_to_non_nullable
as double?,specialNotes: freezed == specialNotes ? _self.specialNotes : specialNotes // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CoachBookingStatus,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,cancellationReason: freezed == cancellationReason ? _self.cancellationReason : cancellationReason // ignore: cast_nullable_to_non_nullable
as String?,cancelledBy: freezed == cancelledBy ? _self.cancelledBy : cancelledBy // ignore: cast_nullable_to_non_nullable
as String?,noShowNote: freezed == noShowNote ? _self.noShowNote : noShowNote // ignore: cast_nullable_to_non_nullable
as String?,noShowAt: freezed == noShowAt ? _self.noShowAt : noShowAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CoachBooking].
extension CoachBookingPatterns on CoachBooking {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoachBooking value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoachBooking() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoachBooking value)  $default,){
final _that = this;
switch (_that) {
case _CoachBooking():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoachBooking value)?  $default,){
final _that = this;
switch (_that) {
case _CoachBooking() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'coach_instance_id')  String coachInstanceId, @JsonKey(name: 'passenger_name')  String passengerName, @JsonKey(name: 'passenger_phone')  String passengerPhone, @JsonKey(name: 'pickup_station_id')  String? pickupStationId, @JsonKey(name: 'dropoff_station_id')  String? dropoffStationId, @JsonKey(name: 'ticket_code')  String ticketCode, @JsonKey(name: 'ticket_count')  int ticketCount, @JsonKey(name: 'total_price')  double totalPrice, @JsonKey(name: 'refund_amount')  double? refundAmount, @JsonKey(name: 'special_notes')  String? specialNotes,  CoachBookingStatus status, @JsonKey(name: 'cancelled_at')  DateTime? cancelledAt, @JsonKey(name: 'cancellation_reason')  String? cancellationReason, @JsonKey(name: 'cancelled_by')  String? cancelledBy, @JsonKey(name: 'no_show_note')  String? noShowNote, @JsonKey(name: 'no_show_at')  DateTime? noShowAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoachBooking() when $default != null:
return $default(_that.id,_that.userId,_that.coachInstanceId,_that.passengerName,_that.passengerPhone,_that.pickupStationId,_that.dropoffStationId,_that.ticketCode,_that.ticketCount,_that.totalPrice,_that.refundAmount,_that.specialNotes,_that.status,_that.cancelledAt,_that.cancellationReason,_that.cancelledBy,_that.noShowNote,_that.noShowAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'coach_instance_id')  String coachInstanceId, @JsonKey(name: 'passenger_name')  String passengerName, @JsonKey(name: 'passenger_phone')  String passengerPhone, @JsonKey(name: 'pickup_station_id')  String? pickupStationId, @JsonKey(name: 'dropoff_station_id')  String? dropoffStationId, @JsonKey(name: 'ticket_code')  String ticketCode, @JsonKey(name: 'ticket_count')  int ticketCount, @JsonKey(name: 'total_price')  double totalPrice, @JsonKey(name: 'refund_amount')  double? refundAmount, @JsonKey(name: 'special_notes')  String? specialNotes,  CoachBookingStatus status, @JsonKey(name: 'cancelled_at')  DateTime? cancelledAt, @JsonKey(name: 'cancellation_reason')  String? cancellationReason, @JsonKey(name: 'cancelled_by')  String? cancelledBy, @JsonKey(name: 'no_show_note')  String? noShowNote, @JsonKey(name: 'no_show_at')  DateTime? noShowAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _CoachBooking():
return $default(_that.id,_that.userId,_that.coachInstanceId,_that.passengerName,_that.passengerPhone,_that.pickupStationId,_that.dropoffStationId,_that.ticketCode,_that.ticketCount,_that.totalPrice,_that.refundAmount,_that.specialNotes,_that.status,_that.cancelledAt,_that.cancellationReason,_that.cancelledBy,_that.noShowNote,_that.noShowAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'coach_instance_id')  String coachInstanceId, @JsonKey(name: 'passenger_name')  String passengerName, @JsonKey(name: 'passenger_phone')  String passengerPhone, @JsonKey(name: 'pickup_station_id')  String? pickupStationId, @JsonKey(name: 'dropoff_station_id')  String? dropoffStationId, @JsonKey(name: 'ticket_code')  String ticketCode, @JsonKey(name: 'ticket_count')  int ticketCount, @JsonKey(name: 'total_price')  double totalPrice, @JsonKey(name: 'refund_amount')  double? refundAmount, @JsonKey(name: 'special_notes')  String? specialNotes,  CoachBookingStatus status, @JsonKey(name: 'cancelled_at')  DateTime? cancelledAt, @JsonKey(name: 'cancellation_reason')  String? cancellationReason, @JsonKey(name: 'cancelled_by')  String? cancelledBy, @JsonKey(name: 'no_show_note')  String? noShowNote, @JsonKey(name: 'no_show_at')  DateTime? noShowAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _CoachBooking() when $default != null:
return $default(_that.id,_that.userId,_that.coachInstanceId,_that.passengerName,_that.passengerPhone,_that.pickupStationId,_that.dropoffStationId,_that.ticketCode,_that.ticketCount,_that.totalPrice,_that.refundAmount,_that.specialNotes,_that.status,_that.cancelledAt,_that.cancellationReason,_that.cancelledBy,_that.noShowNote,_that.noShowAt,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CoachBooking implements CoachBooking {
  const _CoachBooking({this.id, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'coach_instance_id') required this.coachInstanceId, @JsonKey(name: 'passenger_name') required this.passengerName, @JsonKey(name: 'passenger_phone') required this.passengerPhone, @JsonKey(name: 'pickup_station_id') this.pickupStationId, @JsonKey(name: 'dropoff_station_id') this.dropoffStationId, @JsonKey(name: 'ticket_code') required this.ticketCode, @JsonKey(name: 'ticket_count') required this.ticketCount, @JsonKey(name: 'total_price') required this.totalPrice, @JsonKey(name: 'refund_amount') this.refundAmount, @JsonKey(name: 'special_notes') this.specialNotes, required this.status, @JsonKey(name: 'cancelled_at') this.cancelledAt, @JsonKey(name: 'cancellation_reason') this.cancellationReason, @JsonKey(name: 'cancelled_by') this.cancelledBy, @JsonKey(name: 'no_show_note') this.noShowNote, @JsonKey(name: 'no_show_at') this.noShowAt, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _CoachBooking.fromJson(Map<String, dynamic> json) => _$CoachBookingFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'coach_instance_id') final  String coachInstanceId;
@override@JsonKey(name: 'passenger_name') final  String passengerName;
@override@JsonKey(name: 'passenger_phone') final  String passengerPhone;
@override@JsonKey(name: 'pickup_station_id') final  String? pickupStationId;
@override@JsonKey(name: 'dropoff_station_id') final  String? dropoffStationId;
@override@JsonKey(name: 'ticket_code') final  String ticketCode;
@override@JsonKey(name: 'ticket_count') final  int ticketCount;
@override@JsonKey(name: 'total_price') final  double totalPrice;
@override@JsonKey(name: 'refund_amount') final  double? refundAmount;
@override@JsonKey(name: 'special_notes') final  String? specialNotes;
@override final  CoachBookingStatus status;
@override@JsonKey(name: 'cancelled_at') final  DateTime? cancelledAt;
@override@JsonKey(name: 'cancellation_reason') final  String? cancellationReason;
@override@JsonKey(name: 'cancelled_by') final  String? cancelledBy;
@override@JsonKey(name: 'no_show_note') final  String? noShowNote;
@override@JsonKey(name: 'no_show_at') final  DateTime? noShowAt;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of CoachBooking
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoachBookingCopyWith<_CoachBooking> get copyWith => __$CoachBookingCopyWithImpl<_CoachBooking>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CoachBookingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoachBooking&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.coachInstanceId, coachInstanceId) || other.coachInstanceId == coachInstanceId)&&(identical(other.passengerName, passengerName) || other.passengerName == passengerName)&&(identical(other.passengerPhone, passengerPhone) || other.passengerPhone == passengerPhone)&&(identical(other.pickupStationId, pickupStationId) || other.pickupStationId == pickupStationId)&&(identical(other.dropoffStationId, dropoffStationId) || other.dropoffStationId == dropoffStationId)&&(identical(other.ticketCode, ticketCode) || other.ticketCode == ticketCode)&&(identical(other.ticketCount, ticketCount) || other.ticketCount == ticketCount)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.refundAmount, refundAmount) || other.refundAmount == refundAmount)&&(identical(other.specialNotes, specialNotes) || other.specialNotes == specialNotes)&&(identical(other.status, status) || other.status == status)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&(identical(other.cancellationReason, cancellationReason) || other.cancellationReason == cancellationReason)&&(identical(other.cancelledBy, cancelledBy) || other.cancelledBy == cancelledBy)&&(identical(other.noShowNote, noShowNote) || other.noShowNote == noShowNote)&&(identical(other.noShowAt, noShowAt) || other.noShowAt == noShowAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,coachInstanceId,passengerName,passengerPhone,pickupStationId,dropoffStationId,ticketCode,ticketCount,totalPrice,refundAmount,specialNotes,status,cancelledAt,cancellationReason,cancelledBy,noShowNote,noShowAt,createdAt,updatedAt]);

@override
String toString() {
  return 'CoachBooking(id: $id, userId: $userId, coachInstanceId: $coachInstanceId, passengerName: $passengerName, passengerPhone: $passengerPhone, pickupStationId: $pickupStationId, dropoffStationId: $dropoffStationId, ticketCode: $ticketCode, ticketCount: $ticketCount, totalPrice: $totalPrice, refundAmount: $refundAmount, specialNotes: $specialNotes, status: $status, cancelledAt: $cancelledAt, cancellationReason: $cancellationReason, cancelledBy: $cancelledBy, noShowNote: $noShowNote, noShowAt: $noShowAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CoachBookingCopyWith<$Res> implements $CoachBookingCopyWith<$Res> {
  factory _$CoachBookingCopyWith(_CoachBooking value, $Res Function(_CoachBooking) _then) = __$CoachBookingCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'coach_instance_id') String coachInstanceId,@JsonKey(name: 'passenger_name') String passengerName,@JsonKey(name: 'passenger_phone') String passengerPhone,@JsonKey(name: 'pickup_station_id') String? pickupStationId,@JsonKey(name: 'dropoff_station_id') String? dropoffStationId,@JsonKey(name: 'ticket_code') String ticketCode,@JsonKey(name: 'ticket_count') int ticketCount,@JsonKey(name: 'total_price') double totalPrice,@JsonKey(name: 'refund_amount') double? refundAmount,@JsonKey(name: 'special_notes') String? specialNotes, CoachBookingStatus status,@JsonKey(name: 'cancelled_at') DateTime? cancelledAt,@JsonKey(name: 'cancellation_reason') String? cancellationReason,@JsonKey(name: 'cancelled_by') String? cancelledBy,@JsonKey(name: 'no_show_note') String? noShowNote,@JsonKey(name: 'no_show_at') DateTime? noShowAt,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$CoachBookingCopyWithImpl<$Res>
    implements _$CoachBookingCopyWith<$Res> {
  __$CoachBookingCopyWithImpl(this._self, this._then);

  final _CoachBooking _self;
  final $Res Function(_CoachBooking) _then;

/// Create a copy of CoachBooking
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? userId = null,Object? coachInstanceId = null,Object? passengerName = null,Object? passengerPhone = null,Object? pickupStationId = freezed,Object? dropoffStationId = freezed,Object? ticketCode = null,Object? ticketCount = null,Object? totalPrice = null,Object? refundAmount = freezed,Object? specialNotes = freezed,Object? status = null,Object? cancelledAt = freezed,Object? cancellationReason = freezed,Object? cancelledBy = freezed,Object? noShowNote = freezed,Object? noShowAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_CoachBooking(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,coachInstanceId: null == coachInstanceId ? _self.coachInstanceId : coachInstanceId // ignore: cast_nullable_to_non_nullable
as String,passengerName: null == passengerName ? _self.passengerName : passengerName // ignore: cast_nullable_to_non_nullable
as String,passengerPhone: null == passengerPhone ? _self.passengerPhone : passengerPhone // ignore: cast_nullable_to_non_nullable
as String,pickupStationId: freezed == pickupStationId ? _self.pickupStationId : pickupStationId // ignore: cast_nullable_to_non_nullable
as String?,dropoffStationId: freezed == dropoffStationId ? _self.dropoffStationId : dropoffStationId // ignore: cast_nullable_to_non_nullable
as String?,ticketCode: null == ticketCode ? _self.ticketCode : ticketCode // ignore: cast_nullable_to_non_nullable
as String,ticketCount: null == ticketCount ? _self.ticketCount : ticketCount // ignore: cast_nullable_to_non_nullable
as int,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,refundAmount: freezed == refundAmount ? _self.refundAmount : refundAmount // ignore: cast_nullable_to_non_nullable
as double?,specialNotes: freezed == specialNotes ? _self.specialNotes : specialNotes // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CoachBookingStatus,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,cancellationReason: freezed == cancellationReason ? _self.cancellationReason : cancellationReason // ignore: cast_nullable_to_non_nullable
as String?,cancelledBy: freezed == cancelledBy ? _self.cancelledBy : cancelledBy // ignore: cast_nullable_to_non_nullable
as String?,noShowNote: freezed == noShowNote ? _self.noShowNote : noShowNote // ignore: cast_nullable_to_non_nullable
as String?,noShowAt: freezed == noShowAt ? _self.noShowAt : noShowAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
