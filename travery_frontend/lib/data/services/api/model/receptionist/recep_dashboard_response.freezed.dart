// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recep_dashboard_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecepDashboardResponse {

 int get availableRooms; int get occupiedRooms; int get cleaningRooms; int get maintenanceRooms; int get todayCheckInCount; int get todayCheckOutCount; List<CheckInQueueItemResponse> get checkInQueue; List<CheckInQueueItemResponse> get checkOutQueue;
/// Create a copy of RecepDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecepDashboardResponseCopyWith<RecepDashboardResponse> get copyWith => _$RecepDashboardResponseCopyWithImpl<RecepDashboardResponse>(this as RecepDashboardResponse, _$identity);

  /// Serializes this RecepDashboardResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecepDashboardResponse&&(identical(other.availableRooms, availableRooms) || other.availableRooms == availableRooms)&&(identical(other.occupiedRooms, occupiedRooms) || other.occupiedRooms == occupiedRooms)&&(identical(other.cleaningRooms, cleaningRooms) || other.cleaningRooms == cleaningRooms)&&(identical(other.maintenanceRooms, maintenanceRooms) || other.maintenanceRooms == maintenanceRooms)&&(identical(other.todayCheckInCount, todayCheckInCount) || other.todayCheckInCount == todayCheckInCount)&&(identical(other.todayCheckOutCount, todayCheckOutCount) || other.todayCheckOutCount == todayCheckOutCount)&&const DeepCollectionEquality().equals(other.checkInQueue, checkInQueue)&&const DeepCollectionEquality().equals(other.checkOutQueue, checkOutQueue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,availableRooms,occupiedRooms,cleaningRooms,maintenanceRooms,todayCheckInCount,todayCheckOutCount,const DeepCollectionEquality().hash(checkInQueue),const DeepCollectionEquality().hash(checkOutQueue));

@override
String toString() {
  return 'RecepDashboardResponse(availableRooms: $availableRooms, occupiedRooms: $occupiedRooms, cleaningRooms: $cleaningRooms, maintenanceRooms: $maintenanceRooms, todayCheckInCount: $todayCheckInCount, todayCheckOutCount: $todayCheckOutCount, checkInQueue: $checkInQueue, checkOutQueue: $checkOutQueue)';
}


}

/// @nodoc
abstract mixin class $RecepDashboardResponseCopyWith<$Res>  {
  factory $RecepDashboardResponseCopyWith(RecepDashboardResponse value, $Res Function(RecepDashboardResponse) _then) = _$RecepDashboardResponseCopyWithImpl;
@useResult
$Res call({
 int availableRooms, int occupiedRooms, int cleaningRooms, int maintenanceRooms, int todayCheckInCount, int todayCheckOutCount, List<CheckInQueueItemResponse> checkInQueue, List<CheckInQueueItemResponse> checkOutQueue
});




}
/// @nodoc
class _$RecepDashboardResponseCopyWithImpl<$Res>
    implements $RecepDashboardResponseCopyWith<$Res> {
  _$RecepDashboardResponseCopyWithImpl(this._self, this._then);

  final RecepDashboardResponse _self;
  final $Res Function(RecepDashboardResponse) _then;

/// Create a copy of RecepDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? availableRooms = null,Object? occupiedRooms = null,Object? cleaningRooms = null,Object? maintenanceRooms = null,Object? todayCheckInCount = null,Object? todayCheckOutCount = null,Object? checkInQueue = null,Object? checkOutQueue = null,}) {
  return _then(_self.copyWith(
availableRooms: null == availableRooms ? _self.availableRooms : availableRooms // ignore: cast_nullable_to_non_nullable
as int,occupiedRooms: null == occupiedRooms ? _self.occupiedRooms : occupiedRooms // ignore: cast_nullable_to_non_nullable
as int,cleaningRooms: null == cleaningRooms ? _self.cleaningRooms : cleaningRooms // ignore: cast_nullable_to_non_nullable
as int,maintenanceRooms: null == maintenanceRooms ? _self.maintenanceRooms : maintenanceRooms // ignore: cast_nullable_to_non_nullable
as int,todayCheckInCount: null == todayCheckInCount ? _self.todayCheckInCount : todayCheckInCount // ignore: cast_nullable_to_non_nullable
as int,todayCheckOutCount: null == todayCheckOutCount ? _self.todayCheckOutCount : todayCheckOutCount // ignore: cast_nullable_to_non_nullable
as int,checkInQueue: null == checkInQueue ? _self.checkInQueue : checkInQueue // ignore: cast_nullable_to_non_nullable
as List<CheckInQueueItemResponse>,checkOutQueue: null == checkOutQueue ? _self.checkOutQueue : checkOutQueue // ignore: cast_nullable_to_non_nullable
as List<CheckInQueueItemResponse>,
  ));
}

}


