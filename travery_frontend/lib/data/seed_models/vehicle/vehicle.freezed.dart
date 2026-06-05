// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Vehicle {

 String? get id;@JsonKey(name: 'license_plate') String get licensePlate; VehicleType get vehicleType;@JsonKey(name: 'total_seats') int get totalSeats;@JsonKey(name: 'floor_count') int get floorCount; CoachStatus get status;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;/// RELATIONS
 List<VehicleSeat>? get seats;
/// Create a copy of Vehicle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleCopyWith<Vehicle> get copyWith => _$VehicleCopyWithImpl<Vehicle>(this as Vehicle, _$identity);

  /// Serializes this Vehicle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Vehicle&&(identical(other.id, id) || other.id == id)&&(identical(other.licensePlate, licensePlate) || other.licensePlate == licensePlate)&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.totalSeats, totalSeats) || other.totalSeats == totalSeats)&&(identical(other.floorCount, floorCount) || other.floorCount == floorCount)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.seats, seats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,licensePlate,vehicleType,totalSeats,floorCount,status,createdAt,updatedAt,const DeepCollectionEquality().hash(seats));

@override
String toString() {
  return 'Vehicle(id: $id, licensePlate: $licensePlate, vehicleType: $vehicleType, totalSeats: $totalSeats, floorCount: $floorCount, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, seats: $seats)';
}


}

/// @nodoc
abstract mixin class $VehicleCopyWith<$Res>  {
  factory $VehicleCopyWith(Vehicle value, $Res Function(Vehicle) _then) = _$VehicleCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'license_plate') String licensePlate, VehicleType vehicleType,@JsonKey(name: 'total_seats') int totalSeats,@JsonKey(name: 'floor_count') int floorCount, CoachStatus status,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt, List<VehicleSeat>? seats
});




}
/// @nodoc
class _$VehicleCopyWithImpl<$Res>
    implements $VehicleCopyWith<$Res> {
  _$VehicleCopyWithImpl(this._self, this._then);

  final Vehicle _self;
  final $Res Function(Vehicle) _then;

/// Create a copy of Vehicle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? licensePlate = null,Object? vehicleType = null,Object? totalSeats = null,Object? floorCount = null,Object? status = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? seats = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,licensePlate: null == licensePlate ? _self.licensePlate : licensePlate // ignore: cast_nullable_to_non_nullable
as String,vehicleType: null == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as VehicleType,totalSeats: null == totalSeats ? _self.totalSeats : totalSeats // ignore: cast_nullable_to_non_nullable
as int,floorCount: null == floorCount ? _self.floorCount : floorCount // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CoachStatus,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,seats: freezed == seats ? _self.seats : seats // ignore: cast_nullable_to_non_nullable
as List<VehicleSeat>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Vehicle].
extension VehiclePatterns on Vehicle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Vehicle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Vehicle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Vehicle value)  $default,){
final _that = this;
switch (_that) {
case _Vehicle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Vehicle value)?  $default,){
final _that = this;
switch (_that) {
case _Vehicle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'license_plate')  String licensePlate,  VehicleType vehicleType, @JsonKey(name: 'total_seats')  int totalSeats, @JsonKey(name: 'floor_count')  int floorCount,  CoachStatus status, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  List<VehicleSeat>? seats)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Vehicle() when $default != null:
return $default(_that.id,_that.licensePlate,_that.vehicleType,_that.totalSeats,_that.floorCount,_that.status,_that.createdAt,_that.updatedAt,_that.seats);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'license_plate')  String licensePlate,  VehicleType vehicleType, @JsonKey(name: 'total_seats')  int totalSeats, @JsonKey(name: 'floor_count')  int floorCount,  CoachStatus status, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  List<VehicleSeat>? seats)  $default,) {final _that = this;
switch (_that) {
case _Vehicle():
return $default(_that.id,_that.licensePlate,_that.vehicleType,_that.totalSeats,_that.floorCount,_that.status,_that.createdAt,_that.updatedAt,_that.seats);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'license_plate')  String licensePlate,  VehicleType vehicleType, @JsonKey(name: 'total_seats')  int totalSeats, @JsonKey(name: 'floor_count')  int floorCount,  CoachStatus status, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  List<VehicleSeat>? seats)?  $default,) {final _that = this;
switch (_that) {
case _Vehicle() when $default != null:
return $default(_that.id,_that.licensePlate,_that.vehicleType,_that.totalSeats,_that.floorCount,_that.status,_that.createdAt,_that.updatedAt,_that.seats);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Vehicle implements Vehicle {
  const _Vehicle({this.id, @JsonKey(name: 'license_plate') required this.licensePlate, required this.vehicleType, @JsonKey(name: 'total_seats') required this.totalSeats, @JsonKey(name: 'floor_count') required this.floorCount, required this.status, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, final  List<VehicleSeat>? seats}): _seats = seats;
  factory _Vehicle.fromJson(Map<String, dynamic> json) => _$VehicleFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'license_plate') final  String licensePlate;
@override final  VehicleType vehicleType;
@override@JsonKey(name: 'total_seats') final  int totalSeats;
@override@JsonKey(name: 'floor_count') final  int floorCount;
@override final  CoachStatus status;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;
/// RELATIONS
 final  List<VehicleSeat>? _seats;
/// RELATIONS
@override List<VehicleSeat>? get seats {
  final value = _seats;
  if (value == null) return null;
  if (_seats is EqualUnmodifiableListView) return _seats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Vehicle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleCopyWith<_Vehicle> get copyWith => __$VehicleCopyWithImpl<_Vehicle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VehicleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Vehicle&&(identical(other.id, id) || other.id == id)&&(identical(other.licensePlate, licensePlate) || other.licensePlate == licensePlate)&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.totalSeats, totalSeats) || other.totalSeats == totalSeats)&&(identical(other.floorCount, floorCount) || other.floorCount == floorCount)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._seats, _seats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,licensePlate,vehicleType,totalSeats,floorCount,status,createdAt,updatedAt,const DeepCollectionEquality().hash(_seats));

