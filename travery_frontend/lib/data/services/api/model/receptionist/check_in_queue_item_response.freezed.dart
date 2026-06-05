// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_in_queue_item_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckInQueueItemResponse {

 String get bookingId; String get touristName; String get phoneNumber; int get memberCount; int get totalRooms; Map<String, int> get roomTypeBreakdown;
/// Create a copy of CheckInQueueItemResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckInQueueItemResponseCopyWith<CheckInQueueItemResponse> get copyWith => _$CheckInQueueItemResponseCopyWithImpl<CheckInQueueItemResponse>(this as CheckInQueueItemResponse, _$identity);

  /// Serializes this CheckInQueueItemResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckInQueueItemResponse&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId)&&(identical(other.touristName, touristName) || other.touristName == touristName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.memberCount, memberCount) || other.memberCount == memberCount)&&(identical(other.totalRooms, totalRooms) || other.totalRooms == totalRooms)&&const DeepCollectionEquality().equals(other.roomTypeBreakdown, roomTypeBreakdown));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bookingId,touristName,phoneNumber,memberCount,totalRooms,const DeepCollectionEquality().hash(roomTypeBreakdown));

@override
String toString() {
  return 'CheckInQueueItemResponse(bookingId: $bookingId, touristName: $touristName, phoneNumber: $phoneNumber, memberCount: $memberCount, totalRooms: $totalRooms, roomTypeBreakdown: $roomTypeBreakdown)';
}


}

