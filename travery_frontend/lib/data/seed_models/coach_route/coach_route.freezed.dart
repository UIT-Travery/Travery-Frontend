// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coach_route.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoachRoute {

 String? get id;@JsonKey(name: 'origin_code') String get originCode;@JsonKey(name: 'destination_code') String get destinationCode;@JsonKey(name: 'departure_time') String get departureTime;@JsonKey(name: 'estimated_duration_minutes') int get estimatedDurationMinutes;@JsonKey(name: 'base_price') double get basePrice;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;@JsonKey(name: 'deleted_at') DateTime? get deletedAt;
/// Create a copy of CoachRoute
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoachRouteCopyWith<CoachRoute> get copyWith => _$CoachRouteCopyWithImpl<CoachRoute>(this as CoachRoute, _$identity);

  /// Serializes this CoachRoute to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoachRoute&&(identical(other.id, id) || other.id == id)&&(identical(other.originCode, originCode) || other.originCode == originCode)&&(identical(other.destinationCode, destinationCode) || other.destinationCode == destinationCode)&&(identical(other.departureTime, departureTime) || other.departureTime == departureTime)&&(identical(other.estimatedDurationMinutes, estimatedDurationMinutes) || other.estimatedDurationMinutes == estimatedDurationMinutes)&&(identical(other.basePrice, basePrice) || other.basePrice == basePrice)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,originCode,destinationCode,departureTime,estimatedDurationMinutes,basePrice,isActive,createdAt,updatedAt,deletedAt);

@override
String toString() {
  return 'CoachRoute(id: $id, originCode: $originCode, destinationCode: $destinationCode, departureTime: $departureTime, estimatedDurationMinutes: $estimatedDurationMinutes, basePrice: $basePrice, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $CoachRouteCopyWith<$Res>  {
  factory $CoachRouteCopyWith(CoachRoute value, $Res Function(CoachRoute) _then) = _$CoachRouteCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'origin_code') String originCode,@JsonKey(name: 'destination_code') String destinationCode,@JsonKey(name: 'departure_time') String departureTime,@JsonKey(name: 'estimated_duration_minutes') int estimatedDurationMinutes,@JsonKey(name: 'base_price') double basePrice,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'deleted_at') DateTime? deletedAt
});




}
/// @nodoc
class _$CoachRouteCopyWithImpl<$Res>
    implements $CoachRouteCopyWith<$Res> {
  _$CoachRouteCopyWithImpl(this._self, this._then);

  final CoachRoute _self;
  final $Res Function(CoachRoute) _then;

/// Create a copy of CoachRoute
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? originCode = null,Object? destinationCode = null,Object? departureTime = null,Object? estimatedDurationMinutes = null,Object? basePrice = null,Object? isActive = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,originCode: null == originCode ? _self.originCode : originCode // ignore: cast_nullable_to_non_nullable
as String,destinationCode: null == destinationCode ? _self.destinationCode : destinationCode // ignore: cast_nullable_to_non_nullable
as String,departureTime: null == departureTime ? _self.departureTime : departureTime // ignore: cast_nullable_to_non_nullable
as String,estimatedDurationMinutes: null == estimatedDurationMinutes ? _self.estimatedDurationMinutes : estimatedDurationMinutes // ignore: cast_nullable_to_non_nullable
as int,basePrice: null == basePrice ? _self.basePrice : basePrice // ignore: cast_nullable_to_non_nullable
as double,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CoachRoute].
extension CoachRoutePatterns on CoachRoute {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoachRoute value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoachRoute() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoachRoute value)  $default,){
final _that = this;
switch (_that) {
case _CoachRoute():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoachRoute value)?  $default,){
final _that = this;
switch (_that) {
case _CoachRoute() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'origin_code')  String originCode, @JsonKey(name: 'destination_code')  String destinationCode, @JsonKey(name: 'departure_time')  String departureTime, @JsonKey(name: 'estimated_duration_minutes')  int estimatedDurationMinutes, @JsonKey(name: 'base_price')  double basePrice, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'deleted_at')  DateTime? deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoachRoute() when $default != null:
return $default(_that.id,_that.originCode,_that.destinationCode,_that.departureTime,_that.estimatedDurationMinutes,_that.basePrice,_that.isActive,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'origin_code')  String originCode, @JsonKey(name: 'destination_code')  String destinationCode, @JsonKey(name: 'departure_time')  String departureTime, @JsonKey(name: 'estimated_duration_minutes')  int estimatedDurationMinutes, @JsonKey(name: 'base_price')  double basePrice, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'deleted_at')  DateTime? deletedAt)  $default,) {final _that = this;
switch (_that) {
case _CoachRoute():
return $default(_that.id,_that.originCode,_that.destinationCode,_that.departureTime,_that.estimatedDurationMinutes,_that.basePrice,_that.isActive,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'origin_code')  String originCode, @JsonKey(name: 'destination_code')  String destinationCode, @JsonKey(name: 'departure_time')  String departureTime, @JsonKey(name: 'estimated_duration_minutes')  int estimatedDurationMinutes, @JsonKey(name: 'base_price')  double basePrice, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'deleted_at')  DateTime? deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _CoachRoute() when $default != null:
return $default(_that.id,_that.originCode,_that.destinationCode,_that.departureTime,_that.estimatedDurationMinutes,_that.basePrice,_that.isActive,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CoachRoute implements CoachRoute {
  const _CoachRoute({this.id, @JsonKey(name: 'origin_code') required this.originCode, @JsonKey(name: 'destination_code') required this.destinationCode, @JsonKey(name: 'departure_time') required this.departureTime, @JsonKey(name: 'estimated_duration_minutes') required this.estimatedDurationMinutes, @JsonKey(name: 'base_price') required this.basePrice, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'deleted_at') this.deletedAt});
  factory _CoachRoute.fromJson(Map<String, dynamic> json) => _$CoachRouteFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'origin_code') final  String originCode;
@override@JsonKey(name: 'destination_code') final  String destinationCode;
@override@JsonKey(name: 'departure_time') final  String departureTime;
@override@JsonKey(name: 'estimated_duration_minutes') final  int estimatedDurationMinutes;
@override@JsonKey(name: 'base_price') final  double basePrice;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;
@override@JsonKey(name: 'deleted_at') final  DateTime? deletedAt;

/// Create a copy of CoachRoute
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoachRouteCopyWith<_CoachRoute> get copyWith => __$CoachRouteCopyWithImpl<_CoachRoute>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CoachRouteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoachRoute&&(identical(other.id, id) || other.id == id)&&(identical(other.originCode, originCode) || other.originCode == originCode)&&(identical(other.destinationCode, destinationCode) || other.destinationCode == destinationCode)&&(identical(other.departureTime, departureTime) || other.departureTime == departureTime)&&(identical(other.estimatedDurationMinutes, estimatedDurationMinutes) || other.estimatedDurationMinutes == estimatedDurationMinutes)&&(identical(other.basePrice, basePrice) || other.basePrice == basePrice)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,originCode,destinationCode,departureTime,estimatedDurationMinutes,basePrice,isActive,createdAt,updatedAt,deletedAt);

