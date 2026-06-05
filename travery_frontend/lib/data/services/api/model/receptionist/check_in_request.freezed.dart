// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_in_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckInRequest {

 List<String> get roomIds;
/// Create a copy of CheckInRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckInRequestCopyWith<CheckInRequest> get copyWith => _$CheckInRequestCopyWithImpl<CheckInRequest>(this as CheckInRequest, _$identity);

  /// Serializes this CheckInRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckInRequest&&const DeepCollectionEquality().equals(other.roomIds, roomIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(roomIds));

@override
String toString() {
  return 'CheckInRequest(roomIds: $roomIds)';
}


}

/// @nodoc
abstract mixin class $CheckInRequestCopyWith<$Res>  {
  factory $CheckInRequestCopyWith(CheckInRequest value, $Res Function(CheckInRequest) _then) = _$CheckInRequestCopyWithImpl;
@useResult
$Res call({
 List<String> roomIds
});




}
/// @nodoc
class _$CheckInRequestCopyWithImpl<$Res>
    implements $CheckInRequestCopyWith<$Res> {
  _$CheckInRequestCopyWithImpl(this._self, this._then);

  final CheckInRequest _self;
  final $Res Function(CheckInRequest) _then;

/// Create a copy of CheckInRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? roomIds = null,}) {
  return _then(_self.copyWith(
roomIds: null == roomIds ? _self.roomIds : roomIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckInRequest].
extension CheckInRequestPatterns on CheckInRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckInRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckInRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckInRequest value)  $default,){
final _that = this;
switch (_that) {
case _CheckInRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckInRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CheckInRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> roomIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckInRequest() when $default != null:
return $default(_that.roomIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> roomIds)  $default,) {final _that = this;
switch (_that) {
case _CheckInRequest():
return $default(_that.roomIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> roomIds)?  $default,) {final _that = this;
switch (_that) {
case _CheckInRequest() when $default != null:
return $default(_that.roomIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckInRequest implements CheckInRequest {
  const _CheckInRequest({required final  List<String> roomIds}): _roomIds = roomIds;
  factory _CheckInRequest.fromJson(Map<String, dynamic> json) => _$CheckInRequestFromJson(json);

 final  List<String> _roomIds;
@override List<String> get roomIds {
  if (_roomIds is EqualUnmodifiableListView) return _roomIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roomIds);
}


/// Create a copy of CheckInRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckInRequestCopyWith<_CheckInRequest> get copyWith => __$CheckInRequestCopyWithImpl<_CheckInRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckInRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckInRequest&&const DeepCollectionEquality().equals(other._roomIds, _roomIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_roomIds));

@override
String toString() {
  return 'CheckInRequest(roomIds: $roomIds)';
}


}

/// @nodoc
abstract mixin class _$CheckInRequestCopyWith<$Res> implements $CheckInRequestCopyWith<$Res> {
  factory _$CheckInRequestCopyWith(_CheckInRequest value, $Res Function(_CheckInRequest) _then) = __$CheckInRequestCopyWithImpl;
@override @useResult
$Res call({
 List<String> roomIds
});




}
/// @nodoc
class __$CheckInRequestCopyWithImpl<$Res>
    implements _$CheckInRequestCopyWith<$Res> {
  __$CheckInRequestCopyWithImpl(this._self, this._then);

  final _CheckInRequest _self;
  final $Res Function(_CheckInRequest) _then;

/// Create a copy of CheckInRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? roomIds = null,}) {
  return _then(_CheckInRequest(
roomIds: null == roomIds ? _self._roomIds : roomIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
