// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recep_room_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecepRoomResponse {

 String get id; String get roomNumber; String get roomTypeName; String get status; int? get floor;
/// Create a copy of RecepRoomResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecepRoomResponseCopyWith<RecepRoomResponse> get copyWith => _$RecepRoomResponseCopyWithImpl<RecepRoomResponse>(this as RecepRoomResponse, _$identity);

  /// Serializes this RecepRoomResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecepRoomResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.roomNumber, roomNumber) || other.roomNumber == roomNumber)&&(identical(other.roomTypeName, roomTypeName) || other.roomTypeName == roomTypeName)&&(identical(other.status, status) || other.status == status)&&(identical(other.floor, floor) || other.floor == floor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,roomNumber,roomTypeName,status,floor);

@override
String toString() {
  return 'RecepRoomResponse(id: $id, roomNumber: $roomNumber, roomTypeName: $roomTypeName, status: $status, floor: $floor)';
}


}

/// @nodoc
abstract mixin class $RecepRoomResponseCopyWith<$Res>  {
  factory $RecepRoomResponseCopyWith(RecepRoomResponse value, $Res Function(RecepRoomResponse) _then) = _$RecepRoomResponseCopyWithImpl;
@useResult
$Res call({
 String id, String roomNumber, String roomTypeName, String status, int? floor
});




}
/// @nodoc
class _$RecepRoomResponseCopyWithImpl<$Res>
    implements $RecepRoomResponseCopyWith<$Res> {
  _$RecepRoomResponseCopyWithImpl(this._self, this._then);

  final RecepRoomResponse _self;
  final $Res Function(RecepRoomResponse) _then;

/// Create a copy of RecepRoomResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? roomNumber = null,Object? roomTypeName = null,Object? status = null,Object? floor = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,roomNumber: null == roomNumber ? _self.roomNumber : roomNumber // ignore: cast_nullable_to_non_nullable
as String,roomTypeName: null == roomTypeName ? _self.roomTypeName : roomTypeName // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [RecepRoomResponse].
extension RecepRoomResponsePatterns on RecepRoomResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecepRoomResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecepRoomResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecepRoomResponse value)  $default,){
final _that = this;
switch (_that) {
case _RecepRoomResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecepRoomResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RecepRoomResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String roomNumber,  String roomTypeName,  String status,  int? floor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecepRoomResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String roomNumber,  String roomTypeName,  String status,  int? floor)  $default,) {final _that = this;
switch (_that) {
case _RecepRoomResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String roomNumber,  String roomTypeName,  String status,  int? floor)?  $default,) {final _that = this;
switch (_that) {
case _RecepRoomResponse() when $default != null:
return $default(_that.id,_that.roomNumber,_that.roomTypeName,_that.status,_that.floor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecepRoomResponse implements RecepRoomResponse {
   _RecepRoomResponse({required this.id, required this.roomNumber, required this.roomTypeName, required this.status, this.floor});
  factory _RecepRoomResponse.fromJson(Map<String, dynamic> json) => _$RecepRoomResponseFromJson(json);

@override final  String id;
@override final  String roomNumber;
@override final  String roomTypeName;
@override final  String status;
@override final  int? floor;

/// Create a copy of RecepRoomResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecepRoomResponseCopyWith<_RecepRoomResponse> get copyWith => __$RecepRoomResponseCopyWithImpl<_RecepRoomResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecepRoomResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecepRoomResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.roomNumber, roomNumber) || other.roomNumber == roomNumber)&&(identical(other.roomTypeName, roomTypeName) || other.roomTypeName == roomTypeName)&&(identical(other.status, status) || other.status == status)&&(identical(other.floor, floor) || other.floor == floor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,roomNumber,roomTypeName,status,floor);

@override
String toString() {
  return 'RecepRoomResponse(id: $id, roomNumber: $roomNumber, roomTypeName: $roomTypeName, status: $status, floor: $floor)';
}


}

/// @nodoc
abstract mixin class _$RecepRoomResponseCopyWith<$Res> implements $RecepRoomResponseCopyWith<$Res> {
  factory _$RecepRoomResponseCopyWith(_RecepRoomResponse value, $Res Function(_RecepRoomResponse) _then) = __$RecepRoomResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, String roomNumber, String roomTypeName, String status, int? floor
});




}
/// @nodoc
class __$RecepRoomResponseCopyWithImpl<$Res>
    implements _$RecepRoomResponseCopyWith<$Res> {
  __$RecepRoomResponseCopyWithImpl(this._self, this._then);

  final _RecepRoomResponse _self;
  final $Res Function(_RecepRoomResponse) _then;

/// Create a copy of RecepRoomResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? roomNumber = null,Object? roomTypeName = null,Object? status = null,Object? floor = freezed,}) {
  return _then(_RecepRoomResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,roomNumber: null == roomNumber ? _self.roomNumber : roomNumber // ignore: cast_nullable_to_non_nullable
as String,roomTypeName: null == roomTypeName ? _self.roomTypeName : roomTypeName // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
