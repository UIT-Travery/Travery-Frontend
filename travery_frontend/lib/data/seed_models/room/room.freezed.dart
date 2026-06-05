// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Room {

 String? get id;@JsonKey(name: 'room_type_id') String get roomTypeId;@JsonKey(name: 'room_number') String get roomNumber; int get floor; RoomStatus get status;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of Room
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoomCopyWith<Room> get copyWith => _$RoomCopyWithImpl<Room>(this as Room, _$identity);

  /// Serializes this Room to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Room&&(identical(other.id, id) || other.id == id)&&(identical(other.roomTypeId, roomTypeId) || other.roomTypeId == roomTypeId)&&(identical(other.roomNumber, roomNumber) || other.roomNumber == roomNumber)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,roomTypeId,roomNumber,floor,status,createdAt,updatedAt);

@override
String toString() {
  return 'Room(id: $id, roomTypeId: $roomTypeId, roomNumber: $roomNumber, floor: $floor, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $RoomCopyWith<$Res>  {
  factory $RoomCopyWith(Room value, $Res Function(Room) _then) = _$RoomCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'room_type_id') String roomTypeId,@JsonKey(name: 'room_number') String roomNumber, int floor, RoomStatus status,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$RoomCopyWithImpl<$Res>
    implements $RoomCopyWith<$Res> {
  _$RoomCopyWithImpl(this._self, this._then);

  final Room _self;
  final $Res Function(Room) _then;

/// Create a copy of Room
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? roomTypeId = null,Object? roomNumber = null,Object? floor = null,Object? status = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,roomTypeId: null == roomTypeId ? _self.roomTypeId : roomTypeId // ignore: cast_nullable_to_non_nullable
as String,roomNumber: null == roomNumber ? _self.roomNumber : roomNumber // ignore: cast_nullable_to_non_nullable
as String,floor: null == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RoomStatus,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Room].
extension RoomPatterns on Room {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Room value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Room() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Room value)  $default,){
final _that = this;
switch (_that) {
case _Room():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Room value)?  $default,){
final _that = this;
switch (_that) {
case _Room() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'room_type_id')  String roomTypeId, @JsonKey(name: 'room_number')  String roomNumber,  int floor,  RoomStatus status, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Room() when $default != null:
return $default(_that.id,_that.roomTypeId,_that.roomNumber,_that.floor,_that.status,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'room_type_id')  String roomTypeId, @JsonKey(name: 'room_number')  String roomNumber,  int floor,  RoomStatus status, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Room():
return $default(_that.id,_that.roomTypeId,_that.roomNumber,_that.floor,_that.status,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'room_type_id')  String roomTypeId, @JsonKey(name: 'room_number')  String roomNumber,  int floor,  RoomStatus status, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Room() when $default != null:
return $default(_that.id,_that.roomTypeId,_that.roomNumber,_that.floor,_that.status,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Room implements Room {
  const _Room({this.id, @JsonKey(name: 'room_type_id') required this.roomTypeId, @JsonKey(name: 'room_number') required this.roomNumber, required this.floor, required this.status, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'room_type_id') final  String roomTypeId;
@override@JsonKey(name: 'room_number') final  String roomNumber;
@override final  int floor;
@override final  RoomStatus status;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of Room
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoomCopyWith<_Room> get copyWith => __$RoomCopyWithImpl<_Room>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoomToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Room&&(identical(other.id, id) || other.id == id)&&(identical(other.roomTypeId, roomTypeId) || other.roomTypeId == roomTypeId)&&(identical(other.roomNumber, roomNumber) || other.roomNumber == roomNumber)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,roomTypeId,roomNumber,floor,status,createdAt,updatedAt);

@override
String toString() {
  return 'Room(id: $id, roomTypeId: $roomTypeId, roomNumber: $roomNumber, floor: $floor, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$RoomCopyWith<$Res> implements $RoomCopyWith<$Res> {
  factory _$RoomCopyWith(_Room value, $Res Function(_Room) _then) = __$RoomCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'room_type_id') String roomTypeId,@JsonKey(name: 'room_number') String roomNumber, int floor, RoomStatus status,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$RoomCopyWithImpl<$Res>
    implements _$RoomCopyWith<$Res> {
  __$RoomCopyWithImpl(this._self, this._then);

  final _Room _self;
  final $Res Function(_Room) _then;

/// Create a copy of Room
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? roomTypeId = null,Object? roomNumber = null,Object? floor = null,Object? status = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Room(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,roomTypeId: null == roomTypeId ? _self.roomTypeId : roomTypeId // ignore: cast_nullable_to_non_nullable
as String,roomNumber: null == roomNumber ? _self.roomNumber : roomNumber // ignore: cast_nullable_to_non_nullable
as String,floor: null == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RoomStatus,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
