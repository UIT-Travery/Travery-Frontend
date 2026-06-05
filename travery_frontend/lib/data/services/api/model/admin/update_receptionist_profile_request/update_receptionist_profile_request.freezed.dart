// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_receptionist_profile_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateReceptionistProfileRequest {

 String? get fullName; String? get phoneNumber;/// One of: MORNING, EVENING, NIGHT
 String? get shiftType; String? get hotelId;
/// Create a copy of UpdateReceptionistProfileRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateReceptionistProfileRequestCopyWith<UpdateReceptionistProfileRequest> get copyWith => _$UpdateReceptionistProfileRequestCopyWithImpl<UpdateReceptionistProfileRequest>(this as UpdateReceptionistProfileRequest, _$identity);

  /// Serializes this UpdateReceptionistProfileRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateReceptionistProfileRequest&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.shiftType, shiftType) || other.shiftType == shiftType)&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,phoneNumber,shiftType,hotelId);

@override
String toString() {
  return 'UpdateReceptionistProfileRequest(fullName: $fullName, phoneNumber: $phoneNumber, shiftType: $shiftType, hotelId: $hotelId)';
}


}

/// @nodoc
abstract mixin class $UpdateReceptionistProfileRequestCopyWith<$Res>  {
  factory $UpdateReceptionistProfileRequestCopyWith(UpdateReceptionistProfileRequest value, $Res Function(UpdateReceptionistProfileRequest) _then) = _$UpdateReceptionistProfileRequestCopyWithImpl;
@useResult
$Res call({
 String? fullName, String? phoneNumber, String? shiftType, String? hotelId
});




}
/// @nodoc
class _$UpdateReceptionistProfileRequestCopyWithImpl<$Res>
    implements $UpdateReceptionistProfileRequestCopyWith<$Res> {
  _$UpdateReceptionistProfileRequestCopyWithImpl(this._self, this._then);

  final UpdateReceptionistProfileRequest _self;
  final $Res Function(UpdateReceptionistProfileRequest) _then;

/// Create a copy of UpdateReceptionistProfileRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = freezed,Object? phoneNumber = freezed,Object? shiftType = freezed,Object? hotelId = freezed,}) {
  return _then(_self.copyWith(
fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,shiftType: freezed == shiftType ? _self.shiftType : shiftType // ignore: cast_nullable_to_non_nullable
as String?,hotelId: freezed == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateReceptionistProfileRequest].
extension UpdateReceptionistProfileRequestPatterns on UpdateReceptionistProfileRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateReceptionistProfileRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateReceptionistProfileRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateReceptionistProfileRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateReceptionistProfileRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateReceptionistProfileRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateReceptionistProfileRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? fullName,  String? phoneNumber,  String? shiftType,  String? hotelId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateReceptionistProfileRequest() when $default != null:
return $default(_that.fullName,_that.phoneNumber,_that.shiftType,_that.hotelId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? fullName,  String? phoneNumber,  String? shiftType,  String? hotelId)  $default,) {final _that = this;
switch (_that) {
case _UpdateReceptionistProfileRequest():
return $default(_that.fullName,_that.phoneNumber,_that.shiftType,_that.hotelId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? fullName,  String? phoneNumber,  String? shiftType,  String? hotelId)?  $default,) {final _that = this;
switch (_that) {
case _UpdateReceptionistProfileRequest() when $default != null:
return $default(_that.fullName,_that.phoneNumber,_that.shiftType,_that.hotelId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateReceptionistProfileRequest implements UpdateReceptionistProfileRequest {
  const _UpdateReceptionistProfileRequest({this.fullName, this.phoneNumber, this.shiftType, this.hotelId});
  factory _UpdateReceptionistProfileRequest.fromJson(Map<String, dynamic> json) => _$UpdateReceptionistProfileRequestFromJson(json);

@override final  String? fullName;
@override final  String? phoneNumber;
/// One of: MORNING, EVENING, NIGHT
@override final  String? shiftType;
@override final  String? hotelId;

/// Create a copy of UpdateReceptionistProfileRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateReceptionistProfileRequestCopyWith<_UpdateReceptionistProfileRequest> get copyWith => __$UpdateReceptionistProfileRequestCopyWithImpl<_UpdateReceptionistProfileRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateReceptionistProfileRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateReceptionistProfileRequest&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.shiftType, shiftType) || other.shiftType == shiftType)&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,phoneNumber,shiftType,hotelId);

@override
String toString() {
  return 'UpdateReceptionistProfileRequest(fullName: $fullName, phoneNumber: $phoneNumber, shiftType: $shiftType, hotelId: $hotelId)';
}


}

/// @nodoc
abstract mixin class _$UpdateReceptionistProfileRequestCopyWith<$Res> implements $UpdateReceptionistProfileRequestCopyWith<$Res> {
  factory _$UpdateReceptionistProfileRequestCopyWith(_UpdateReceptionistProfileRequest value, $Res Function(_UpdateReceptionistProfileRequest) _then) = __$UpdateReceptionistProfileRequestCopyWithImpl;
@override @useResult
$Res call({
 String? fullName, String? phoneNumber, String? shiftType, String? hotelId
});




}
/// @nodoc
class __$UpdateReceptionistProfileRequestCopyWithImpl<$Res>
    implements _$UpdateReceptionistProfileRequestCopyWith<$Res> {
  __$UpdateReceptionistProfileRequestCopyWithImpl(this._self, this._then);

  final _UpdateReceptionistProfileRequest _self;
  final $Res Function(_UpdateReceptionistProfileRequest) _then;

/// Create a copy of UpdateReceptionistProfileRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = freezed,Object? phoneNumber = freezed,Object? shiftType = freezed,Object? hotelId = freezed,}) {
  return _then(_UpdateReceptionistProfileRequest(
fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,shiftType: freezed == shiftType ? _self.shiftType : shiftType // ignore: cast_nullable_to_non_nullable
as String?,hotelId: freezed == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
