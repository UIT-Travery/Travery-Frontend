// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_admin_profile_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateAdminProfileRequest {

 String? get fullName; String? get phoneNumber;
/// Create a copy of UpdateAdminProfileRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateAdminProfileRequestCopyWith<UpdateAdminProfileRequest> get copyWith => _$UpdateAdminProfileRequestCopyWithImpl<UpdateAdminProfileRequest>(this as UpdateAdminProfileRequest, _$identity);

  /// Serializes this UpdateAdminProfileRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateAdminProfileRequest&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,phoneNumber);

@override
String toString() {
  return 'UpdateAdminProfileRequest(fullName: $fullName, phoneNumber: $phoneNumber)';
}


}

/// @nodoc
abstract mixin class $UpdateAdminProfileRequestCopyWith<$Res>  {
  factory $UpdateAdminProfileRequestCopyWith(UpdateAdminProfileRequest value, $Res Function(UpdateAdminProfileRequest) _then) = _$UpdateAdminProfileRequestCopyWithImpl;
@useResult
$Res call({
 String? fullName, String? phoneNumber
});




}
/// @nodoc
class _$UpdateAdminProfileRequestCopyWithImpl<$Res>
    implements $UpdateAdminProfileRequestCopyWith<$Res> {
  _$UpdateAdminProfileRequestCopyWithImpl(this._self, this._then);

  final UpdateAdminProfileRequest _self;
  final $Res Function(UpdateAdminProfileRequest) _then;

/// Create a copy of UpdateAdminProfileRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = freezed,Object? phoneNumber = freezed,}) {
  return _then(_self.copyWith(
fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateAdminProfileRequest].
extension UpdateAdminProfileRequestPatterns on UpdateAdminProfileRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateAdminProfileRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateAdminProfileRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateAdminProfileRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateAdminProfileRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateAdminProfileRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateAdminProfileRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? fullName,  String? phoneNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateAdminProfileRequest() when $default != null:
return $default(_that.fullName,_that.phoneNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? fullName,  String? phoneNumber)  $default,) {final _that = this;
switch (_that) {
case _UpdateAdminProfileRequest():
return $default(_that.fullName,_that.phoneNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? fullName,  String? phoneNumber)?  $default,) {final _that = this;
switch (_that) {
case _UpdateAdminProfileRequest() when $default != null:
return $default(_that.fullName,_that.phoneNumber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateAdminProfileRequest implements UpdateAdminProfileRequest {
  const _UpdateAdminProfileRequest({this.fullName, this.phoneNumber});
  factory _UpdateAdminProfileRequest.fromJson(Map<String, dynamic> json) => _$UpdateAdminProfileRequestFromJson(json);

@override final  String? fullName;
@override final  String? phoneNumber;

/// Create a copy of UpdateAdminProfileRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateAdminProfileRequestCopyWith<_UpdateAdminProfileRequest> get copyWith => __$UpdateAdminProfileRequestCopyWithImpl<_UpdateAdminProfileRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateAdminProfileRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateAdminProfileRequest&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,phoneNumber);

@override
String toString() {
  return 'UpdateAdminProfileRequest(fullName: $fullName, phoneNumber: $phoneNumber)';
}


}

/// @nodoc
abstract mixin class _$UpdateAdminProfileRequestCopyWith<$Res> implements $UpdateAdminProfileRequestCopyWith<$Res> {
  factory _$UpdateAdminProfileRequestCopyWith(_UpdateAdminProfileRequest value, $Res Function(_UpdateAdminProfileRequest) _then) = __$UpdateAdminProfileRequestCopyWithImpl;
@override @useResult
$Res call({
 String? fullName, String? phoneNumber
});




}
/// @nodoc
class __$UpdateAdminProfileRequestCopyWithImpl<$Res>
    implements _$UpdateAdminProfileRequestCopyWith<$Res> {
  __$UpdateAdminProfileRequestCopyWithImpl(this._self, this._then);

  final _UpdateAdminProfileRequest _self;
  final $Res Function(_UpdateAdminProfileRequest) _then;

/// Create a copy of UpdateAdminProfileRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = freezed,Object? phoneNumber = freezed,}) {
  return _then(_UpdateAdminProfileRequest(
fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