/// @nodoc
abstract mixin class $CheckInQueueItemResponseCopyWith<$Res>  {
  factory $CheckInQueueItemResponseCopyWith(CheckInQueueItemResponse value, $Res Function(CheckInQueueItemResponse) _then) = _$CheckInQueueItemResponseCopyWithImpl;
@useResult
$Res call({
 String bookingId, String touristName, String phoneNumber, int memberCount, int totalRooms, Map<String, int> roomTypeBreakdown
});




}
/// @nodoc
class _$CheckInQueueItemResponseCopyWithImpl<$Res>
    implements $CheckInQueueItemResponseCopyWith<$Res> {
  _$CheckInQueueItemResponseCopyWithImpl(this._self, this._then);

  final CheckInQueueItemResponse _self;
  final $Res Function(CheckInQueueItemResponse) _then;

/// Create a copy of CheckInQueueItemResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bookingId = null,Object? touristName = null,Object? phoneNumber = null,Object? memberCount = null,Object? totalRooms = null,Object? roomTypeBreakdown = null,}) {
  return _then(_self.copyWith(
bookingId: null == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as String,touristName: null == touristName ? _self.touristName : touristName // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,memberCount: null == memberCount ? _self.memberCount : memberCount // ignore: cast_nullable_to_non_nullable
as int,totalRooms: null == totalRooms ? _self.totalRooms : totalRooms // ignore: cast_nullable_to_non_nullable
as int,roomTypeBreakdown: null == roomTypeBreakdown ? _self.roomTypeBreakdown : roomTypeBreakdown // ignore: cast_nullable_to_non_nullable
as Map<String, int>,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckInQueueItemResponse].
extension CheckInQueueItemResponsePatterns on CheckInQueueItemResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckInQueueItemResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckInQueueItemResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckInQueueItemResponse value)  $default,){
final _that = this;
switch (_that) {
case _CheckInQueueItemResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckInQueueItemResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CheckInQueueItemResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String bookingId,  String touristName,  String phoneNumber,  int memberCount,  int totalRooms,  Map<String, int> roomTypeBreakdown)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckInQueueItemResponse() when $default != null:
return $default(_that.bookingId,_that.touristName,_that.phoneNumber,_that.memberCount,_that.totalRooms,_that.roomTypeBreakdown);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String bookingId,  String touristName,  String phoneNumber,  int memberCount,  int totalRooms,  Map<String, int> roomTypeBreakdown)  $default,) {final _that = this;
switch (_that) {
case _CheckInQueueItemResponse():
return $default(_that.bookingId,_that.touristName,_that.phoneNumber,_that.memberCount,_that.totalRooms,_that.roomTypeBreakdown);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String bookingId,  String touristName,  String phoneNumber,  int memberCount,  int totalRooms,  Map<String, int> roomTypeBreakdown)?  $default,) {final _that = this;
switch (_that) {
case _CheckInQueueItemResponse() when $default != null:
return $default(_that.bookingId,_that.touristName,_that.phoneNumber,_that.memberCount,_that.totalRooms,_that.roomTypeBreakdown);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckInQueueItemResponse implements CheckInQueueItemResponse {
   _CheckInQueueItemResponse({this.bookingId = '', this.touristName = '', this.phoneNumber = '', this.memberCount = 0, this.totalRooms = 0, final  Map<String, int> roomTypeBreakdown = const {}}): _roomTypeBreakdown = roomTypeBreakdown;
  factory _CheckInQueueItemResponse.fromJson(Map<String, dynamic> json) => _$CheckInQueueItemResponseFromJson(json);

@override@JsonKey() final  String bookingId;
@override@JsonKey() final  String touristName;
@override@JsonKey() final  String phoneNumber;
@override@JsonKey() final  int memberCount;
@override@JsonKey() final  int totalRooms;
 final  Map<String, int> _roomTypeBreakdown;
@override@JsonKey() Map<String, int> get roomTypeBreakdown {
  if (_roomTypeBreakdown is EqualUnmodifiableMapView) return _roomTypeBreakdown;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_roomTypeBreakdown);
}


/// Create a copy of CheckInQueueItemResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckInQueueItemResponseCopyWith<_CheckInQueueItemResponse> get copyWith => __$CheckInQueueItemResponseCopyWithImpl<_CheckInQueueItemResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckInQueueItemResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckInQueueItemResponse&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId)&&(identical(other.touristName, touristName) || other.touristName == touristName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.memberCount, memberCount) || other.memberCount == memberCount)&&(identical(other.totalRooms, totalRooms) || other.totalRooms == totalRooms)&&const DeepCollectionEquality().equals(other._roomTypeBreakdown, _roomTypeBreakdown));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bookingId,touristName,phoneNumber,memberCount,totalRooms,const DeepCollectionEquality().hash(_roomTypeBreakdown));

@override
String toString() {
  return 'CheckInQueueItemResponse(bookingId: $bookingId, touristName: $touristName, phoneNumber: $phoneNumber, memberCount: $memberCount, totalRooms: $totalRooms, roomTypeBreakdown: $roomTypeBreakdown)';
}


}

/// @nodoc
abstract mixin class _$CheckInQueueItemResponseCopyWith<$Res> implements $CheckInQueueItemResponseCopyWith<$Res> {
  factory _$CheckInQueueItemResponseCopyWith(_CheckInQueueItemResponse value, $Res Function(_CheckInQueueItemResponse) _then) = __$CheckInQueueItemResponseCopyWithImpl;
@override @useResult
$Res call({
 String bookingId, String touristName, String phoneNumber, int memberCount, int totalRooms, Map<String, int> roomTypeBreakdown
});




}
/// @nodoc
class __$CheckInQueueItemResponseCopyWithImpl<$Res>
    implements _$CheckInQueueItemResponseCopyWith<$Res> {
  __$CheckInQueueItemResponseCopyWithImpl(this._self, this._then);

  final _CheckInQueueItemResponse _self;
  final $Res Function(_CheckInQueueItemResponse) _then;

/// Create a copy of CheckInQueueItemResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bookingId = null,Object? touristName = null,Object? phoneNumber = null,Object? memberCount = null,Object? totalRooms = null,Object? roomTypeBreakdown = null,}) {
  return _then(_CheckInQueueItemResponse(
bookingId: null == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as String,touristName: null == touristName ? _self.touristName : touristName // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,memberCount: null == memberCount ? _self.memberCount : memberCount // ignore: cast_nullable_to_non_nullable
as int,totalRooms: null == totalRooms ? _self.totalRooms : totalRooms // ignore: cast_nullable_to_non_nullable
as int,roomTypeBreakdown: null == roomTypeBreakdown ? _self._roomTypeBreakdown : roomTypeBreakdown // ignore: cast_nullable_to_non_nullable
as Map<String, int>,
  ));
}


}

// dart format on
