// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_coordinator_profile_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateCoordinatorProfileRequest {

 String? get fullName; String? get phoneNumber;/// One of: TOUR, HOTEL, COACH
 String? get department;
/// Create a copy of UpdateCoordinatorProfileRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateCoordinatorProfileRequestCopyWith<UpdateCoordinatorProfileRequest> get copyWith => _$UpdateCoordinatorProfileRequestCopyWithImpl<UpdateCoordinatorProfileRequest>(this as UpdateCoordinatorProfileRequest, _$identity);

  /// Serializes this UpdateCoordinatorProfileRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateCoordinatorProfileRequest&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.department, department) || other.department == department));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,phoneNumber,department);

@override
String toString() {
  return 'UpdateCoordinatorProfileRequest(fullName: $fullName, phoneNumber: $phoneNumber, department: $department)';
}


}

/// @nodoc
abstract mixin class $UpdateCoordinatorProfileRequestCopyWith<$Res>  {
  factory $UpdateCoordinatorProfileRequestCopyWith(UpdateCoordinatorProfileRequest value, $Res Function(UpdateCoordinatorProfileRequest) _then) = _$UpdateCoordinatorProfileRequestCopyWithImpl;
@useResult
$Res call({
 String? fullName, String? phoneNumber, String? department
});




}
/// @nodoc
class _$UpdateCoordinatorProfileRequestCopyWithImpl<$Res>
    implements $UpdateCoordinatorProfileRequestCopyWith<$Res> {
  _$UpdateCoordinatorProfileRequestCopyWithImpl(this._self, this._then);

  final UpdateCoordinatorProfileRequest _self;
  final $Res Function(UpdateCoordinatorProfileRequest) _then;

/// Create a copy of UpdateCoordinatorProfileRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = freezed,Object? phoneNumber = freezed,Object? department = freezed,}) {
  return _then(_self.copyWith(
fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateCoordinatorProfileRequest].
extension UpdateCoordinatorProfileRequestPatterns on UpdateCoordinatorProfileRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateCoordinatorProfileRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateCoordinatorProfileRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateCoordinatorProfileRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateCoordinatorProfileRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateCoordinatorProfileRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateCoordinatorProfileRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? fullName,  String? phoneNumber,  String? department)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateCoordinatorProfileRequest() when $default != null:
return $default(_that.fullName,_that.phoneNumber,_that.department);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? fullName,  String? phoneNumber,  String? department)  $default,) {final _that = this;
switch (_that) {
case _UpdateCoordinatorProfileRequest():
return $default(_that.fullName,_that.phoneNumber,_that.department);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? fullName,  String? phoneNumber,  String? department)?  $default,) {final _that = this;
switch (_that) {
case _UpdateCoordinatorProfileRequest() when $default != null:
return $default(_that.fullName,_that.phoneNumber,_that.department);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateCoordinatorProfileRequest implements UpdateCoordinatorProfileRequest {
  const _UpdateCoordinatorProfileRequest({this.fullName, this.phoneNumber, this.department});
  factory _UpdateCoordinatorProfileRequest.fromJson(Map<String, dynamic> json) => _$UpdateCoordinatorProfileRequestFromJson(json);

@override final  String? fullName;
@override final  String? phoneNumber;
/// One of: TOUR, HOTEL, COACH
@override final  String? department;

/// Create a copy of UpdateCoordinatorProfileRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateCoordinatorProfileRequestCopyWith<_UpdateCoordinatorProfileRequest> get copyWith => __$UpdateCoordinatorProfileRequestCopyWithImpl<_UpdateCoordinatorProfileRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateCoordinatorProfileRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateCoordinatorProfileRequest&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.department, department) || other.department == department));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,phoneNumber,department);

@override
String toString() {
  return 'UpdateCoordinatorProfileRequest(fullName: $fullName, phoneNumber: $phoneNumber, department: $department)';
}


}

/// @nodoc
abstract mixin class _$UpdateCoordinatorProfileRequestCopyWith<$Res> implements $UpdateCoordinatorProfileRequestCopyWith<$Res> {
  factory _$UpdateCoordinatorProfileRequestCopyWith(_UpdateCoordinatorProfileRequest value, $Res Function(_UpdateCoordinatorProfileRequest) _then) = __$UpdateCoordinatorProfileRequestCopyWithImpl;
@override @useResult
$Res call({
 String? fullName, String? phoneNumber, String? department
});




}
/// @nodoc
class __$UpdateCoordinatorProfileRequestCopyWithImpl<$Res>
    implements _$UpdateCoordinatorProfileRequestCopyWith<$Res> {
  __$UpdateCoordinatorProfileRequestCopyWithImpl(this._self, this._then);

  final _UpdateCoordinatorProfileRequest _self;
  final $Res Function(_UpdateCoordinatorProfileRequest) _then;

/// Create a copy of UpdateCoordinatorProfileRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = freezed,Object? phoneNumber = freezed,Object? department = freezed,}) {
  return _then(_UpdateCoordinatorProfileRequest(
fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
