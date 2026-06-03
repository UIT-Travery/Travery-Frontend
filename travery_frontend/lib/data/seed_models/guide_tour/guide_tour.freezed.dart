// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guide_tour.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GuideTour {

 String? get id;@JsonKey(name: 'tour_instance_id') String get tourInstanceId;@JsonKey(name: 'tour_id') String get tourId; String get tourName;@JsonKey(name: 'start_date') DateTime get startDate;@JsonKey(name: 'end_date') DateTime get endDate;@JsonKey(name: 'group_size') int get groupSize;@JsonKey(name: 'group_description') String get groupDescription; GuideTourStatus get status;@JsonKey(name: 'booking_id') String? get bookingId;@JsonKey(name: 'customer_name') String? get customerName;@JsonKey(name: 'customer_phone') String? get customerPhone;@JsonKey(name: 'vehicle_plate') String? get vehiclePlate;@JsonKey(name: 'driver_name') String? get driverName;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;// Extended fields from API response
 String? get driverPhone; String? get coachType; String? get pickupLocation; int? get passengerCount; int? get bookingsCount;
/// Create a copy of GuideTour
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GuideTourCopyWith<GuideTour> get copyWith => _$GuideTourCopyWithImpl<GuideTour>(this as GuideTour, _$identity);

  /// Serializes this GuideTour to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GuideTour&&(identical(other.id, id) || other.id == id)&&(identical(other.tourInstanceId, tourInstanceId) || other.tourInstanceId == tourInstanceId)&&(identical(other.tourId, tourId) || other.tourId == tourId)&&(identical(other.tourName, tourName) || other.tourName == tourName)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.groupSize, groupSize) || other.groupSize == groupSize)&&(identical(other.groupDescription, groupDescription) || other.groupDescription == groupDescription)&&(identical(other.status, status) || other.status == status)&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.customerPhone, customerPhone) || other.customerPhone == customerPhone)&&(identical(other.vehiclePlate, vehiclePlate) || other.vehiclePlate == vehiclePlate)&&(identical(other.driverName, driverName) || other.driverName == driverName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.driverPhone, driverPhone) || other.driverPhone == driverPhone)&&(identical(other.coachType, coachType) || other.coachType == coachType)&&(identical(other.pickupLocation, pickupLocation) || other.pickupLocation == pickupLocation)&&(identical(other.passengerCount, passengerCount) || other.passengerCount == passengerCount)&&(identical(other.bookingsCount, bookingsCount) || other.bookingsCount == bookingsCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,tourInstanceId,tourId,tourName,startDate,endDate,groupSize,groupDescription,status,bookingId,customerName,customerPhone,vehiclePlate,driverName,createdAt,updatedAt,driverPhone,coachType,pickupLocation,passengerCount,bookingsCount]);

@override
String toString() {
  return 'GuideTour(id: $id, tourInstanceId: $tourInstanceId, tourId: $tourId, tourName: $tourName, startDate: $startDate, endDate: $endDate, groupSize: $groupSize, groupDescription: $groupDescription, status: $status, bookingId: $bookingId, customerName: $customerName, customerPhone: $customerPhone, vehiclePlate: $vehiclePlate, driverName: $driverName, createdAt: $createdAt, updatedAt: $updatedAt, driverPhone: $driverPhone, coachType: $coachType, pickupLocation: $pickupLocation, passengerCount: $passengerCount, bookingsCount: $bookingsCount)';
}


}

