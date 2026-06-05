// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coach_route_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoachRouteResponse {

 String get id; String get originDestinationId; String get originDestinationName; String get destinationDestinationId; String get destinationDestinationName; double get distanceKm; double get estimatedHours; double get basePrice; String? get refundPolicyId; String? get refundPolicyName; double get averageRating; int get reviewCount;
/// Create a copy of CoachRouteResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoachRouteResponseCopyWith<CoachRouteResponse> get copyWith => _$CoachRouteResponseCopyWithImpl<CoachRouteResponse>(this as CoachRouteResponse, _$identity);

  /// Serializes this CoachRouteResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoachRouteResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.originDestinationId, originDestinationId) || other.originDestinationId == originDestinationId)&&(identical(other.originDestinationName, originDestinationName) || other.originDestinationName == originDestinationName)&&(identical(other.destinationDestinationId, destinationDestinationId) || other.destinationDestinationId == destinationDestinationId)&&(identical(other.destinationDestinationName, destinationDestinationName) || other.destinationDestinationName == destinationDestinationName)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.estimatedHours, estimatedHours) || other.estimatedHours == estimatedHours)&&(identical(other.basePrice, basePrice) || other.basePrice == basePrice)&&(identical(other.refundPolicyId, refundPolicyId) || other.refundPolicyId == refundPolicyId)&&(identical(other.refundPolicyName, refundPolicyName) || other.refundPolicyName == refundPolicyName)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,originDestinationId,originDestinationName,destinationDestinationId,destinationDestinationName,distanceKm,estimatedHours,basePrice,refundPolicyId,refundPolicyName,averageRating,reviewCount);

@override
String toString() {
  return 'CoachRouteResponse(id: $id, originDestinationId: $originDestinationId, originDestinationName: $originDestinationName, destinationDestinationId: $destinationDestinationId, destinationDestinationName: $destinationDestinationName, distanceKm: $distanceKm, estimatedHours: $estimatedHours, basePrice: $basePrice, refundPolicyId: $refundPolicyId, refundPolicyName: $refundPolicyName, averageRating: $averageRating, reviewCount: $reviewCount)';
}


}

