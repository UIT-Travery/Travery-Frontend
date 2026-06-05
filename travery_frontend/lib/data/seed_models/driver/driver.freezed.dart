// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'driver.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Driver {

 String? get id;@JsonKey(name: 'full_name') String get fullName; String get phone;@JsonKey(name: 'license_number') String get licenseNumber; DriverStatus get status;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of Driver
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DriverCopyWith<Driver> get copyWith => _$DriverCopyWithImpl<Driver>(this as Driver, _$identity);

  /// Serializes this Driver to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Driver&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,phone,licenseNumber,status,createdAt,updatedAt);

@override
String toString() {
  return 'Driver(id: $id, fullName: $fullName, phone: $phone, licenseNumber: $licenseNumber, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $DriverCopyWith<$Res>  {
  factory $DriverCopyWith(Driver value, $Res Function(Driver) _then) = _$DriverCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'full_name') String fullName, String phone,@JsonKey(name: 'license_number') String licenseNumber, DriverStatus status,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$DriverCopyWithImpl<$Res>
    implements $DriverCopyWith<$Res> {
  _$DriverCopyWithImpl(this._self, this._then);

  final Driver _self;
  final $Res Function(Driver) _then;

/// Create a copy of Driver
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? fullName = null,Object? phone = null,Object? licenseNumber = null,Object? status = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,licenseNumber: null == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DriverStatus,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Driver].
extension DriverPatterns on Driver {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Driver value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Driver() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Driver value)  $default,){
final _that = this;
switch (_that) {
case _Driver():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Driver value)?  $default,){
final _that = this;
switch (_that) {
case _Driver() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'full_name')  String fullName,  String phone, @JsonKey(name: 'license_number')  String licenseNumber,  DriverStatus status, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Driver() when $default != null:
return $default(_that.id,_that.fullName,_that.phone,_that.licenseNumber,_that.status,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'full_name')  String fullName,  String phone, @JsonKey(name: 'license_number')  String licenseNumber,  DriverStatus status, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Driver():
return $default(_that.id,_that.fullName,_that.phone,_that.licenseNumber,_that.status,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'full_name')  String fullName,  String phone, @JsonKey(name: 'license_number')  String licenseNumber,  DriverStatus status, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Driver() when $default != null:
return $default(_that.id,_that.fullName,_that.phone,_that.licenseNumber,_that.status,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Driver implements Driver {
  const _Driver({this.id, @JsonKey(name: 'full_name') required this.fullName, required this.phone, @JsonKey(name: 'license_number') required this.licenseNumber, required this.status, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'full_name') final  String fullName;
@override final  String phone;
@override@JsonKey(name: 'license_number') final  String licenseNumber;
@override final  DriverStatus status;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of Driver
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DriverCopyWith<_Driver> get copyWith => __$DriverCopyWithImpl<_Driver>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DriverToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Driver&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,phone,licenseNumber,status,createdAt,updatedAt);

@override
String toString() {
  return 'Driver(id: $id, fullName: $fullName, phone: $phone, licenseNumber: $licenseNumber, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DriverCopyWith<$Res> implements $DriverCopyWith<$Res> {
  factory _$DriverCopyWith(_Driver value, $Res Function(_Driver) _then) = __$DriverCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'full_name') String fullName, String phone,@JsonKey(name: 'license_number') String licenseNumber, DriverStatus status,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$DriverCopyWithImpl<$Res>
    implements _$DriverCopyWith<$Res> {
  __$DriverCopyWithImpl(this._self, this._then);

  final _Driver _self;
  final $Res Function(_Driver) _then;

/// Create a copy of Driver
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? fullName = null,Object? phone = null,Object? licenseNumber = null,Object? status = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Driver(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,licenseNumber: null == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DriverStatus,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
