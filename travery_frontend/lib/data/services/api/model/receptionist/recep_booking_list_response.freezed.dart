// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recep_booking_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecepBookingListResponse {

 String get id; String get guestName; String get phoneNumber; String get checkInDate; String get checkOutDate; String get status;
/// Create a copy of RecepBookingListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecepBookingListResponseCopyWith<RecepBookingListResponse> get copyWith => _$RecepBookingListResponseCopyWithImpl<RecepBookingListResponse>(this as RecepBookingListResponse, _$identity);

  /// Serializes this RecepBookingListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecepBookingListResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.guestName, guestName) || other.guestName == guestName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.checkInDate, checkInDate) || other.checkInDate == checkInDate)&&(identical(other.checkOutDate, checkOutDate) || other.checkOutDate == checkOutDate)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,guestName,phoneNumber,checkInDate,checkOutDate,status);

@override
String toString() {
  return 'RecepBookingListResponse(id: $id, guestName: $guestName, phoneNumber: $phoneNumber, checkInDate: $checkInDate, checkOutDate: $checkOutDate, status: $status)';
}


}

/// @nodoc
abstract mixin class $RecepBookingListResponseCopyWith<$Res>  {
  factory $RecepBookingListResponseCopyWith(RecepBookingListResponse value, $Res Function(RecepBookingListResponse) _then) = _$RecepBookingListResponseCopyWithImpl;
@useResult
$Res call({
 String id, String guestName, String phoneNumber, String checkInDate, String checkOutDate, String status
});




}
/// @nodoc
class _$RecepBookingListResponseCopyWithImpl<$Res>
    implements $RecepBookingListResponseCopyWith<$Res> {
  _$RecepBookingListResponseCopyWithImpl(this._self, this._then);

  final RecepBookingListResponse _self;
  final $Res Function(RecepBookingListResponse) _then;

/// Create a copy of RecepBookingListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? guestName = null,Object? phoneNumber = null,Object? checkInDate = null,Object? checkOutDate = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,guestName: null == guestName ? _self.guestName : guestName // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,checkInDate: null == checkInDate ? _self.checkInDate : checkInDate // ignore: cast_nullable_to_non_nullable
as String,checkOutDate: null == checkOutDate ? _self.checkOutDate : checkOutDate // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RecepBookingListResponse].
extension RecepBookingListResponsePatterns on RecepBookingListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecepBookingListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecepBookingListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecepBookingListResponse value)  $default,){
final _that = this;
switch (_that) {
case _RecepBookingListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecepBookingListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RecepBookingListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String guestName,  String phoneNumber,  String checkInDate,  String checkOutDate,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecepBookingListResponse() when $default != null:
return $default(_that.id,_that.guestName,_that.phoneNumber,_that.checkInDate,_that.checkOutDate,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String guestName,  String phoneNumber,  String checkInDate,  String checkOutDate,  String status)  $default,) {final _that = this;
switch (_that) {
case _RecepBookingListResponse():
return $default(_that.id,_that.guestName,_that.phoneNumber,_that.checkInDate,_that.checkOutDate,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String guestName,  String phoneNumber,  String checkInDate,  String checkOutDate,  String status)?  $default,) {final _that = this;
switch (_that) {
case _RecepBookingListResponse() when $default != null:
return $default(_that.id,_that.guestName,_that.phoneNumber,_that.checkInDate,_that.checkOutDate,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecepBookingListResponse implements RecepBookingListResponse {
  const _RecepBookingListResponse({required this.id, required this.guestName, required this.phoneNumber, required this.checkInDate, required this.checkOutDate, required this.status});
  factory _RecepBookingListResponse.fromJson(Map<String, dynamic> json) => _$RecepBookingListResponseFromJson(json);

@override final  String id;
@override final  String guestName;
@override final  String phoneNumber;
@override final  String checkInDate;
@override final  String checkOutDate;
@override final  String status;

/// Create a copy of RecepBookingListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecepBookingListResponseCopyWith<_RecepBookingListResponse> get copyWith => __$RecepBookingListResponseCopyWithImpl<_RecepBookingListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecepBookingListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecepBookingListResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.guestName, guestName) || other.guestName == guestName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.checkInDate, checkInDate) || other.checkInDate == checkInDate)&&(identical(other.checkOutDate, checkOutDate) || other.checkOutDate == checkOutDate)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,guestName,phoneNumber,checkInDate,checkOutDate,status);

@override
String toString() {
  return 'RecepBookingListResponse(id: $id, guestName: $guestName, phoneNumber: $phoneNumber, checkInDate: $checkInDate, checkOutDate: $checkOutDate, status: $status)';
}


}

/// @nodoc
abstract mixin class _$RecepBookingListResponseCopyWith<$Res> implements $RecepBookingListResponseCopyWith<$Res> {
  factory _$RecepBookingListResponseCopyWith(_RecepBookingListResponse value, $Res Function(_RecepBookingListResponse) _then) = __$RecepBookingListResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, String guestName, String phoneNumber, String checkInDate, String checkOutDate, String status
});




}
/// @nodoc
class __$RecepBookingListResponseCopyWithImpl<$Res>
    implements _$RecepBookingListResponseCopyWith<$Res> {
  __$RecepBookingListResponseCopyWithImpl(this._self, this._then);

  final _RecepBookingListResponse _self;
  final $Res Function(_RecepBookingListResponse) _then;

/// Create a copy of RecepBookingListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? guestName = null,Object? phoneNumber = null,Object? checkInDate = null,Object? checkOutDate = null,Object? status = null,}) {
  return _then(_RecepBookingListResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,guestName: null == guestName ? _self.guestName : guestName // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,checkInDate: null == checkInDate ? _self.checkInDate : checkInDate // ignore: cast_nullable_to_non_nullable
as String,checkOutDate: null == checkOutDate ? _self.checkOutDate : checkOutDate // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