/// @nodoc
abstract mixin class $GuideTourCopyWith<$Res>  {
  factory $GuideTourCopyWith(GuideTour value, $Res Function(GuideTour) _then) = _$GuideTourCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'tour_instance_id') String tourInstanceId,@JsonKey(name: 'tour_id') String tourId, String tourName,@JsonKey(name: 'start_date') DateTime startDate,@JsonKey(name: 'end_date') DateTime endDate,@JsonKey(name: 'group_size') int groupSize,@JsonKey(name: 'group_description') String groupDescription, GuideTourStatus status,@JsonKey(name: 'booking_id') String? bookingId,@JsonKey(name: 'customer_name') String? customerName,@JsonKey(name: 'customer_phone') String? customerPhone,@JsonKey(name: 'vehicle_plate') String? vehiclePlate,@JsonKey(name: 'driver_name') String? driverName,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt, String? driverPhone, String? coachType, String? pickupLocation, int? passengerCount, int? bookingsCount
});




}
/// @nodoc
class _$GuideTourCopyWithImpl<$Res>
    implements $GuideTourCopyWith<$Res> {
  _$GuideTourCopyWithImpl(this._self, this._then);

  final GuideTour _self;
  final $Res Function(GuideTour) _then;

/// Create a copy of GuideTour
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? tourInstanceId = null,Object? tourId = null,Object? tourName = null,Object? startDate = null,Object? endDate = null,Object? groupSize = null,Object? groupDescription = null,Object? status = null,Object? bookingId = freezed,Object? customerName = freezed,Object? customerPhone = freezed,Object? vehiclePlate = freezed,Object? driverName = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? driverPhone = freezed,Object? coachType = freezed,Object? pickupLocation = freezed,Object? passengerCount = freezed,Object? bookingsCount = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,tourInstanceId: null == tourInstanceId ? _self.tourInstanceId : tourInstanceId // ignore: cast_nullable_to_non_nullable
as String,tourId: null == tourId ? _self.tourId : tourId // ignore: cast_nullable_to_non_nullable
as String,tourName: null == tourName ? _self.tourName : tourName // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,groupSize: null == groupSize ? _self.groupSize : groupSize // ignore: cast_nullable_to_non_nullable
as int,groupDescription: null == groupDescription ? _self.groupDescription : groupDescription // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GuideTourStatus,bookingId: freezed == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as String?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,customerPhone: freezed == customerPhone ? _self.customerPhone : customerPhone // ignore: cast_nullable_to_non_nullable
as String?,vehiclePlate: freezed == vehiclePlate ? _self.vehiclePlate : vehiclePlate // ignore: cast_nullable_to_non_nullable
as String?,driverName: freezed == driverName ? _self.driverName : driverName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,driverPhone: freezed == driverPhone ? _self.driverPhone : driverPhone // ignore: cast_nullable_to_non_nullable
as String?,coachType: freezed == coachType ? _self.coachType : coachType // ignore: cast_nullable_to_non_nullable
as String?,pickupLocation: freezed == pickupLocation ? _self.pickupLocation : pickupLocation // ignore: cast_nullable_to_non_nullable
as String?,passengerCount: freezed == passengerCount ? _self.passengerCount : passengerCount // ignore: cast_nullable_to_non_nullable
as int?,bookingsCount: freezed == bookingsCount ? _self.bookingsCount : bookingsCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [GuideTour].
extension GuideTourPatterns on GuideTour {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GuideTour value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GuideTour() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GuideTour value)  $default,){
final _that = this;
switch (_that) {
case _GuideTour():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GuideTour value)?  $default,){
final _that = this;
switch (_that) {
case _GuideTour() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'tour_instance_id')  String tourInstanceId, @JsonKey(name: 'tour_id')  String tourId,  String tourName, @JsonKey(name: 'start_date')  DateTime startDate, @JsonKey(name: 'end_date')  DateTime endDate, @JsonKey(name: 'group_size')  int groupSize, @JsonKey(name: 'group_description')  String groupDescription,  GuideTourStatus status, @JsonKey(name: 'booking_id')  String? bookingId, @JsonKey(name: 'customer_name')  String? customerName, @JsonKey(name: 'customer_phone')  String? customerPhone, @JsonKey(name: 'vehicle_plate')  String? vehiclePlate, @JsonKey(name: 'driver_name')  String? driverName, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  String? driverPhone,  String? coachType,  String? pickupLocation,  int? passengerCount,  int? bookingsCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GuideTour() when $default != null:
return $default(_that.id,_that.tourInstanceId,_that.tourId,_that.tourName,_that.startDate,_that.endDate,_that.groupSize,_that.groupDescription,_that.status,_that.bookingId,_that.customerName,_that.customerPhone,_that.vehiclePlate,_that.driverName,_that.createdAt,_that.updatedAt,_that.driverPhone,_that.coachType,_that.pickupLocation,_that.passengerCount,_that.bookingsCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'tour_instance_id')  String tourInstanceId, @JsonKey(name: 'tour_id')  String tourId,  String tourName, @JsonKey(name: 'start_date')  DateTime startDate, @JsonKey(name: 'end_date')  DateTime endDate, @JsonKey(name: 'group_size')  int groupSize, @JsonKey(name: 'group_description')  String groupDescription,  GuideTourStatus status, @JsonKey(name: 'booking_id')  String? bookingId, @JsonKey(name: 'customer_name')  String? customerName, @JsonKey(name: 'customer_phone')  String? customerPhone, @JsonKey(name: 'vehicle_plate')  String? vehiclePlate, @JsonKey(name: 'driver_name')  String? driverName, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  String? driverPhone,  String? coachType,  String? pickupLocation,  int? passengerCount,  int? bookingsCount)  $default,) {final _that = this;
switch (_that) {
case _GuideTour():
return $default(_that.id,_that.tourInstanceId,_that.tourId,_that.tourName,_that.startDate,_that.endDate,_that.groupSize,_that.groupDescription,_that.status,_that.bookingId,_that.customerName,_that.customerPhone,_that.vehiclePlate,_that.driverName,_that.createdAt,_that.updatedAt,_that.driverPhone,_that.coachType,_that.pickupLocation,_that.passengerCount,_that.bookingsCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'tour_instance_id')  String tourInstanceId, @JsonKey(name: 'tour_id')  String tourId,  String tourName, @JsonKey(name: 'start_date')  DateTime startDate, @JsonKey(name: 'end_date')  DateTime endDate, @JsonKey(name: 'group_size')  int groupSize, @JsonKey(name: 'group_description')  String groupDescription,  GuideTourStatus status, @JsonKey(name: 'booking_id')  String? bookingId, @JsonKey(name: 'customer_name')  String? customerName, @JsonKey(name: 'customer_phone')  String? customerPhone, @JsonKey(name: 'vehicle_plate')  String? vehiclePlate, @JsonKey(name: 'driver_name')  String? driverName, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  String? driverPhone,  String? coachType,  String? pickupLocation,  int? passengerCount,  int? bookingsCount)?  $default,) {final _that = this;
switch (_that) {
case _GuideTour() when $default != null:
return $default(_that.id,_that.tourInstanceId,_that.tourId,_that.tourName,_that.startDate,_that.endDate,_that.groupSize,_that.groupDescription,_that.status,_that.bookingId,_that.customerName,_that.customerPhone,_that.vehiclePlate,_that.driverName,_that.createdAt,_that.updatedAt,_that.driverPhone,_that.coachType,_that.pickupLocation,_that.passengerCount,_that.bookingsCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GuideTour implements GuideTour {
  const _GuideTour({this.id, @JsonKey(name: 'tour_instance_id') required this.tourInstanceId, @JsonKey(name: 'tour_id') required this.tourId, required this.tourName, @JsonKey(name: 'start_date') required this.startDate, @JsonKey(name: 'end_date') required this.endDate, @JsonKey(name: 'group_size') required this.groupSize, @JsonKey(name: 'group_description') required this.groupDescription, required this.status, @JsonKey(name: 'booking_id') this.bookingId, @JsonKey(name: 'customer_name') this.customerName, @JsonKey(name: 'customer_phone') this.customerPhone, @JsonKey(name: 'vehicle_plate') this.vehiclePlate, @JsonKey(name: 'driver_name') this.driverName, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, this.driverPhone, this.coachType, this.pickupLocation, this.passengerCount, this.bookingsCount});
  factory _GuideTour.fromJson(Map<String, dynamic> json) => _$GuideTourFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'tour_instance_id') final  String tourInstanceId;
@override@JsonKey(name: 'tour_id') final  String tourId;
@override final  String tourName;
@override@JsonKey(name: 'start_date') final  DateTime startDate;
@override@JsonKey(name: 'end_date') final  DateTime endDate;
@override@JsonKey(name: 'group_size') final  int groupSize;
@override@JsonKey(name: 'group_description') final  String groupDescription;
@override final  GuideTourStatus status;
@override@JsonKey(name: 'booking_id') final  String? bookingId;
@override@JsonKey(name: 'customer_name') final  String? customerName;
@override@JsonKey(name: 'customer_phone') final  String? customerPhone;
@override@JsonKey(name: 'vehicle_plate') final  String? vehiclePlate;
@override@JsonKey(name: 'driver_name') final  String? driverName;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;
// Extended fields from API response
@override final  String? driverPhone;
@override final  String? coachType;
@override final  String? pickupLocation;
@override final  int? passengerCount;
@override final  int? bookingsCount;

/// Create a copy of GuideTour
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GuideTourCopyWith<_GuideTour> get copyWith => __$GuideTourCopyWithImpl<_GuideTour>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GuideTourToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GuideTour&&(identical(other.id, id) || other.id == id)&&(identical(other.tourInstanceId, tourInstanceId) || other.tourInstanceId == tourInstanceId)&&(identical(other.tourId, tourId) || other.tourId == tourId)&&(identical(other.tourName, tourName) || other.tourName == tourName)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.groupSize, groupSize) || other.groupSize == groupSize)&&(identical(other.groupDescription, groupDescription) || other.groupDescription == groupDescription)&&(identical(other.status, status) || other.status == status)&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.customerPhone, customerPhone) || other.customerPhone == customerPhone)&&(identical(other.vehiclePlate, vehiclePlate) || other.vehiclePlate == vehiclePlate)&&(identical(other.driverName, driverName) || other.driverName == driverName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.driverPhone, driverPhone) || other.driverPhone == driverPhone)&&(identical(other.coachType, coachType) || other.coachType == coachType)&&(identical(other.pickupLocation, pickupLocation) || other.pickupLocation == pickupLocation)&&(identical(other.passengerCount, passengerCount) || other.passengerCount == passengerCount)&&(identical(other.bookingsCount, bookingsCount) || other.bookingsCount == bookingsCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,tourInstanceId,tourId,tourName,startDate,endDate,groupSize,groupDescription,status,bookingId,customerName,customerPhone,vehiclePlate,driverName,createdAt,updatedAt,driverPhone,coachType,pickupLocation,passengerCount,bookingsCount]);

