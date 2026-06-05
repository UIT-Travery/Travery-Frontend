// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coach_trip_detail_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoachTripDetailResponse {

@JsonKey(name: 'id') String? get id;@JsonKey(name: 'departureTime') DateTime? get departureTime;@JsonKey(name: 'arrivalTime') DateTime? get arrivalTime;@JsonKey(name: 'status') String? get status;@JsonKey(name: 'routeId') String? get routeId;@JsonKey(name: 'originDestinationName') String? get originDestinationName;@JsonKey(name: 'destinationDestinationName') String? get destinationDestinationName;@JsonKey(name: 'basePrice') double? get basePrice;@JsonKey(name: 'coachId') String? get coachId;@JsonKey(name: 'coachLicensePlate') String? get coachLicensePlate;@JsonKey(name: 'coachType') String? get coachType;@JsonKey(name: 'driverId') String? get driverId;@JsonKey(name: 'driverName') String? get driverName;@JsonKey(name: 'driverPhone') String? get driverPhone;@JsonKey(name: 'guideId') String? get guideId;@JsonKey(name: 'guideName') String? get guideName;@JsonKey(name: 'guidePhone') String? get guidePhone;@JsonKey(name: 'totalSeats') int? get totalSeats;@JsonKey(name: 'availableSeats') int? get availableSeats;@JsonKey(name: 'bookingsCount') int? get bookingsCount;@JsonKey(name: 'passengersCount') int? get passengersCount;
/// Create a copy of CoachTripDetailResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoachTripDetailResponseCopyWith<CoachTripDetailResponse> get copyWith => _$CoachTripDetailResponseCopyWithImpl<CoachTripDetailResponse>(this as CoachTripDetailResponse, _$identity);

  /// Serializes this CoachTripDetailResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoachTripDetailResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.departureTime, departureTime) || other.departureTime == departureTime)&&(identical(other.arrivalTime, arrivalTime) || other.arrivalTime == arrivalTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.routeId, routeId) || other.routeId == routeId)&&(identical(other.originDestinationName, originDestinationName) || other.originDestinationName == originDestinationName)&&(identical(other.destinationDestinationName, destinationDestinationName) || other.destinationDestinationName == destinationDestinationName)&&(identical(other.basePrice, basePrice) || other.basePrice == basePrice)&&(identical(other.coachId, coachId) || other.coachId == coachId)&&(identical(other.coachLicensePlate, coachLicensePlate) || other.coachLicensePlate == coachLicensePlate)&&(identical(other.coachType, coachType) || other.coachType == coachType)&&(identical(other.driverId, driverId) || other.driverId == driverId)&&(identical(other.driverName, driverName) || other.driverName == driverName)&&(identical(other.driverPhone, driverPhone) || other.driverPhone == driverPhone)&&(identical(other.guideId, guideId) || other.guideId == guideId)&&(identical(other.guideName, guideName) || other.guideName == guideName)&&(identical(other.guidePhone, guidePhone) || other.guidePhone == guidePhone)&&(identical(other.totalSeats, totalSeats) || other.totalSeats == totalSeats)&&(identical(other.availableSeats, availableSeats) || other.availableSeats == availableSeats)&&(identical(other.bookingsCount, bookingsCount) || other.bookingsCount == bookingsCount)&&(identical(other.passengersCount, passengersCount) || other.passengersCount == passengersCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,departureTime,arrivalTime,status,routeId,originDestinationName,destinationDestinationName,basePrice,coachId,coachLicensePlate,coachType,driverId,driverName,driverPhone,guideId,guideName,guidePhone,totalSeats,availableSeats,bookingsCount,passengersCount]);

@override
String toString() {
  return 'CoachTripDetailResponse(id: $id, departureTime: $departureTime, arrivalTime: $arrivalTime, status: $status, routeId: $routeId, originDestinationName: $originDestinationName, destinationDestinationName: $destinationDestinationName, basePrice: $basePrice, coachId: $coachId, coachLicensePlate: $coachLicensePlate, coachType: $coachType, driverId: $driverId, driverName: $driverName, driverPhone: $driverPhone, guideId: $guideId, guideName: $guideName, guidePhone: $guidePhone, totalSeats: $totalSeats, availableSeats: $availableSeats, bookingsCount: $bookingsCount, passengersCount: $passengersCount)';
}


}

