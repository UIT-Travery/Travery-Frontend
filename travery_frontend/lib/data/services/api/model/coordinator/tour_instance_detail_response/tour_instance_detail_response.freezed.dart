// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tour_instance_detail_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TourInstanceDetailResponse {

 String get id; String get tourName; String get destinationName; String get pickupLocation; String get startDate; String get endDate; int get minParticipants; int get maxParticipants; int get currentParticipants; String get status; String? get guideId; String? get guideName; String? get guidePhone; String? get coachId; String? get coachLicensePlate; String? get coachType; String? get driverId; String? get driverName; String? get driverPhone;
/// Create a copy of TourInstanceDetailResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TourInstanceDetailResponseCopyWith<TourInstanceDetailResponse> get copyWith => _$TourInstanceDetailResponseCopyWithImpl<TourInstanceDetailResponse>(this as TourInstanceDetailResponse, _$identity);

  /// Serializes this TourInstanceDetailResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TourInstanceDetailResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.tourName, tourName) || other.tourName == tourName)&&(identical(other.destinationName, destinationName) || other.destinationName == destinationName)&&(identical(other.pickupLocation, pickupLocation) || other.pickupLocation == pickupLocation)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.minParticipants, minParticipants) || other.minParticipants == minParticipants)&&(identical(other.maxParticipants, maxParticipants) || other.maxParticipants == maxParticipants)&&(identical(other.currentParticipants, currentParticipants) || other.currentParticipants == currentParticipants)&&(identical(other.status, status) || other.status == status)&&(identical(other.guideId, guideId) || other.guideId == guideId)&&(identical(other.guideName, guideName) || other.guideName == guideName)&&(identical(other.guidePhone, guidePhone) || other.guidePhone == guidePhone)&&(identical(other.coachId, coachId) || other.coachId == coachId)&&(identical(other.coachLicensePlate, coachLicensePlate) || other.coachLicensePlate == coachLicensePlate)&&(identical(other.coachType, coachType) || other.coachType == coachType)&&(identical(other.driverId, driverId) || other.driverId == driverId)&&(identical(other.driverName, driverName) || other.driverName == driverName)&&(identical(other.driverPhone, driverPhone) || other.driverPhone == driverPhone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,tourName,destinationName,pickupLocation,startDate,endDate,minParticipants,maxParticipants,currentParticipants,status,guideId,guideName,guidePhone,coachId,coachLicensePlate,coachType,driverId,driverName,driverPhone]);

@override
String toString() {
  return 'TourInstanceDetailResponse(id: $id, tourName: $tourName, destinationName: $destinationName, pickupLocation: $pickupLocation, startDate: $startDate, endDate: $endDate, minParticipants: $minParticipants, maxParticipants: $maxParticipants, currentParticipants: $currentParticipants, status: $status, guideId: $guideId, guideName: $guideName, guidePhone: $guidePhone, coachId: $coachId, coachLicensePlate: $coachLicensePlate, coachType: $coachType, driverId: $driverId, driverName: $driverName, driverPhone: $driverPhone)';
}


}

