// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coach_instance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoachInstance {

 String? get id;@JsonKey(name: 'route_id') String get routeId;@JsonKey(name: 'departure_date') DateTime get departureDate;@JsonKey(name: 'vehicle_id') String? get vehicleId;@JsonKey(name: 'driver_id') String? get driverId;@JsonKey(name: 'guide_id') String? get guideId;@JsonKey(name: 'assigned_by') String? get assignedBy; CoachInstanceStatus get status;@JsonKey(name: 'cancelled_at') DateTime? get cancelledAt;@JsonKey(name: 'cancellation_reason') String? get cancellationReason;@JsonKey(name: 'cancelled_by') String? get cancelledBy;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;/// RELATIONS
 List<CoachBooking>? get bookings; List<CoachInstanceSeat>? get seats;
/// Create a copy of CoachInstance
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoachInstanceCopyWith<CoachInstance> get copyWith => _$CoachInstanceCopyWithImpl<CoachInstance>(this as CoachInstance, _$identity);

  /// Serializes this CoachInstance to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoachInstance&&(identical(other.id, id) || other.id == id)&&(identical(other.routeId, routeId) || other.routeId == routeId)&&(identical(other.departureDate, departureDate) || other.departureDate == departureDate)&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.driverId, driverId) || other.driverId == driverId)&&(identical(other.guideId, guideId) || other.guideId == guideId)&&(identical(other.assignedBy, assignedBy) || other.assignedBy == assignedBy)&&(identical(other.status, status) || other.status == status)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&(identical(other.cancellationReason, cancellationReason) || other.cancellationReason == cancellationReason)&&(identical(other.cancelledBy, cancelledBy) || other.cancelledBy == cancelledBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.bookings, bookings)&&const DeepCollectionEquality().equals(other.seats, seats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,routeId,departureDate,vehicleId,driverId,guideId,assignedBy,status,cancelledAt,cancellationReason,cancelledBy,createdAt,updatedAt,const DeepCollectionEquality().hash(bookings),const DeepCollectionEquality().hash(seats));

@override
String toString() {
  return 'CoachInstance(id: $id, routeId: $routeId, departureDate: $departureDate, vehicleId: $vehicleId, driverId: $driverId, guideId: $guideId, assignedBy: $assignedBy, status: $status, cancelledAt: $cancelledAt, cancellationReason: $cancellationReason, cancelledBy: $cancelledBy, createdAt: $createdAt, updatedAt: $updatedAt, bookings: $bookings, seats: $seats)';
}


}