@override
String toString() {
  return 'GuideTour(id: $id, tourInstanceId: $tourInstanceId, tourId: $tourId, tourName: $tourName, startDate: $startDate, endDate: $endDate, groupSize: $groupSize, groupDescription: $groupDescription, status: $status, bookingId: $bookingId, customerName: $customerName, customerPhone: $customerPhone, vehiclePlate: $vehiclePlate, driverName: $driverName, createdAt: $createdAt, updatedAt: $updatedAt, driverPhone: $driverPhone, coachType: $coachType, pickupLocation: $pickupLocation, passengerCount: $passengerCount, bookingsCount: $bookingsCount)';
}


}

/// @nodoc
abstract mixin class _$GuideTourCopyWith<$Res> implements $GuideTourCopyWith<$Res> {
  factory _$GuideTourCopyWith(_GuideTour value, $Res Function(_GuideTour) _then) = __$GuideTourCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'tour_instance_id') String tourInstanceId,@JsonKey(name: 'tour_id') String tourId, String tourName,@JsonKey(name: 'start_date') DateTime startDate,@JsonKey(name: 'end_date') DateTime endDate,@JsonKey(name: 'group_size') int groupSize,@JsonKey(name: 'group_description') String groupDescription, GuideTourStatus status,@JsonKey(name: 'booking_id') String? bookingId,@JsonKey(name: 'customer_name') String? customerName,@JsonKey(name: 'customer_phone') String? customerPhone,@JsonKey(name: 'vehicle_plate') String? vehiclePlate,@JsonKey(name: 'driver_name') String? driverName,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt, String? driverPhone, String? coachType, String? pickupLocation, int? passengerCount, int? bookingsCount
});




}
/// @nodoc
class __$GuideTourCopyWithImpl<$Res>
    implements _$GuideTourCopyWith<$Res> {
  __$GuideTourCopyWithImpl(this._self, this._then);

  final _GuideTour _self;
  final $Res Function(_GuideTour) _then;

/// Create a copy of GuideTour
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? tourInstanceId = null,Object? tourId = null,Object? tourName = null,Object? startDate = null,Object? endDate = null,Object? groupSize = null,Object? groupDescription = null,Object? status = null,Object? bookingId = freezed,Object? customerName = freezed,Object? customerPhone = freezed,Object? vehiclePlate = freezed,Object? driverName = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? driverPhone = freezed,Object? coachType = freezed,Object? pickupLocation = freezed,Object? passengerCount = freezed,Object? bookingsCount = freezed,}) {
  return _then(_GuideTour(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,tourInstanceId: null == tourInstanceId ? _self.tourInstanceId : tourInstanceId // ignore: cast_nullable_to_non_nullable
as String,tourId: null == tourId ? _self.tourId : tourId // ignore: cast_nullable_to_non_nullable
as String,tourName: null == tourName ? _self.tourName : tourName // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,groupSize: null == groupSize ? _self.groupSize : groupSize // ignore: cast_nullable_to_non_nullable
as int,groupDescription: null == groupDescription ? _self.groupDescription : groupDescription // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GuideTourStatus,bookingId: freezed == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as String?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,customerPhone: freezed == customerPhone ? _self.customerPhone : customerPhone // ignore: cast_nullable_to_non_nullable
as String?,vehiclePlate: freezed == vehiclePlate ? _self.vehiclePlate : vehiclePlate // ignore: cast_nullable_to_non_nullable
as String?,driverName: freezed == driverName ? _self.driverName : driverName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,driverPhone: freezed == driverPhone ? _self.driverPhone : driverPhone // ignore: cast_nullable_to_non_nullable
as String?,coachType: freezed == coachType ? _self.coachType : coachType // ignore: cast_nullable_to_non_nullable
as String?,pickupLocation: freezed == pickupLocation ? _self.pickupLocation : pickupLocation // ignore: cast_nullable_to_non_nullable
as String?,passengerCount: freezed == passengerCount ? _self.passengerCount : passengerCount // ignore: cast_nullable_to_non_nullable
as int?,bookingsCount: freezed == bookingsCount ? _self.bookingsCount : bookingsCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