/// @nodoc
abstract mixin class $CoachTripDetailResponseCopyWith<$Res>  {
  factory $CoachTripDetailResponseCopyWith(CoachTripDetailResponse value, $Res Function(CoachTripDetailResponse) _then) = _$CoachTripDetailResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'departureTime') DateTime? departureTime,@JsonKey(name: 'arrivalTime') DateTime? arrivalTime,@JsonKey(name: 'status') String? status,@JsonKey(name: 'routeId') String? routeId,@JsonKey(name: 'originDestinationName') String? originDestinationName,@JsonKey(name: 'destinationDestinationName') String? destinationDestinationName,@JsonKey(name: 'basePrice') double? basePrice,@JsonKey(name: 'coachId') String? coachId,@JsonKey(name: 'coachLicensePlate') String? coachLicensePlate,@JsonKey(name: 'coachType') String? coachType,@JsonKey(name: 'driverId') String? driverId,@JsonKey(name: 'driverName') String? driverName,@JsonKey(name: 'driverPhone') String? driverPhone,@JsonKey(name: 'guideId') String? guideId,@JsonKey(name: 'guideName') String? guideName,@JsonKey(name: 'guidePhone') String? guidePhone,@JsonKey(name: 'totalSeats') int? totalSeats,@JsonKey(name: 'availableSeats') int? availableSeats,@JsonKey(name: 'bookingsCount') int? bookingsCount,@JsonKey(name: 'passengersCount') int? passengersCount
});




}
/// @nodoc
class _$CoachTripDetailResponseCopyWithImpl<$Res>
    implements $CoachTripDetailResponseCopyWith<$Res> {
  _$CoachTripDetailResponseCopyWithImpl(this._self, this._then);

  final CoachTripDetailResponse _self;
  final $Res Function(CoachTripDetailResponse) _then;

/// Create a copy of CoachTripDetailResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? departureTime = freezed,Object? arrivalTime = freezed,Object? status = freezed,Object? routeId = freezed,Object? originDestinationName = freezed,Object? destinationDestinationName = freezed,Object? basePrice = freezed,Object? coachId = freezed,Object? coachLicensePlate = freezed,Object? coachType = freezed,Object? driverId = freezed,Object? driverName = freezed,Object? driverPhone = freezed,Object? guideId = freezed,Object? guideName = freezed,Object? guidePhone = freezed,Object? totalSeats = freezed,Object? availableSeats = freezed,Object? bookingsCount = freezed,Object? passengersCount = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,departureTime: freezed == departureTime ? _self.departureTime : departureTime // ignore: cast_nullable_to_non_nullable
as DateTime?,arrivalTime: freezed == arrivalTime ? _self.arrivalTime : arrivalTime // ignore: cast_nullable_to_non_nullable
as DateTime?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,routeId: freezed == routeId ? _self.routeId : routeId // ignore: cast_nullable_to_non_nullable
as String?,originDestinationName: freezed == originDestinationName ? _self.originDestinationName : originDestinationName // ignore: cast_nullable_to_non_nullable
as String?,destinationDestinationName: freezed == destinationDestinationName ? _self.destinationDestinationName : destinationDestinationName // ignore: cast_nullable_to_non_nullable
as String?,basePrice: freezed == basePrice ? _self.basePrice : basePrice // ignore: cast_nullable_to_non_nullable
as double?,coachId: freezed == coachId ? _self.coachId : coachId // ignore: cast_nullable_to_non_nullable
as String?,coachLicensePlate: freezed == coachLicensePlate ? _self.coachLicensePlate : coachLicensePlate // ignore: cast_nullable_to_non_nullable
as String?,coachType: freezed == coachType ? _self.coachType : coachType // ignore: cast_nullable_to_non_nullable
as String?,driverId: freezed == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as String?,driverName: freezed == driverName ? _self.driverName : driverName // ignore: cast_nullable_to_non_nullable
as String?,driverPhone: freezed == driverPhone ? _self.driverPhone : driverPhone // ignore: cast_nullable_to_non_nullable
as String?,guideId: freezed == guideId ? _self.guideId : guideId // ignore: cast_nullable_to_non_nullable
as String?,guideName: freezed == guideName ? _self.guideName : guideName // ignore: cast_nullable_to_non_nullable
as String?,guidePhone: freezed == guidePhone ? _self.guidePhone : guidePhone // ignore: cast_nullable_to_non_nullable
as String?,totalSeats: freezed == totalSeats ? _self.totalSeats : totalSeats // ignore: cast_nullable_to_non_nullable
as int?,availableSeats: freezed == availableSeats ? _self.availableSeats : availableSeats // ignore: cast_nullable_to_non_nullable
as int?,bookingsCount: freezed == bookingsCount ? _self.bookingsCount : bookingsCount // ignore: cast_nullable_to_non_nullable
as int?,passengersCount: freezed == passengersCount ? _self.passengersCount : passengersCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CoachTripDetailResponse].
extension CoachTripDetailResponsePatterns on CoachTripDetailResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoachTripDetailResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoachTripDetailResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoachTripDetailResponse value)  $default,){
final _that = this;
switch (_that) {
case _CoachTripDetailResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoachTripDetailResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CoachTripDetailResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String? id, @JsonKey(name: 'departureTime')  DateTime? departureTime, @JsonKey(name: 'arrivalTime')  DateTime? arrivalTime, @JsonKey(name: 'status')  String? status, @JsonKey(name: 'routeId')  String? routeId, @JsonKey(name: 'originDestinationName')  String? originDestinationName, @JsonKey(name: 'destinationDestinationName')  String? destinationDestinationName, @JsonKey(name: 'basePrice')  double? basePrice, @JsonKey(name: 'coachId')  String? coachId, @JsonKey(name: 'coachLicensePlate')  String? coachLicensePlate, @JsonKey(name: 'coachType')  String? coachType, @JsonKey(name: 'driverId')  String? driverId, @JsonKey(name: 'driverName')  String? driverName, @JsonKey(name: 'driverPhone')  String? driverPhone, @JsonKey(name: 'guideId')  String? guideId, @JsonKey(name: 'guideName')  String? guideName, @JsonKey(name: 'guidePhone')  String? guidePhone, @JsonKey(name: 'totalSeats')  int? totalSeats, @JsonKey(name: 'availableSeats')  int? availableSeats, @JsonKey(name: 'bookingsCount')  int? bookingsCount, @JsonKey(name: 'passengersCount')  int? passengersCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoachTripDetailResponse() when $default != null:
return $default(_that.id,_that.departureTime,_that.arrivalTime,_that.status,_that.routeId,_that.originDestinationName,_that.destinationDestinationName,_that.basePrice,_that.coachId,_that.coachLicensePlate,_that.coachType,_that.driverId,_that.driverName,_that.driverPhone,_that.guideId,_that.guideName,_that.guidePhone,_that.totalSeats,_that.availableSeats,_that.bookingsCount,_that.passengersCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String? id, @JsonKey(name: 'departureTime')  DateTime? departureTime, @JsonKey(name: 'arrivalTime')  DateTime? arrivalTime, @JsonKey(name: 'status')  String? status, @JsonKey(name: 'routeId')  String? routeId, @JsonKey(name: 'originDestinationName')  String? originDestinationName, @JsonKey(name: 'destinationDestinationName')  String? destinationDestinationName, @JsonKey(name: 'basePrice')  double? basePrice, @JsonKey(name: 'coachId')  String? coachId, @JsonKey(name: 'coachLicensePlate')  String? coachLicensePlate, @JsonKey(name: 'coachType')  String? coachType, @JsonKey(name: 'driverId')  String? driverId, @JsonKey(name: 'driverName')  String? driverName, @JsonKey(name: 'driverPhone')  String? driverPhone, @JsonKey(name: 'guideId')  String? guideId, @JsonKey(name: 'guideName')  String? guideName, @JsonKey(name: 'guidePhone')  String? guidePhone, @JsonKey(name: 'totalSeats')  int? totalSeats, @JsonKey(name: 'availableSeats')  int? availableSeats, @JsonKey(name: 'bookingsCount')  int? bookingsCount, @JsonKey(name: 'passengersCount')  int? passengersCount)  $default,) {final _that = this;
switch (_that) {
case _CoachTripDetailResponse():
return $default(_that.id,_that.departureTime,_that.arrivalTime,_that.status,_that.routeId,_that.originDestinationName,_that.destinationDestinationName,_that.basePrice,_that.coachId,_that.coachLicensePlate,_that.coachType,_that.driverId,_that.driverName,_that.driverPhone,_that.guideId,_that.guideName,_that.guidePhone,_that.totalSeats,_that.availableSeats,_that.bookingsCount,_that.passengersCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  String? id, @JsonKey(name: 'departureTime')  DateTime? departureTime, @JsonKey(name: 'arrivalTime')  DateTime? arrivalTime, @JsonKey(name: 'status')  String? status, @JsonKey(name: 'routeId')  String? routeId, @JsonKey(name: 'originDestinationName')  String? originDestinationName, @JsonKey(name: 'destinationDestinationName')  String? destinationDestinationName, @JsonKey(name: 'basePrice')  double? basePrice, @JsonKey(name: 'coachId')  String? coachId, @JsonKey(name: 'coachLicensePlate')  String? coachLicensePlate, @JsonKey(name: 'coachType')  String? coachType, @JsonKey(name: 'driverId')  String? driverId, @JsonKey(name: 'driverName')  String? driverName, @JsonKey(name: 'driverPhone')  String? driverPhone, @JsonKey(name: 'guideId')  String? guideId, @JsonKey(name: 'guideName')  String? guideName, @JsonKey(name: 'guidePhone')  String? guidePhone, @JsonKey(name: 'totalSeats')  int? totalSeats, @JsonKey(name: 'availableSeats')  int? availableSeats, @JsonKey(name: 'bookingsCount')  int? bookingsCount, @JsonKey(name: 'passengersCount')  int? passengersCount)?  $default,) {final _that = this;
switch (_that) {
case _CoachTripDetailResponse() when $default != null:
return $default(_that.id,_that.departureTime,_that.arrivalTime,_that.status,_that.routeId,_that.originDestinationName,_that.destinationDestinationName,_that.basePrice,_that.coachId,_that.coachLicensePlate,_that.coachType,_that.driverId,_that.driverName,_that.driverPhone,_that.guideId,_that.guideName,_that.guidePhone,_that.totalSeats,_that.availableSeats,_that.bookingsCount,_that.passengersCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CoachTripDetailResponse implements CoachTripDetailResponse {
  const _CoachTripDetailResponse({@JsonKey(name: 'id') this.id, @JsonKey(name: 'departureTime') this.departureTime, @JsonKey(name: 'arrivalTime') this.arrivalTime, @JsonKey(name: 'status') this.status, @JsonKey(name: 'routeId') this.routeId, @JsonKey(name: 'originDestinationName') this.originDestinationName, @JsonKey(name: 'destinationDestinationName') this.destinationDestinationName, @JsonKey(name: 'basePrice') this.basePrice, @JsonKey(name: 'coachId') this.coachId, @JsonKey(name: 'coachLicensePlate') this.coachLicensePlate, @JsonKey(name: 'coachType') this.coachType, @JsonKey(name: 'driverId') this.driverId, @JsonKey(name: 'driverName') this.driverName, @JsonKey(name: 'driverPhone') this.driverPhone, @JsonKey(name: 'guideId') this.guideId, @JsonKey(name: 'guideName') this.guideName, @JsonKey(name: 'guidePhone') this.guidePhone, @JsonKey(name: 'totalSeats') this.totalSeats, @JsonKey(name: 'availableSeats') this.availableSeats, @JsonKey(name: 'bookingsCount') this.bookingsCount, @JsonKey(name: 'passengersCount') this.passengersCount});
  factory _CoachTripDetailResponse.fromJson(Map<String, dynamic> json) => _$CoachTripDetailResponseFromJson(json);

@override@JsonKey(name: 'id') final  String? id;
@override@JsonKey(name: 'departureTime') final  DateTime? departureTime;
@override@JsonKey(name: 'arrivalTime') final  DateTime? arrivalTime;
@override@JsonKey(name: 'status') final  String? status;
@override@JsonKey(name: 'routeId') final  String? routeId;
@override@JsonKey(name: 'originDestinationName') final  String? originDestinationName;
@override@JsonKey(name: 'destinationDestinationName') final  String? destinationDestinationName;
@override@JsonKey(name: 'basePrice') final  double? basePrice;
@override@JsonKey(name: 'coachId') final  String? coachId;
@override@JsonKey(name: 'coachLicensePlate') final  String? coachLicensePlate;
@override@JsonKey(name: 'coachType') final  String? coachType;
@override@JsonKey(name: 'driverId') final  String? driverId;
@override@JsonKey(name: 'driverName') final  String? driverName;
@override@JsonKey(name: 'driverPhone') final  String? driverPhone;
@override@JsonKey(name: 'guideId') final  String? guideId;
@override@JsonKey(name: 'guideName') final  String? guideName;
@override@JsonKey(name: 'guidePhone') final  String? guidePhone;
@override@JsonKey(name: 'totalSeats') final  int? totalSeats;
@override@JsonKey(name: 'availableSeats') final  int? availableSeats;
@override@JsonKey(name: 'bookingsCount') final  int? bookingsCount;
@override@JsonKey(name: 'passengersCount') final  int? passengersCount;

/// Create a copy of CoachTripDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoachTripDetailResponseCopyWith<_CoachTripDetailResponse> get copyWith => __$CoachTripDetailResponseCopyWithImpl<_CoachTripDetailResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CoachTripDetailResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoachTripDetailResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.departureTime, departureTime) || other.departureTime == departureTime)&&(identical(other.arrivalTime, arrivalTime) || other.arrivalTime == arrivalTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.routeId, routeId) || other.routeId == routeId)&&(identical(other.originDestinationName, originDestinationName) || other.originDestinationName == originDestinationName)&&(identical(other.destinationDestinationName, destinationDestinationName) || other.destinationDestinationName == destinationDestinationName)&&(identical(other.basePrice, basePrice) || other.basePrice == basePrice)&&(identical(other.coachId, coachId) || other.coachId == coachId)&&(identical(other.coachLicensePlate, coachLicensePlate) || other.coachLicensePlate == coachLicensePlate)&&(identical(other.coachType, coachType) || other.coachType == coachType)&&(identical(other.driverId, driverId) || other.driverId == driverId)&&(identical(other.driverName, driverName) || other.driverName == driverName)&&(identical(other.driverPhone, driverPhone) || other.driverPhone == driverPhone)&&(identical(other.guideId, guideId) || other.guideId == guideId)&&(identical(other.guideName, guideName) || other.guideName == guideName)&&(identical(other.guidePhone, guidePhone) || other.guidePhone == guidePhone)&&(identical(other.totalSeats, totalSeats) || other.totalSeats == totalSeats)&&(identical(other.availableSeats, availableSeats) || other.availableSeats == availableSeats)&&(identical(other.bookingsCount, bookingsCount) || other.bookingsCount == bookingsCount)&&(identical(other.passengersCount, passengersCount) || other.passengersCount == passengersCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,departureTime,arrivalTime,status,routeId,originDestinationName,destinationDestinationName,basePrice,coachId,coachLicensePlate,coachType,driverId,driverName,driverPhone,guideId,guideName,guidePhone,totalSeats,availableSeats,bookingsCount,passengersCount]);

@override
String toString() {
  return 'CoachTripDetailResponse(id: $id, departureTime: $departureTime, arrivalTime: $arrivalTime, status: $status, routeId: $routeId, originDestinationName: $originDestinationName, destinationDestinationName: $destinationDestinationName, basePrice: $basePrice, coachId: $coachId, coachLicensePlate: $coachLicensePlate, coachType: $coachType, driverId: $driverId, driverName: $driverName, driverPhone: $driverPhone, guideId: $guideId, guideName: $guideName, guidePhone: $guidePhone, totalSeats: $totalSeats, availableSeats: $availableSeats, bookingsCount: $bookingsCount, passengersCount: $passengersCount)';
}


}

/// @nodoc
abstract mixin class _$CoachTripDetailResponseCopyWith<$Res> implements $CoachTripDetailResponseCopyWith<$Res> {
  factory _$CoachTripDetailResponseCopyWith(_CoachTripDetailResponse value, $Res Function(_CoachTripDetailResponse) _then) = __$CoachTripDetailResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'departureTime') DateTime? departureTime,@JsonKey(name: 'arrivalTime') DateTime? arrivalTime,@JsonKey(name: 'status') String? status,@JsonKey(name: 'routeId') String? routeId,@JsonKey(name: 'originDestinationName') String? originDestinationName,@JsonKey(name: 'destinationDestinationName') String? destinationDestinationName,@JsonKey(name: 'basePrice') double? basePrice,@JsonKey(name: 'coachId') String? coachId,@JsonKey(name: 'coachLicensePlate') String? coachLicensePlate,@JsonKey(name: 'coachType') String? coachType,@JsonKey(name: 'driverId') String? driverId,@JsonKey(name: 'driverName') String? driverName,@JsonKey(name: 'driverPhone') String? driverPhone,@JsonKey(name: 'guideId') String? guideId,@JsonKey(name: 'guideName') String? guideName,@JsonKey(name: 'guidePhone') String? guidePhone,@JsonKey(name: 'totalSeats') int? totalSeats,@JsonKey(name: 'availableSeats') int? availableSeats,@JsonKey(name: 'bookingsCount') int? bookingsCount,@JsonKey(name: 'passengersCount') int? passengersCount
});




}
/// @nodoc
class __$CoachTripDetailResponseCopyWithImpl<$Res>
    implements _$CoachTripDetailResponseCopyWith<$Res> {
  __$CoachTripDetailResponseCopyWithImpl(this._self, this._then);

  final _CoachTripDetailResponse _self;
  final $Res Function(_CoachTripDetailResponse) _then;

/// Create a copy of CoachTripDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? departureTime = freezed,Object? arrivalTime = freezed,Object? status = freezed,Object? routeId = freezed,Object? originDestinationName = freezed,Object? destinationDestinationName = freezed,Object? basePrice = freezed,Object? coachId = freezed,Object? coachLicensePlate = freezed,Object? coachType = freezed,Object? driverId = freezed,Object? driverName = freezed,Object? driverPhone = freezed,Object? guideId = freezed,Object? guideName = freezed,Object? guidePhone = freezed,Object? totalSeats = freezed,Object? availableSeats = freezed,Object? bookingsCount = freezed,Object? passengersCount = freezed,}) {
  return _then(_CoachTripDetailResponse(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,departureTime: freezed == departureTime ? _self.departureTime : departureTime // ignore: cast_nullable_to_non_nullable
as DateTime?,arrivalTime: freezed == arrivalTime ? _self.arrivalTime : arrivalTime // ignore: cast_nullable_to_non_nullable
as DateTime?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,routeId: freezed == routeId ? _self.routeId : routeId // ignore: cast_nullable_to_non_nullable
as String?,originDestinationName: freezed == originDestinationName ? _self.originDestinationName : originDestinationName // ignore: cast_nullable_to_non_nullable
as String?,destinationDestinationName: freezed == destinationDestinationName ? _self.destinationDestinationName : destinationDestinationName // ignore: cast_nullable_to_non_nullable
as String?,basePrice: freezed == basePrice ? _self.basePrice : basePrice // ignore: cast_nullable_to_non_nullable
as double?,coachId: freezed == coachId ? _self.coachId : coachId // ignore: cast_nullable_to_non_nullable
as String?,coachLicensePlate: freezed == coachLicensePlate ? _self.coachLicensePlate : coachLicensePlate // ignore: cast_nullable_to_non_nullable
as String?,coachType: freezed == coachType ? _self.coachType : coachType // ignore: cast_nullable_to_non_nullable
as String?,driverId: freezed == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as String?,driverName: freezed == driverName ? _self.driverName : driverName // ignore: cast_nullable_to_non_nullable
as String?,driverPhone: freezed == driverPhone ? _self.driverPhone : driverPhone // ignore: cast_nullable_to_non_nullable
as String?,guideId: freezed == guideId ? _self.guideId : guideId // ignore: cast_nullable_to_non_nullable
as String?,guideName: freezed == guideName ? _self.guideName : guideName // ignore: cast_nullable_to_non_nullable
as String?,guidePhone: freezed == guidePhone ? _self.guidePhone : guidePhone // ignore: cast_nullable_to_non_nullable
as String?,totalSeats: freezed == totalSeats ? _self.totalSeats : totalSeats // ignore: cast_nullable_to_non_nullable
as int?,availableSeats: freezed == availableSeats ? _self.availableSeats : availableSeats // ignore: cast_nullable_to_non_nullable
as int?,bookingsCount: freezed == bookingsCount ? _self.bookingsCount : bookingsCount // ignore: cast_nullable_to_non_nullable
as int?,passengersCount: freezed == passengersCount ? _self.passengersCount : passengersCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
