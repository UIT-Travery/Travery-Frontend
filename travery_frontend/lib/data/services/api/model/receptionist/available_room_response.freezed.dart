// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'available_room_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AvailableRoomResponse {

 String? get id; String? get roomNumber; String? get roomTypeName; String? get status; int? get floor;
/// Create a copy of AvailableRoomResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvailableRoomResponseCopyWith<AvailableRoomResponse> get copyWith => _$AvailableRoomResponseCopyWithImpl<AvailableRoomResponse>(this as AvailableRoomResponse, _$identity);

  /// Serializes this AvailableRoomResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvailableRoomResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.roomNumber, roomNumber) || other.roomNumber == roomNumber)&&(identical(other.roomTypeName, roomTypeName) || other.roomTypeName == roomTypeName)&&(identical(other.status, status) || other.status == status)&&(identical(other.floor, floor) || other.floor == floor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,roomNumber,roomTypeName,status,floor);

@override
String toString() {
  return 'AvailableRoomResponse(id: $id, roomNumber: $roomNumber, roomTypeName: $roomTypeName, status: $status, floor: $floor)';
}


}

/// @nodoc
abstract mixin class $AvailableRoomResponseCopyWith<$Res>  {
  factory $AvailableRoomResponseCopyWith(AvailableRoomResponse value, $Res Function(AvailableRoomResponse) _then) = _$AvailableRoomResponseCopyWithImpl;
@useResult
$Res call({
 String? id, String? roomNumber, String? roomTypeName, String? status, int? floor
});




}
/// @nodoc
class _$AvailableRoomResponseCopyWithImpl<$Res>
    implements $AvailableRoomResponseCopyWith<$Res> {
  _$AvailableRoomResponseCopyWithImpl(this._self, this._then);

  final AvailableRoomResponse _self;
  final $Res Function(AvailableRoomResponse) _then;

/// Create a copy of AvailableRoomResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? roomNumber = freezed,Object? roomTypeName = freezed,Object? status = freezed,Object? floor = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,roomNumber: freezed == roomNumber ? _self.roomNumber : roomNumber // ignore: cast_nullable_to_non_nullable
as String?,roomTypeName: freezed == roomTypeName ? _self.roomTypeName : roomTypeName // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [AvailableRoomResponse].
extension AvailableRoomResponsePatterns on AvailableRoomResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AvailableRoomResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AvailableRoomResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AvailableRoomResponse value)  $default,){
final _that = this;
switch (_that) {
case _AvailableRoomResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AvailableRoomResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AvailableRoomResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? roomNumber,  String? roomTypeName,  String? status,  int? floor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AvailableRoomResponse() when $default != null:
return $default(_that.id,_that.roomNumber,_that.roomTypeName,_that.status,_that.floor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? roomNumber,  String? roomTypeName,  String? status,  int? floor)  $default,) {final _that = this;
switch (_that) {
case _AvailableRoomResponse():
return $default(_that.id,_that.roomNumber,_that.roomTypeName,_that.status,_that.floor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? roomNumber,  String? roomTypeName,  String? status,  int? floor)?  $default,) {final _that = this;
switch (_that) {
case _AvailableRoomResponse() when $default != null:
return $default(_that.id,_that.roomNumber,_that.roomTypeName,_that.status,_that.floor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AvailableRoomResponse implements AvailableRoomResponse {
   _AvailableRoomResponse({this.id, this.roomNumber, this.roomTypeName, this.status, this.floor});
  factory _AvailableRoomResponse.fromJson(Map<String, dynamic> json) => _$AvailableRoomResponseFromJson(json);

@override final  String? id;
@override final  String? roomNumber;
@override final  String? roomTypeName;
@override final  String? status;
@override final  int? floor;

/// Create a copy of AvailableRoomResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AvailableRoomResponseCopyWith<_AvailableRoomResponse> get copyWith => __$AvailableRoomResponseCopyWithImpl<_AvailableRoomResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AvailableRoomResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AvailableRoomResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.roomNumber, roomNumber) || other.roomNumber == roomNumber)&&(identical(other.roomTypeName, roomTypeName) || other.roomTypeName == roomTypeName)&&(identical(other.status, status) || other.status == status)&&(identical(other.floor, floor) || other.floor == floor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,roomNumber,roomTypeName,status,floor);

@override
String toString() {
  return 'AvailableRoomResponse(id: $id, roomNumber: $roomNumber, roomTypeName: $roomTypeName, status: $status, floor: $floor)';
}


}

/// @nodoc
abstract mixin class _$AvailableRoomResponseCopyWith<$Res> implements $AvailableRoomResponseCopyWith<$Res> {
  factory _$AvailableRoomResponseCopyWith(_AvailableRoomResponse value, $Res Function(_AvailableRoomResponse) _then) = __$AvailableRoomResponseCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? roomNumber, String? roomTypeName, String? status, int? floor
});




}
/// @nodoc
class __$AvailableRoomResponseCopyWithImpl<$Res>
    implements _$AvailableRoomResponseCopyWith<$Res> {
  __$AvailableRoomResponseCopyWithImpl(this._self, this._then);

  final _AvailableRoomResponse _self;
  final $Res Function(_AvailableRoomResponse) _then;

/// Create a copy of AvailableRoomResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? roomNumber = freezed,Object? roomTypeName = freezed,Object? status = freezed,Object? floor = freezed,}) {
  return _then(_AvailableRoomResponse(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,roomNumber: freezed == roomNumber ? _self.roomNumber : roomNumber // ignore: cast_nullable_to_non_nullable
as String?,roomTypeName: freezed == roomTypeName ? _self.roomTypeName : roomTypeName // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
