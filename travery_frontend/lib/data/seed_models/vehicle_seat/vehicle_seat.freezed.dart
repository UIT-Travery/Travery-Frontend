// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_seat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VehicleSeat {

 String? get id;@JsonKey(name: 'vehicle_id') String get vehicleId;@JsonKey(name: 'seat_code') String get seatCode; int get floor; SeatRowZone get rowZone;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of VehicleSeat
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleSeatCopyWith<VehicleSeat> get copyWith => _$VehicleSeatCopyWithImpl<VehicleSeat>(this as VehicleSeat, _$identity);

  /// Serializes this VehicleSeat to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleSeat&&(identical(other.id, id) || other.id == id)&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.seatCode, seatCode) || other.seatCode == seatCode)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.rowZone, rowZone) || other.rowZone == rowZone)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,vehicleId,seatCode,floor,rowZone,createdAt,updatedAt);

@override
String toString() {
  return 'VehicleSeat(id: $id, vehicleId: $vehicleId, seatCode: $seatCode, floor: $floor, rowZone: $rowZone, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $VehicleSeatCopyWith<$Res>  {
  factory $VehicleSeatCopyWith(VehicleSeat value, $Res Function(VehicleSeat) _then) = _$VehicleSeatCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'vehicle_id') String vehicleId,@JsonKey(name: 'seat_code') String seatCode, int floor, SeatRowZone rowZone,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$VehicleSeatCopyWithImpl<$Res>
    implements $VehicleSeatCopyWith<$Res> {
  _$VehicleSeatCopyWithImpl(this._self, this._then);

  final VehicleSeat _self;
  final $Res Function(VehicleSeat) _then;

/// Create a copy of VehicleSeat
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? vehicleId = null,Object? seatCode = null,Object? floor = null,Object? rowZone = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,seatCode: null == seatCode ? _self.seatCode : seatCode // ignore: cast_nullable_to_non_nullable
as String,floor: null == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int,rowZone: null == rowZone ? _self.rowZone : rowZone // ignore: cast_nullable_to_non_nullable
as SeatRowZone,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [VehicleSeat].
extension VehicleSeatPatterns on VehicleSeat {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VehicleSeat value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VehicleSeat() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VehicleSeat value)  $default,){
final _that = this;
switch (_that) {
case _VehicleSeat():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VehicleSeat value)?  $default,){
final _that = this;
switch (_that) {
case _VehicleSeat() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'vehicle_id')  String vehicleId, @JsonKey(name: 'seat_code')  String seatCode,  int floor,  SeatRowZone rowZone, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VehicleSeat() when $default != null:
return $default(_that.id,_that.vehicleId,_that.seatCode,_that.floor,_that.rowZone,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'vehicle_id')  String vehicleId, @JsonKey(name: 'seat_code')  String seatCode,  int floor,  SeatRowZone rowZone, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _VehicleSeat():
return $default(_that.id,_that.vehicleId,_that.seatCode,_that.floor,_that.rowZone,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'vehicle_id')  String vehicleId, @JsonKey(name: 'seat_code')  String seatCode,  int floor,  SeatRowZone rowZone, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _VehicleSeat() when $default != null:
return $default(_that.id,_that.vehicleId,_that.seatCode,_that.floor,_that.rowZone,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VehicleSeat implements VehicleSeat {
  const _VehicleSeat({this.id, @JsonKey(name: 'vehicle_id') required this.vehicleId, @JsonKey(name: 'seat_code') required this.seatCode, required this.floor, required this.rowZone, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _VehicleSeat.fromJson(Map<String, dynamic> json) => _$VehicleSeatFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'vehicle_id') final  String vehicleId;
@override@JsonKey(name: 'seat_code') final  String seatCode;
@override final  int floor;
@override final  SeatRowZone rowZone;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of VehicleSeat
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleSeatCopyWith<_VehicleSeat> get copyWith => __$VehicleSeatCopyWithImpl<_VehicleSeat>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VehicleSeatToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleSeat&&(identical(other.id, id) || other.id == id)&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.seatCode, seatCode) || other.seatCode == seatCode)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.rowZone, rowZone) || other.rowZone == rowZone)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,vehicleId,seatCode,floor,rowZone,createdAt,updatedAt);

@override
String toString() {
  return 'VehicleSeat(id: $id, vehicleId: $vehicleId, seatCode: $seatCode, floor: $floor, rowZone: $rowZone, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$VehicleSeatCopyWith<$Res> implements $VehicleSeatCopyWith<$Res> {
  factory _$VehicleSeatCopyWith(_VehicleSeat value, $Res Function(_VehicleSeat) _then) = __$VehicleSeatCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'vehicle_id') String vehicleId,@JsonKey(name: 'seat_code') String seatCode, int floor, SeatRowZone rowZone,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$VehicleSeatCopyWithImpl<$Res>
    implements _$VehicleSeatCopyWith<$Res> {
  __$VehicleSeatCopyWithImpl(this._self, this._then);

  final _VehicleSeat _self;
  final $Res Function(_VehicleSeat) _then;

/// Create a copy of VehicleSeat
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? vehicleId = null,Object? seatCode = null,Object? floor = null,Object? rowZone = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_VehicleSeat(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,seatCode: null == seatCode ? _self.seatCode : seatCode // ignore: cast_nullable_to_non_nullable
as String,floor: null == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int,rowZone: null == rowZone ? _self.rowZone : rowZone // ignore: cast_nullable_to_non_nullable
as SeatRowZone,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