/// @nodoc
abstract mixin class $CoachRouteResponseCopyWith<$Res>  {
  factory $CoachRouteResponseCopyWith(CoachRouteResponse value, $Res Function(CoachRouteResponse) _then) = _$CoachRouteResponseCopyWithImpl;
@useResult
$Res call({
 String id, String originDestinationId, String originDestinationName, String destinationDestinationId, String destinationDestinationName, double distanceKm, double estimatedHours, double basePrice, String? refundPolicyId, String? refundPolicyName, double averageRating, int reviewCount
});




}
/// @nodoc
class _$CoachRouteResponseCopyWithImpl<$Res>
    implements $CoachRouteResponseCopyWith<$Res> {
  _$CoachRouteResponseCopyWithImpl(this._self, this._then);

  final CoachRouteResponse _self;
  final $Res Function(CoachRouteResponse) _then;

/// Create a copy of CoachRouteResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? originDestinationId = null,Object? originDestinationName = null,Object? destinationDestinationId = null,Object? destinationDestinationName = null,Object? distanceKm = null,Object? estimatedHours = null,Object? basePrice = null,Object? refundPolicyId = freezed,Object? refundPolicyName = freezed,Object? averageRating = null,Object? reviewCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,originDestinationId: null == originDestinationId ? _self.originDestinationId : originDestinationId // ignore: cast_nullable_to_non_nullable
as String,originDestinationName: null == originDestinationName ? _self.originDestinationName : originDestinationName // ignore: cast_nullable_to_non_nullable
as String,destinationDestinationId: null == destinationDestinationId ? _self.destinationDestinationId : destinationDestinationId // ignore: cast_nullable_to_non_nullable
as String,destinationDestinationName: null == destinationDestinationName ? _self.destinationDestinationName : destinationDestinationName // ignore: cast_nullable_to_non_nullable
as String,distanceKm: null == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double,estimatedHours: null == estimatedHours ? _self.estimatedHours : estimatedHours // ignore: cast_nullable_to_non_nullable
as double,basePrice: null == basePrice ? _self.basePrice : basePrice // ignore: cast_nullable_to_non_nullable
as double,refundPolicyId: freezed == refundPolicyId ? _self.refundPolicyId : refundPolicyId // ignore: cast_nullable_to_non_nullable
as String?,refundPolicyName: freezed == refundPolicyName ? _self.refundPolicyName : refundPolicyName // ignore: cast_nullable_to_non_nullable
as String?,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CoachRouteResponse].
extension CoachRouteResponsePatterns on CoachRouteResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoachRouteResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoachRouteResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoachRouteResponse value)  $default,){
final _that = this;
switch (_that) {
case _CoachRouteResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoachRouteResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CoachRouteResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String originDestinationId,  String originDestinationName,  String destinationDestinationId,  String destinationDestinationName,  double distanceKm,  double estimatedHours,  double basePrice,  String? refundPolicyId,  String? refundPolicyName,  double averageRating,  int reviewCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoachRouteResponse() when $default != null:
return $default(_that.id,_that.originDestinationId,_that.originDestinationName,_that.destinationDestinationId,_that.destinationDestinationName,_that.distanceKm,_that.estimatedHours,_that.basePrice,_that.refundPolicyId,_that.refundPolicyName,_that.averageRating,_that.reviewCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String originDestinationId,  String originDestinationName,  String destinationDestinationId,  String destinationDestinationName,  double distanceKm,  double estimatedHours,  double basePrice,  String? refundPolicyId,  String? refundPolicyName,  double averageRating,  int reviewCount)  $default,) {final _that = this;
switch (_that) {
case _CoachRouteResponse():
return $default(_that.id,_that.originDestinationId,_that.originDestinationName,_that.destinationDestinationId,_that.destinationDestinationName,_that.distanceKm,_that.estimatedHours,_that.basePrice,_that.refundPolicyId,_that.refundPolicyName,_that.averageRating,_that.reviewCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String originDestinationId,  String originDestinationName,  String destinationDestinationId,  String destinationDestinationName,  double distanceKm,  double estimatedHours,  double basePrice,  String? refundPolicyId,  String? refundPolicyName,  double averageRating,  int reviewCount)?  $default,) {final _that = this;
switch (_that) {
case _CoachRouteResponse() when $default != null:
return $default(_that.id,_that.originDestinationId,_that.originDestinationName,_that.destinationDestinationId,_that.destinationDestinationName,_that.distanceKm,_that.estimatedHours,_that.basePrice,_that.refundPolicyId,_that.refundPolicyName,_that.averageRating,_that.reviewCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CoachRouteResponse implements CoachRouteResponse {
  const _CoachRouteResponse({required this.id, required this.originDestinationId, required this.originDestinationName, required this.destinationDestinationId, required this.destinationDestinationName, required this.distanceKm, required this.estimatedHours, required this.basePrice, this.refundPolicyId, this.refundPolicyName, required this.averageRating, required this.reviewCount});
  factory _CoachRouteResponse.fromJson(Map<String, dynamic> json) => _$CoachRouteResponseFromJson(json);

@override final  String id;
@override final  String originDestinationId;
@override final  String originDestinationName;
@override final  String destinationDestinationId;
@override final  String destinationDestinationName;
@override final  double distanceKm;
@override final  double estimatedHours;
@override final  double basePrice;
@override final  String? refundPolicyId;
@override final  String? refundPolicyName;
@override final  double averageRating;
@override final  int reviewCount;

/// Create a copy of CoachRouteResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoachRouteResponseCopyWith<_CoachRouteResponse> get copyWith => __$CoachRouteResponseCopyWithImpl<_CoachRouteResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CoachRouteResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoachRouteResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.originDestinationId, originDestinationId) || other.originDestinationId == originDestinationId)&&(identical(other.originDestinationName, originDestinationName) || other.originDestinationName == originDestinationName)&&(identical(other.destinationDestinationId, destinationDestinationId) || other.destinationDestinationId == destinationDestinationId)&&(identical(other.destinationDestinationName, destinationDestinationName) || other.destinationDestinationName == destinationDestinationName)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.estimatedHours, estimatedHours) || other.estimatedHours == estimatedHours)&&(identical(other.basePrice, basePrice) || other.basePrice == basePrice)&&(identical(other.refundPolicyId, refundPolicyId) || other.refundPolicyId == refundPolicyId)&&(identical(other.refundPolicyName, refundPolicyName) || other.refundPolicyName == refundPolicyName)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,originDestinationId,originDestinationName,destinationDestinationId,destinationDestinationName,distanceKm,estimatedHours,basePrice,refundPolicyId,refundPolicyName,averageRating,reviewCount);

@override
String toString() {
  return 'CoachRouteResponse(id: $id, originDestinationId: $originDestinationId, originDestinationName: $originDestinationName, destinationDestinationId: $destinationDestinationId, destinationDestinationName: $destinationDestinationName, distanceKm: $distanceKm, estimatedHours: $estimatedHours, basePrice: $basePrice, refundPolicyId: $refundPolicyId, refundPolicyName: $refundPolicyName, averageRating: $averageRating, reviewCount: $reviewCount)';
}


}

/// @nodoc
abstract mixin class _$CoachRouteResponseCopyWith<$Res> implements $CoachRouteResponseCopyWith<$Res> {
  factory _$CoachRouteResponseCopyWith(_CoachRouteResponse value, $Res Function(_CoachRouteResponse) _then) = __$CoachRouteResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, String originDestinationId, String originDestinationName, String destinationDestinationId, String destinationDestinationName, double distanceKm, double estimatedHours, double basePrice, String? refundPolicyId, String? refundPolicyName, double averageRating, int reviewCount
});




}
/// @nodoc
class __$CoachRouteResponseCopyWithImpl<$Res>
    implements _$CoachRouteResponseCopyWith<$Res> {
  __$CoachRouteResponseCopyWithImpl(this._self, this._then);

  final _CoachRouteResponse _self;
  final $Res Function(_CoachRouteResponse) _then;

/// Create a copy of CoachRouteResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? originDestinationId = null,Object? originDestinationName = null,Object? destinationDestinationId = null,Object? destinationDestinationName = null,Object? distanceKm = null,Object? estimatedHours = null,Object? basePrice = null,Object? refundPolicyId = freezed,Object? refundPolicyName = freezed,Object? averageRating = null,Object? reviewCount = null,}) {
  return _then(_CoachRouteResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,originDestinationId: null == originDestinationId ? _self.originDestinationId : originDestinationId // ignore: cast_nullable_to_non_nullable
as String,originDestinationName: null == originDestinationName ? _self.originDestinationName : originDestinationName // ignore: cast_nullable_to_non_nullable
as String,destinationDestinationId: null == destinationDestinationId ? _self.destinationDestinationId : destinationDestinationId // ignore: cast_nullable_to_non_nullable
as String,destinationDestinationName: null == destinationDestinationName ? _self.destinationDestinationName : destinationDestinationName // ignore: cast_nullable_to_non_nullable
as String,distanceKm: null == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double,estimatedHours: null == estimatedHours ? _self.estimatedHours : estimatedHours // ignore: cast_nullable_to_non_nullable
as double,basePrice: null == basePrice ? _self.basePrice : basePrice // ignore: cast_nullable_to_non_nullable
as double,refundPolicyId: freezed == refundPolicyId ? _self.refundPolicyId : refundPolicyId // ignore: cast_nullable_to_non_nullable
as String?,refundPolicyName: freezed == refundPolicyName ? _self.refundPolicyName : refundPolicyName // ignore: cast_nullable_to_non_nullable
as String?,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