@override
String toString() {
  return 'CoachRoute(id: $id, originCode: $originCode, destinationCode: $destinationCode, departureTime: $departureTime, estimatedDurationMinutes: $estimatedDurationMinutes, basePrice: $basePrice, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$CoachRouteCopyWith<$Res> implements $CoachRouteCopyWith<$Res> {
  factory _$CoachRouteCopyWith(_CoachRoute value, $Res Function(_CoachRoute) _then) = __$CoachRouteCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'origin_code') String originCode,@JsonKey(name: 'destination_code') String destinationCode,@JsonKey(name: 'departure_time') String departureTime,@JsonKey(name: 'estimated_duration_minutes') int estimatedDurationMinutes,@JsonKey(name: 'base_price') double basePrice,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'deleted_at') DateTime? deletedAt
});




}
/// @nodoc
class __$CoachRouteCopyWithImpl<$Res>
    implements _$CoachRouteCopyWith<$Res> {
  __$CoachRouteCopyWithImpl(this._self, this._then);

  final _CoachRoute _self;
  final $Res Function(_CoachRoute) _then;

/// Create a copy of CoachRoute
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? originCode = null,Object? destinationCode = null,Object? departureTime = null,Object? estimatedDurationMinutes = null,Object? basePrice = null,Object? isActive = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,}) {
  return _then(_CoachRoute(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,originCode: null == originCode ? _self.originCode : originCode // ignore: cast_nullable_to_non_nullable
as String,destinationCode: null == destinationCode ? _self.destinationCode : destinationCode // ignore: cast_nullable_to_non_nullable
as String,departureTime: null == departureTime ? _self.departureTime : departureTime // ignore: cast_nullable_to_non_nullable
as String,estimatedDurationMinutes: null == estimatedDurationMinutes ? _self.estimatedDurationMinutes : estimatedDurationMinutes // ignore: cast_nullable_to_non_nullable
as int,basePrice: null == basePrice ? _self.basePrice : basePrice // ignore: cast_nullable_to_non_nullable
as double,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