@override
String toString() {
  return 'Vehicle(id: $id, licensePlate: $licensePlate, vehicleType: $vehicleType, totalSeats: $totalSeats, floorCount: $floorCount, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, seats: $seats)';
}


}

/// @nodoc
abstract mixin class _$VehicleCopyWith<$Res> implements $VehicleCopyWith<$Res> {
  factory _$VehicleCopyWith(_Vehicle value, $Res Function(_Vehicle) _then) = __$VehicleCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'license_plate') String licensePlate, VehicleType vehicleType,@JsonKey(name: 'total_seats') int totalSeats,@JsonKey(name: 'floor_count') int floorCount, CoachStatus status,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt, List<VehicleSeat>? seats
});




}
/// @nodoc
class __$VehicleCopyWithImpl<$Res>
    implements _$VehicleCopyWith<$Res> {
  __$VehicleCopyWithImpl(this._self, this._then);

  final _Vehicle _self;
  final $Res Function(_Vehicle) _then;

/// Create a copy of Vehicle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? licensePlate = null,Object? vehicleType = null,Object? totalSeats = null,Object? floorCount = null,Object? status = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? seats = freezed,}) {
  return _then(_Vehicle(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,licensePlate: null == licensePlate ? _self.licensePlate : licensePlate // ignore: cast_nullable_to_non_nullable
as String,vehicleType: null == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as VehicleType,totalSeats: null == totalSeats ? _self.totalSeats : totalSeats // ignore: cast_nullable_to_non_nullable
as int,floorCount: null == floorCount ? _self.floorCount : floorCount // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CoachStatus,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,seats: freezed == seats ? _self._seats : seats // ignore: cast_nullable_to_non_nullable
as List<VehicleSeat>?,
  ));
}


}

// dart format on