/// @nodoc
abstract mixin class $CoachInstanceCopyWith<$Res>  {
  factory $CoachInstanceCopyWith(CoachInstance value, $Res Function(CoachInstance) _then) = _$CoachInstanceCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'route_id') String routeId,@JsonKey(name: 'departure_date') DateTime departureDate,@JsonKey(name: 'vehicle_id') String? vehicleId,@JsonKey(name: 'driver_id') String? driverId,@JsonKey(name: 'guide_id') String? guideId,@JsonKey(name: 'assigned_by') String? assignedBy, CoachInstanceStatus status,@JsonKey(name: 'cancelled_at') DateTime? cancelledAt,@JsonKey(name: 'cancellation_reason') String? cancellationReason,@JsonKey(name: 'cancelled_by') String? cancelledBy,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt, List<CoachBooking>? bookings, List<CoachInstanceSeat>? seats
});




}
/// @nodoc
class _$CoachInstanceCopyWithImpl<$Res>
    implements $CoachInstanceCopyWith<$Res> {
  _$CoachInstanceCopyWithImpl(this._self, this._then);

  final CoachInstance _self;
  final $Res Function(CoachInstance) _then;

/// Create a copy of CoachInstance
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? routeId = null,Object? departureDate = null,Object? vehicleId = freezed,Object? driverId = freezed,Object? guideId = freezed,Object? assignedBy = freezed,Object? status = null,Object? cancelledAt = freezed,Object? cancellationReason = freezed,Object? cancelledBy = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? bookings = freezed,Object? seats = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,routeId: null == routeId ? _self.routeId : routeId // ignore: cast_nullable_to_non_nullable
as String,departureDate: null == departureDate ? _self.departureDate : departureDate // ignore: cast_nullable_to_non_nullable
as DateTime,vehicleId: freezed == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String?,driverId: freezed == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as String?,guideId: freezed == guideId ? _self.guideId : guideId // ignore: cast_nullable_to_non_nullable
as String?,assignedBy: freezed == assignedBy ? _self.assignedBy : assignedBy // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CoachInstanceStatus,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,cancellationReason: freezed == cancellationReason ? _self.cancellationReason : cancellationReason // ignore: cast_nullable_to_non_nullable
as String?,cancelledBy: freezed == cancelledBy ? _self.cancelledBy : cancelledBy // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,bookings: freezed == bookings ? _self.bookings : bookings // ignore: cast_nullable_to_non_nullable
as List<CoachBooking>?,seats: freezed == seats ? _self.seats : seats // ignore: cast_nullable_to_non_nullable
as List<CoachInstanceSeat>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CoachInstance].
extension CoachInstancePatterns on CoachInstance {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoachInstance value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoachInstance() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoachInstance value)  $default,){
final _that = this;
switch (_that) {
case _CoachInstance():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoachInstance value)?  $default,){
final _that = this;
switch (_that) {
case _CoachInstance() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'route_id')  String routeId, @JsonKey(name: 'departure_date')  DateTime departureDate, @JsonKey(name: 'vehicle_id')  String? vehicleId, @JsonKey(name: 'driver_id')  String? driverId, @JsonKey(name: 'guide_id')  String? guideId, @JsonKey(name: 'assigned_by')  String? assignedBy,  CoachInstanceStatus status, @JsonKey(name: 'cancelled_at')  DateTime? cancelledAt, @JsonKey(name: 'cancellation_reason')  String? cancellationReason, @JsonKey(name: 'cancelled_by')  String? cancelledBy, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  List<CoachBooking>? bookings,  List<CoachInstanceSeat>? seats)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoachInstance() when $default != null:
return $default(_that.id,_that.routeId,_that.departureDate,_that.vehicleId,_that.driverId,_that.guideId,_that.assignedBy,_that.status,_that.cancelledAt,_that.cancellationReason,_that.cancelledBy,_that.createdAt,_that.updatedAt,_that.bookings,_that.seats);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'route_id')  String routeId, @JsonKey(name: 'departure_date')  DateTime departureDate, @JsonKey(name: 'vehicle_id')  String? vehicleId, @JsonKey(name: 'driver_id')  String? driverId, @JsonKey(name: 'guide_id')  String? guideId, @JsonKey(name: 'assigned_by')  String? assignedBy,  CoachInstanceStatus status, @JsonKey(name: 'cancelled_at')  DateTime? cancelledAt, @JsonKey(name: 'cancellation_reason')  String? cancellationReason, @JsonKey(name: 'cancelled_by')  String? cancelledBy, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  List<CoachBooking>? bookings,  List<CoachInstanceSeat>? seats)  $default,) {final _that = this;
switch (_that) {
case _CoachInstance():
return $default(_that.id,_that.routeId,_that.departureDate,_that.vehicleId,_that.driverId,_that.guideId,_that.assignedBy,_that.status,_that.cancelledAt,_that.cancellationReason,_that.cancelledBy,_that.createdAt,_that.updatedAt,_that.bookings,_that.seats);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'route_id')  String routeId, @JsonKey(name: 'departure_date')  DateTime departureDate, @JsonKey(name: 'vehicle_id')  String? vehicleId, @JsonKey(name: 'driver_id')  String? driverId, @JsonKey(name: 'guide_id')  String? guideId, @JsonKey(name: 'assigned_by')  String? assignedBy,  CoachInstanceStatus status, @JsonKey(name: 'cancelled_at')  DateTime? cancelledAt, @JsonKey(name: 'cancellation_reason')  String? cancellationReason, @JsonKey(name: 'cancelled_by')  String? cancelledBy, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  List<CoachBooking>? bookings,  List<CoachInstanceSeat>? seats)?  $default,) {final _that = this;
switch (_that) {
case _CoachInstance() when $default != null:
return $default(_that.id,_that.routeId,_that.departureDate,_that.vehicleId,_that.driverId,_that.guideId,_that.assignedBy,_that.status,_that.cancelledAt,_that.cancellationReason,_that.cancelledBy,_that.createdAt,_that.updatedAt,_that.bookings,_that.seats);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CoachInstance implements CoachInstance {
  const _CoachInstance({this.id, @JsonKey(name: 'route_id') required this.routeId, @JsonKey(name: 'departure_date') required this.departureDate, @JsonKey(name: 'vehicle_id') this.vehicleId, @JsonKey(name: 'driver_id') this.driverId, @JsonKey(name: 'guide_id') this.guideId, @JsonKey(name: 'assigned_by') this.assignedBy, required this.status, @JsonKey(name: 'cancelled_at') this.cancelledAt, @JsonKey(name: 'cancellation_reason') this.cancellationReason, @JsonKey(name: 'cancelled_by') this.cancelledBy, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, final  List<CoachBooking>? bookings, final  List<CoachInstanceSeat>? seats}): _bookings = bookings,_seats = seats;
  factory _CoachInstance.fromJson(Map<String, dynamic> json) => _$CoachInstanceFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'route_id') final  String routeId;
@override@JsonKey(name: 'departure_date') final  DateTime departureDate;
@override@JsonKey(name: 'vehicle_id') final  String? vehicleId;
@override@JsonKey(name: 'driver_id') final  String? driverId;
@override@JsonKey(name: 'guide_id') final  String? guideId;
@override@JsonKey(name: 'assigned_by') final  String? assignedBy;
@override final  CoachInstanceStatus status;
@override@JsonKey(name: 'cancelled_at') final  DateTime? cancelledAt;
@override@JsonKey(name: 'cancellation_reason') final  String? cancellationReason;
@override@JsonKey(name: 'cancelled_by') final  String? cancelledBy;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;
/// RELATIONS
 final  List<CoachBooking>? _bookings;
/// RELATIONS
@override List<CoachBooking>? get bookings {
  final value = _bookings;
  if (value == null) return null;
  if (_bookings is EqualUnmodifiableListView) return _bookings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<CoachInstanceSeat>? _seats;
@override List<CoachInstanceSeat>? get seats {
  final value = _seats;
  if (value == null) return null;
  if (_seats is EqualUnmodifiableListView) return _seats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of CoachInstance
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoachInstanceCopyWith<_CoachInstance> get copyWith => __$CoachInstanceCopyWithImpl<_CoachInstance>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CoachInstanceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoachInstance&&(identical(other.id, id) || other.id == id)&&(identical(other.routeId, routeId) || other.routeId == routeId)&&(identical(other.departureDate, departureDate) || other.departureDate == departureDate)&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.driverId, driverId) || other.driverId == driverId)&&(identical(other.guideId, guideId) || other.guideId == guideId)&&(identical(other.assignedBy, assignedBy) || other.assignedBy == assignedBy)&&(identical(other.status, status) || other.status == status)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&(identical(other.cancellationReason, cancellationReason) || other.cancellationReason == cancellationReason)&&(identical(other.cancelledBy, cancelledBy) || other.cancelledBy == cancelledBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._bookings, _bookings)&&const DeepCollectionEquality().equals(other._seats, _seats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,routeId,departureDate,vehicleId,driverId,guideId,assignedBy,status,cancelledAt,cancellationReason,cancelledBy,createdAt,updatedAt,const DeepCollectionEquality().hash(_bookings),const DeepCollectionEquality().hash(_seats));

@override
String toString() {
  return 'CoachInstance(id: $id, routeId: $routeId, departureDate: $departureDate, vehicleId: $vehicleId, driverId: $driverId, guideId: $guideId, assignedBy: $assignedBy, status: $status, cancelledAt: $cancelledAt, cancellationReason: $cancellationReason, cancelledBy: $cancelledBy, createdAt: $createdAt, updatedAt: $updatedAt, bookings: $bookings, seats: $seats)';
}


}

/// @nodoc
abstract mixin class _$CoachInstanceCopyWith<$Res> implements $CoachInstanceCopyWith<$Res> {
  factory _$CoachInstanceCopyWith(_CoachInstance value, $Res Function(_CoachInstance) _then) = __$CoachInstanceCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'route_id') String routeId,@JsonKey(name: 'departure_date') DateTime departureDate,@JsonKey(name: 'vehicle_id') String? vehicleId,@JsonKey(name: 'driver_id') String? driverId,@JsonKey(name: 'guide_id') String? guideId,@JsonKey(name: 'assigned_by') String? assignedBy, CoachInstanceStatus status,@JsonKey(name: 'cancelled_at') DateTime? cancelledAt,@JsonKey(name: 'cancellation_reason') String? cancellationReason,@JsonKey(name: 'cancelled_by') String? cancelledBy,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt, List<CoachBooking>? bookings, List<CoachInstanceSeat>? seats
});




}
/// @nodoc
class __$CoachInstanceCopyWithImpl<$Res>
    implements _$CoachInstanceCopyWith<$Res> {
  __$CoachInstanceCopyWithImpl(this._self, this._then);

  final _CoachInstance _self;
  final $Res Function(_CoachInstance) _then;

/// Create a copy of CoachInstance
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? routeId = null,Object? departureDate = null,Object? vehicleId = freezed,Object? driverId = freezed,Object? guideId = freezed,Object? assignedBy = freezed,Object? status = null,Object? cancelledAt = freezed,Object? cancellationReason = freezed,Object? cancelledBy = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? bookings = freezed,Object? seats = freezed,}) {
  return _then(_CoachInstance(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,routeId: null == routeId ? _self.routeId : routeId // ignore: cast_nullable_to_non_nullable
as String,departureDate: null == departureDate ? _self.departureDate : departureDate // ignore: cast_nullable_to_non_nullable
as DateTime,vehicleId: freezed == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String?,driverId: freezed == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as String?,guideId: freezed == guideId ? _self.guideId : guideId // ignore: cast_nullable_to_non_nullable
as String?,assignedBy: freezed == assignedBy ? _self.assignedBy : assignedBy // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CoachInstanceStatus,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,cancellationReason: freezed == cancellationReason ? _self.cancellationReason : cancellationReason // ignore: cast_nullable_to_non_nullable
as String?,cancelledBy: freezed == cancelledBy ? _self.cancelledBy : cancelledBy // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,bookings: freezed == bookings ? _self._bookings : bookings // ignore: cast_nullable_to_non_nullable
as List<CoachBooking>?,seats: freezed == seats ? _self._seats : seats // ignore: cast_nullable_to_non_nullable
as List<CoachInstanceSeat>?,
  ));
}


}

// dart format on