/// @nodoc
abstract mixin class $TourInstanceDetailResponseCopyWith<$Res>  {
  factory $TourInstanceDetailResponseCopyWith(TourInstanceDetailResponse value, $Res Function(TourInstanceDetailResponse) _then) = _$TourInstanceDetailResponseCopyWithImpl;
@useResult
$Res call({
 String id, String tourName, String destinationName, String pickupLocation, String startDate, String endDate, int minParticipants, int maxParticipants, int currentParticipants, String status, String? guideId, String? guideName, String? guidePhone, String? coachId, String? coachLicensePlate, String? coachType, String? driverId, String? driverName, String? driverPhone
});




}
/// @nodoc
class _$TourInstanceDetailResponseCopyWithImpl<$Res>
    implements $TourInstanceDetailResponseCopyWith<$Res> {
  _$TourInstanceDetailResponseCopyWithImpl(this._self, this._then);

  final TourInstanceDetailResponse _self;
  final $Res Function(TourInstanceDetailResponse) _then;

/// Create a copy of TourInstanceDetailResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tourName = null,Object? destinationName = null,Object? pickupLocation = null,Object? startDate = null,Object? endDate = null,Object? minParticipants = null,Object? maxParticipants = null,Object? currentParticipants = null,Object? status = null,Object? guideId = freezed,Object? guideName = freezed,Object? guidePhone = freezed,Object? coachId = freezed,Object? coachLicensePlate = freezed,Object? coachType = freezed,Object? driverId = freezed,Object? driverName = freezed,Object? driverPhone = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tourName: null == tourName ? _self.tourName : tourName // ignore: cast_nullable_to_non_nullable
as String,destinationName: null == destinationName ? _self.destinationName : destinationName // ignore: cast_nullable_to_non_nullable
as String,pickupLocation: null == pickupLocation ? _self.pickupLocation : pickupLocation // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,minParticipants: null == minParticipants ? _self.minParticipants : minParticipants // ignore: cast_nullable_to_non_nullable
as int,maxParticipants: null == maxParticipants ? _self.maxParticipants : maxParticipants // ignore: cast_nullable_to_non_nullable
as int,currentParticipants: null == currentParticipants ? _self.currentParticipants : currentParticipants // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,guideId: freezed == guideId ? _self.guideId : guideId // ignore: cast_nullable_to_non_nullable
as String?,guideName: freezed == guideName ? _self.guideName : guideName // ignore: cast_nullable_to_non_nullable
as String?,guidePhone: freezed == guidePhone ? _self.guidePhone : guidePhone // ignore: cast_nullable_to_non_nullable
as String?,coachId: freezed == coachId ? _self.coachId : coachId // ignore: cast_nullable_to_non_nullable
as String?,coachLicensePlate: freezed == coachLicensePlate ? _self.coachLicensePlate : coachLicensePlate // ignore: cast_nullable_to_non_nullable
as String?,coachType: freezed == coachType ? _self.coachType : coachType // ignore: cast_nullable_to_non_nullable
as String?,driverId: freezed == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as String?,driverName: freezed == driverName ? _self.driverName : driverName // ignore: cast_nullable_to_non_nullable
as String?,driverPhone: freezed == driverPhone ? _self.driverPhone : driverPhone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TourInstanceDetailResponse].
extension TourInstanceDetailResponsePatterns on TourInstanceDetailResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TourInstanceDetailResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TourInstanceDetailResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TourInstanceDetailResponse value)  $default,){
final _that = this;
switch (_that) {
case _TourInstanceDetailResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TourInstanceDetailResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TourInstanceDetailResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String tourName,  String destinationName,  String pickupLocation,  String startDate,  String endDate,  int minParticipants,  int maxParticipants,  int currentParticipants,  String status,  String? guideId,  String? guideName,  String? guidePhone,  String? coachId,  String? coachLicensePlate,  String? coachType,  String? driverId,  String? driverName,  String? driverPhone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TourInstanceDetailResponse() when $default != null:
return $default(_that.id,_that.tourName,_that.destinationName,_that.pickupLocation,_that.startDate,_that.endDate,_that.minParticipants,_that.maxParticipants,_that.currentParticipants,_that.status,_that.guideId,_that.guideName,_that.guidePhone,_that.coachId,_that.coachLicensePlate,_that.coachType,_that.driverId,_that.driverName,_that.driverPhone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String tourName,  String destinationName,  String pickupLocation,  String startDate,  String endDate,  int minParticipants,  int maxParticipants,  int currentParticipants,  String status,  String? guideId,  String? guideName,  String? guidePhone,  String? coachId,  String? coachLicensePlate,  String? coachType,  String? driverId,  String? driverName,  String? driverPhone)  $default,) {final _that = this;
switch (_that) {
case _TourInstanceDetailResponse():
return $default(_that.id,_that.tourName,_that.destinationName,_that.pickupLocation,_that.startDate,_that.endDate,_that.minParticipants,_that.maxParticipants,_that.currentParticipants,_that.status,_that.guideId,_that.guideName,_that.guidePhone,_that.coachId,_that.coachLicensePlate,_that.coachType,_that.driverId,_that.driverName,_that.driverPhone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String tourName,  String destinationName,  String pickupLocation,  String startDate,  String endDate,  int minParticipants,  int maxParticipants,  int currentParticipants,  String status,  String? guideId,  String? guideName,  String? guidePhone,  String? coachId,  String? coachLicensePlate,  String? coachType,  String? driverId,  String? driverName,  String? driverPhone)?  $default,) {final _that = this;
switch (_that) {
case _TourInstanceDetailResponse() when $default != null:
return $default(_that.id,_that.tourName,_that.destinationName,_that.pickupLocation,_that.startDate,_that.endDate,_that.minParticipants,_that.maxParticipants,_that.currentParticipants,_that.status,_that.guideId,_that.guideName,_that.guidePhone,_that.coachId,_that.coachLicensePlate,_that.coachType,_that.driverId,_that.driverName,_that.driverPhone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TourInstanceDetailResponse implements TourInstanceDetailResponse {
  const _TourInstanceDetailResponse({required this.id, required this.tourName, required this.destinationName, this.pickupLocation = '', required this.startDate, required this.endDate, this.minParticipants = 0, this.maxParticipants = 0, this.currentParticipants = 0, required this.status, this.guideId, this.guideName, this.guidePhone, this.coachId, this.coachLicensePlate, this.coachType, this.driverId, this.driverName, this.driverPhone});
  factory _TourInstanceDetailResponse.fromJson(Map<String, dynamic> json) => _$TourInstanceDetailResponseFromJson(json);

@override final  String id;
@override final  String tourName;
@override final  String destinationName;
@override@JsonKey() final  String pickupLocation;
@override final  String startDate;
@override final  String endDate;
@override@JsonKey() final  int minParticipants;
@override@JsonKey() final  int maxParticipants;
@override@JsonKey() final  int currentParticipants;
@override final  String status;
@override final  String? guideId;
@override final  String? guideName;
@override final  String? guidePhone;
@override final  String? coachId;
@override final  String? coachLicensePlate;
@override final  String? coachType;
@override final  String? driverId;
@override final  String? driverName;
@override final  String? driverPhone;

/// Create a copy of TourInstanceDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TourInstanceDetailResponseCopyWith<_TourInstanceDetailResponse> get copyWith => __$TourInstanceDetailResponseCopyWithImpl<_TourInstanceDetailResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TourInstanceDetailResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TourInstanceDetailResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.tourName, tourName) || other.tourName == tourName)&&(identical(other.destinationName, destinationName) || other.destinationName == destinationName)&&(identical(other.pickupLocation, pickupLocation) || other.pickupLocation == pickupLocation)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.minParticipants, minParticipants) || other.minParticipants == minParticipants)&&(identical(other.maxParticipants, maxParticipants) || other.maxParticipants == maxParticipants)&&(identical(other.currentParticipants, currentParticipants) || other.currentParticipants == currentParticipants)&&(identical(other.status, status) || other.status == status)&&(identical(other.guideId, guideId) || other.guideId == guideId)&&(identical(other.guideName, guideName) || other.guideName == guideName)&&(identical(other.guidePhone, guidePhone) || other.guidePhone == guidePhone)&&(identical(other.coachId, coachId) || other.coachId == coachId)&&(identical(other.coachLicensePlate, coachLicensePlate) || other.coachLicensePlate == coachLicensePlate)&&(identical(other.coachType, coachType) || other.coachType == coachType)&&(identical(other.driverId, driverId) || other.driverId == driverId)&&(identical(other.driverName, driverName) || other.driverName == driverName)&&(identical(other.driverPhone, driverPhone) || other.driverPhone == driverPhone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,tourName,destinationName,pickupLocation,startDate,endDate,minParticipants,maxParticipants,currentParticipants,status,guideId,guideName,guidePhone,coachId,coachLicensePlate,coachType,driverId,driverName,driverPhone]);

@override
String toString() {
  return 'TourInstanceDetailResponse(id: $id, tourName: $tourName, destinationName: $destinationName, pickupLocation: $pickupLocation, startDate: $startDate, endDate: $endDate, minParticipants: $minParticipants, maxParticipants: $maxParticipants, currentParticipants: $currentParticipants, status: $status, guideId: $guideId, guideName: $guideName, guidePhone: $guidePhone, coachId: $coachId, coachLicensePlate: $coachLicensePlate, coachType: $coachType, driverId: $driverId, driverName: $driverName, driverPhone: $driverPhone)';
}


}

/// @nodoc
abstract mixin class _$TourInstanceDetailResponseCopyWith<$Res> implements $TourInstanceDetailResponseCopyWith<$Res> {
  factory _$TourInstanceDetailResponseCopyWith(_TourInstanceDetailResponse value, $Res Function(_TourInstanceDetailResponse) _then) = __$TourInstanceDetailResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, String tourName, String destinationName, String pickupLocation, String startDate, String endDate, int minParticipants, int maxParticipants, int currentParticipants, String status, String? guideId, String? guideName, String? guidePhone, String? coachId, String? coachLicensePlate, String? coachType, String? driverId, String? driverName, String? driverPhone
});




}
/// @nodoc
class __$TourInstanceDetailResponseCopyWithImpl<$Res>
    implements _$TourInstanceDetailResponseCopyWith<$Res> {
  __$TourInstanceDetailResponseCopyWithImpl(this._self, this._then);

  final _TourInstanceDetailResponse _self;
  final $Res Function(_TourInstanceDetailResponse) _then;

/// Create a copy of TourInstanceDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tourName = null,Object? destinationName = null,Object? pickupLocation = null,Object? startDate = null,Object? endDate = null,Object? minParticipants = null,Object? maxParticipants = null,Object? currentParticipants = null,Object? status = null,Object? guideId = freezed,Object? guideName = freezed,Object? guidePhone = freezed,Object? coachId = freezed,Object? coachLicensePlate = freezed,Object? coachType = freezed,Object? driverId = freezed,Object? driverName = freezed,Object? driverPhone = freezed,}) {
  return _then(_TourInstanceDetailResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tourName: null == tourName ? _self.tourName : tourName // ignore: cast_nullable_to_non_nullable
as String,destinationName: null == destinationName ? _self.destinationName : destinationName // ignore: cast_nullable_to_non_nullable
as String,pickupLocation: null == pickupLocation ? _self.pickupLocation : pickupLocation // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,minParticipants: null == minParticipants ? _self.minParticipants : minParticipants // ignore: cast_nullable_to_non_nullable
as int,maxParticipants: null == maxParticipants ? _self.maxParticipants : maxParticipants // ignore: cast_nullable_to_non_nullable
as int,currentParticipants: null == currentParticipants ? _self.currentParticipants : currentParticipants // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,guideId: freezed == guideId ? _self.guideId : guideId // ignore: cast_nullable_to_non_nullable
as String?,guideName: freezed == guideName ? _self.guideName : guideName // ignore: cast_nullable_to_non_nullable
as String?,guidePhone: freezed == guidePhone ? _self.guidePhone : guidePhone // ignore: cast_nullable_to_non_nullable
as String?,coachId: freezed == coachId ? _self.coachId : coachId // ignore: cast_nullable_to_non_nullable
as String?,coachLicensePlate: freezed == coachLicensePlate ? _self.coachLicensePlate : coachLicensePlate // ignore: cast_nullable_to_non_nullable
as String?,coachType: freezed == coachType ? _self.coachType : coachType // ignore: cast_nullable_to_non_nullable
as String?,driverId: freezed == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as String?,driverName: freezed == driverName ? _self.driverName : driverName // ignore: cast_nullable_to_non_nullable
as String?,driverPhone: freezed == driverPhone ? _self.driverPhone : driverPhone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