/// Adds pattern-matching-related methods to [RecepDashboardResponse].
extension RecepDashboardResponsePatterns on RecepDashboardResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecepDashboardResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecepDashboardResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecepDashboardResponse value)  $default,){
final _that = this;
switch (_that) {
case _RecepDashboardResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecepDashboardResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RecepDashboardResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int availableRooms,  int occupiedRooms,  int cleaningRooms,  int maintenanceRooms,  int todayCheckInCount,  int todayCheckOutCount,  List<CheckInQueueItemResponse> checkInQueue,  List<CheckInQueueItemResponse> checkOutQueue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecepDashboardResponse() when $default != null:
return $default(_that.availableRooms,_that.occupiedRooms,_that.cleaningRooms,_that.maintenanceRooms,_that.todayCheckInCount,_that.todayCheckOutCount,_that.checkInQueue,_that.checkOutQueue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int availableRooms,  int occupiedRooms,  int cleaningRooms,  int maintenanceRooms,  int todayCheckInCount,  int todayCheckOutCount,  List<CheckInQueueItemResponse> checkInQueue,  List<CheckInQueueItemResponse> checkOutQueue)  $default,) {final _that = this;
switch (_that) {
case _RecepDashboardResponse():
return $default(_that.availableRooms,_that.occupiedRooms,_that.cleaningRooms,_that.maintenanceRooms,_that.todayCheckInCount,_that.todayCheckOutCount,_that.checkInQueue,_that.checkOutQueue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int availableRooms,  int occupiedRooms,  int cleaningRooms,  int maintenanceRooms,  int todayCheckInCount,  int todayCheckOutCount,  List<CheckInQueueItemResponse> checkInQueue,  List<CheckInQueueItemResponse> checkOutQueue)?  $default,) {final _that = this;
switch (_that) {
case _RecepDashboardResponse() when $default != null:
return $default(_that.availableRooms,_that.occupiedRooms,_that.cleaningRooms,_that.maintenanceRooms,_that.todayCheckInCount,_that.todayCheckOutCount,_that.checkInQueue,_that.checkOutQueue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecepDashboardResponse implements RecepDashboardResponse {
   _RecepDashboardResponse({this.availableRooms = 0, this.occupiedRooms = 0, this.cleaningRooms = 0, this.maintenanceRooms = 0, this.todayCheckInCount = 0, this.todayCheckOutCount = 0, final  List<CheckInQueueItemResponse> checkInQueue = const [], final  List<CheckInQueueItemResponse> checkOutQueue = const []}): _checkInQueue = checkInQueue,_checkOutQueue = checkOutQueue;
  factory _RecepDashboardResponse.fromJson(Map<String, dynamic> json) => _$RecepDashboardResponseFromJson(json);

@override@JsonKey() final  int availableRooms;
@override@JsonKey() final  int occupiedRooms;
@override@JsonKey() final  int cleaningRooms;
@override@JsonKey() final  int maintenanceRooms;
@override@JsonKey() final  int todayCheckInCount;
@override@JsonKey() final  int todayCheckOutCount;
 final  List<CheckInQueueItemResponse> _checkInQueue;
@override@JsonKey() List<CheckInQueueItemResponse> get checkInQueue {
  if (_checkInQueue is EqualUnmodifiableListView) return _checkInQueue;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_checkInQueue);
}

 final  List<CheckInQueueItemResponse> _checkOutQueue;
@override@JsonKey() List<CheckInQueueItemResponse> get checkOutQueue {
  if (_checkOutQueue is EqualUnmodifiableListView) return _checkOutQueue;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_checkOutQueue);
}


/// Create a copy of RecepDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecepDashboardResponseCopyWith<_RecepDashboardResponse> get copyWith => __$RecepDashboardResponseCopyWithImpl<_RecepDashboardResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecepDashboardResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecepDashboardResponse&&(identical(other.availableRooms, availableRooms) || other.availableRooms == availableRooms)&&(identical(other.occupiedRooms, occupiedRooms) || other.occupiedRooms == occupiedRooms)&&(identical(other.cleaningRooms, cleaningRooms) || other.cleaningRooms == cleaningRooms)&&(identical(other.maintenanceRooms, maintenanceRooms) || other.maintenanceRooms == maintenanceRooms)&&(identical(other.todayCheckInCount, todayCheckInCount) || other.todayCheckInCount == todayCheckInCount)&&(identical(other.todayCheckOutCount, todayCheckOutCount) || other.todayCheckOutCount == todayCheckOutCount)&&const DeepCollectionEquality().equals(other._checkInQueue, _checkInQueue)&&const DeepCollectionEquality().equals(other._checkOutQueue, _checkOutQueue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,availableRooms,occupiedRooms,cleaningRooms,maintenanceRooms,todayCheckInCount,todayCheckOutCount,const DeepCollectionEquality().hash(_checkInQueue),const DeepCollectionEquality().hash(_checkOutQueue));

@override
String toString() {
  return 'RecepDashboardResponse(availableRooms: $availableRooms, occupiedRooms: $occupiedRooms, cleaningRooms: $cleaningRooms, maintenanceRooms: $maintenanceRooms, todayCheckInCount: $todayCheckInCount, todayCheckOutCount: $todayCheckOutCount, checkInQueue: $checkInQueue, checkOutQueue: $checkOutQueue)';
}


}

/// @nodoc
abstract mixin class _$RecepDashboardResponseCopyWith<$Res> implements $RecepDashboardResponseCopyWith<$Res> {
  factory _$RecepDashboardResponseCopyWith(_RecepDashboardResponse value, $Res Function(_RecepDashboardResponse) _then) = __$RecepDashboardResponseCopyWithImpl;
@override @useResult
$Res call({
 int availableRooms, int occupiedRooms, int cleaningRooms, int maintenanceRooms, int todayCheckInCount, int todayCheckOutCount, List<CheckInQueueItemResponse> checkInQueue, List<CheckInQueueItemResponse> checkOutQueue
});




}
/// @nodoc
class __$RecepDashboardResponseCopyWithImpl<$Res>
    implements _$RecepDashboardResponseCopyWith<$Res> {
  __$RecepDashboardResponseCopyWithImpl(this._self, this._then);

  final _RecepDashboardResponse _self;
  final $Res Function(_RecepDashboardResponse) _then;

/// Create a copy of RecepDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? availableRooms = null,Object? occupiedRooms = null,Object? cleaningRooms = null,Object? maintenanceRooms = null,Object? todayCheckInCount = null,Object? todayCheckOutCount = null,Object? checkInQueue = null,Object? checkOutQueue = null,}) {
  return _then(_RecepDashboardResponse(
availableRooms: null == availableRooms ? _self.availableRooms : availableRooms // ignore: cast_nullable_to_non_nullable
as int,occupiedRooms: null == occupiedRooms ? _self.occupiedRooms : occupiedRooms // ignore: cast_nullable_to_non_nullable
as int,cleaningRooms: null == cleaningRooms ? _self.cleaningRooms : cleaningRooms // ignore: cast_nullable_to_non_nullable
as int,maintenanceRooms: null == maintenanceRooms ? _self.maintenanceRooms : maintenanceRooms // ignore: cast_nullable_to_non_nullable
as int,todayCheckInCount: null == todayCheckInCount ? _self.todayCheckInCount : todayCheckInCount // ignore: cast_nullable_to_non_nullable
as int,todayCheckOutCount: null == todayCheckOutCount ? _self.todayCheckOutCount : todayCheckOutCount // ignore: cast_nullable_to_non_nullable
as int,checkInQueue: null == checkInQueue ? _self._checkInQueue : checkInQueue // ignore: cast_nullable_to_non_nullable
as List<CheckInQueueItemResponse>,checkOutQueue: null == checkOutQueue ? _self._checkOutQueue : checkOutQueue // ignore: cast_nullable_to_non_nullable
as List<CheckInQueueItemResponse>,
  ));
}


}

// dart format on
