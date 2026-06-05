// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coach_instance_seat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoachInstanceSeat {

 String? get id;@JsonKey(name: 'instance_id') String get instanceId;@JsonKey(name: 'seat_id') String get seatId;@JsonKey(name: 'booking_id') String? get bookingId; SeatStatus get status;@JsonKey(name: 'locked_until') DateTime? get lockedUntil;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of CoachInstanceSeat
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoachInstanceSeatCopyWith<CoachInstanceSeat> get copyWith => _$CoachInstanceSeatCopyWithImpl<CoachInstanceSeat>(this as CoachInstanceSeat, _$identity);

  /// Serializes this CoachInstanceSeat to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoachInstanceSeat&&(identical(other.id, id) || other.id == id)&&(identical(other.instanceId, instanceId) || other.instanceId == instanceId)&&(identical(other.seatId, seatId) || other.seatId == seatId)&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId)&&(identical(other.status, status) || other.status == status)&&(identical(other.lockedUntil, lockedUntil) || other.lockedUntil == lockedUntil)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,instanceId,seatId,bookingId,status,lockedUntil,createdAt,updatedAt);

@override
String toString() {
  return 'CoachInstanceSeat(id: $id, instanceId: $instanceId, seatId: $seatId, bookingId: $bookingId, status: $status, lockedUntil: $lockedUntil, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CoachInstanceSeatCopyWith<$Res>  {
  factory $CoachInstanceSeatCopyWith(CoachInstanceSeat value, $Res Function(CoachInstanceSeat) _then) = _$CoachInstanceSeatCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'instance_id') String instanceId,@JsonKey(name: 'seat_id') String seatId,@JsonKey(name: 'booking_id') String? bookingId, SeatStatus status,@JsonKey(name: 'locked_until') DateTime? lockedUntil,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$CoachInstanceSeatCopyWithImpl<$Res>
    implements $CoachInstanceSeatCopyWith<$Res> {
  _$CoachInstanceSeatCopyWithImpl(this._self, this._then);

  final CoachInstanceSeat _self;
  final $Res Function(CoachInstanceSeat) _then;

/// Create a copy of CoachInstanceSeat
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? instanceId = null,Object? seatId = null,Object? bookingId = freezed,Object? status = null,Object? lockedUntil = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,instanceId: null == instanceId ? _self.instanceId : instanceId // ignore: cast_nullable_to_non_nullable
as String,seatId: null == seatId ? _self.seatId : seatId // ignore: cast_nullable_to_non_nullable
as String,bookingId: freezed == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SeatStatus,lockedUntil: freezed == lockedUntil ? _self.lockedUntil : lockedUntil // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CoachInstanceSeat].
extension CoachInstanceSeatPatterns on CoachInstanceSeat {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoachInstanceSeat value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoachInstanceSeat() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoachInstanceSeat value)  $default,){
final _that = this;
switch (_that) {
case _CoachInstanceSeat():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoachInstanceSeat value)?  $default,){
final _that = this;
switch (_that) {
case _CoachInstanceSeat() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'instance_id')  String instanceId, @JsonKey(name: 'seat_id')  String seatId, @JsonKey(name: 'booking_id')  String? bookingId,  SeatStatus status, @JsonKey(name: 'locked_until')  DateTime? lockedUntil, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoachInstanceSeat() when $default != null:
return $default(_that.id,_that.instanceId,_that.seatId,_that.bookingId,_that.status,_that.lockedUntil,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'instance_id')  String instanceId, @JsonKey(name: 'seat_id')  String seatId, @JsonKey(name: 'booking_id')  String? bookingId,  SeatStatus status, @JsonKey(name: 'locked_until')  DateTime? lockedUntil, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _CoachInstanceSeat():
return $default(_that.id,_that.instanceId,_that.seatId,_that.bookingId,_that.status,_that.lockedUntil,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'instance_id')  String instanceId, @JsonKey(name: 'seat_id')  String seatId, @JsonKey(name: 'booking_id')  String? bookingId,  SeatStatus status, @JsonKey(name: 'locked_until')  DateTime? lockedUntil, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _CoachInstanceSeat() when $default != null:
return $default(_that.id,_that.instanceId,_that.seatId,_that.bookingId,_that.status,_that.lockedUntil,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CoachInstanceSeat implements CoachInstanceSeat {
  const _CoachInstanceSeat({this.id, @JsonKey(name: 'instance_id') required this.instanceId, @JsonKey(name: 'seat_id') required this.seatId, @JsonKey(name: 'booking_id') this.bookingId, required this.status, @JsonKey(name: 'locked_until') this.lockedUntil, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _CoachInstanceSeat.fromJson(Map<String, dynamic> json) => _$CoachInstanceSeatFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'instance_id') final  String instanceId;
@override@JsonKey(name: 'seat_id') final  String seatId;
@override@JsonKey(name: 'booking_id') final  String? bookingId;
@override final  SeatStatus status;
@override@JsonKey(name: 'locked_until') final  DateTime? lockedUntil;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of CoachInstanceSeat
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoachInstanceSeatCopyWith<_CoachInstanceSeat> get copyWith => __$CoachInstanceSeatCopyWithImpl<_CoachInstanceSeat>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CoachInstanceSeatToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoachInstanceSeat&&(identical(other.id, id) || other.id == id)&&(identical(other.instanceId, instanceId) || other.instanceId == instanceId)&&(identical(other.seatId, seatId) || other.seatId == seatId)&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId)&&(identical(other.status, status) || other.status == status)&&(identical(other.lockedUntil, lockedUntil) || other.lockedUntil == lockedUntil)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,instanceId,seatId,bookingId,status,lockedUntil,createdAt,updatedAt);

@override
String toString() {
  return 'CoachInstanceSeat(id: $id, instanceId: $instanceId, seatId: $seatId, bookingId: $bookingId, status: $status, lockedUntil: $lockedUntil, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CoachInstanceSeatCopyWith<$Res> implements $CoachInstanceSeatCopyWith<$Res> {
  factory _$CoachInstanceSeatCopyWith(_CoachInstanceSeat value, $Res Function(_CoachInstanceSeat) _then) = __$CoachInstanceSeatCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'instance_id') String instanceId,@JsonKey(name: 'seat_id') String seatId,@JsonKey(name: 'booking_id') String? bookingId, SeatStatus status,@JsonKey(name: 'locked_until') DateTime? lockedUntil,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$CoachInstanceSeatCopyWithImpl<$Res>
    implements _$CoachInstanceSeatCopyWith<$Res> {
  __$CoachInstanceSeatCopyWithImpl(this._self, this._then);

  final _CoachInstanceSeat _self;
  final $Res Function(_CoachInstanceSeat) _then;

/// Create a copy of CoachInstanceSeat
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? instanceId = null,Object? seatId = null,Object? bookingId = freezed,Object? status = null,Object? lockedUntil = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_CoachInstanceSeat(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,instanceId: null == instanceId ? _self.instanceId : instanceId // ignore: cast_nullable_to_non_nullable
as String,seatId: null == seatId ? _self.seatId : seatId // ignore: cast_nullable_to_non_nullable
as String,bookingId: freezed == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SeatStatus,lockedUntil: freezed == lockedUntil ? _self.lockedUntil : lockedUntil // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
