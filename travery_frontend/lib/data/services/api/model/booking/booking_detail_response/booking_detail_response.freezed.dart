// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_detail_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookingDetailResponse {

 TourBookingData get data;
/// Create a copy of BookingDetailResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingDetailResponseCopyWith<BookingDetailResponse> get copyWith => _$BookingDetailResponseCopyWithImpl<BookingDetailResponse>(this as BookingDetailResponse, _$identity);

  /// Serializes this BookingDetailResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingDetailResponse&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'BookingDetailResponse(data: $data)';
}


}

/// @nodoc
abstract mixin class $BookingDetailResponseCopyWith<$Res>  {
  factory $BookingDetailResponseCopyWith(BookingDetailResponse value, $Res Function(BookingDetailResponse) _then) = _$BookingDetailResponseCopyWithImpl;
@useResult
$Res call({
 TourBookingData data
});


$TourBookingDataCopyWith<$Res> get data;

}
/// @nodoc
class _$BookingDetailResponseCopyWithImpl<$Res>
    implements $BookingDetailResponseCopyWith<$Res> {
  _$BookingDetailResponseCopyWithImpl(this._self, this._then);

  final BookingDetailResponse _self;
  final $Res Function(BookingDetailResponse) _then;

/// Create a copy of BookingDetailResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as TourBookingData,
  ));
}
/// Create a copy of BookingDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TourBookingDataCopyWith<$Res> get data {
  
  return $TourBookingDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [BookingDetailResponse].
extension BookingDetailResponsePatterns on BookingDetailResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingDetailResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingDetailResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingDetailResponse value)  $default,){
final _that = this;
switch (_that) {
case _BookingDetailResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingDetailResponse value)?  $default,){
final _that = this;
switch (_that) {
case _BookingDetailResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TourBookingData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingDetailResponse() when $default != null:
return $default(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TourBookingData data)  $default,) {final _that = this;
switch (_that) {
case _BookingDetailResponse():
return $default(_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TourBookingData data)?  $default,) {final _that = this;
switch (_that) {
case _BookingDetailResponse() when $default != null:
return $default(_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookingDetailResponse implements BookingDetailResponse {
  const _BookingDetailResponse({required this.data});
  factory _BookingDetailResponse.fromJson(Map<String, dynamic> json) => _$BookingDetailResponseFromJson(json);

@override final  TourBookingData data;

/// Create a copy of BookingDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingDetailResponseCopyWith<_BookingDetailResponse> get copyWith => __$BookingDetailResponseCopyWithImpl<_BookingDetailResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingDetailResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingDetailResponse&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'BookingDetailResponse(data: $data)';
}


}

/// @nodoc
abstract mixin class _$BookingDetailResponseCopyWith<$Res> implements $BookingDetailResponseCopyWith<$Res> {
  factory _$BookingDetailResponseCopyWith(_BookingDetailResponse value, $Res Function(_BookingDetailResponse) _then) = __$BookingDetailResponseCopyWithImpl;
@override @useResult
$Res call({
 TourBookingData data
});


@override $TourBookingDataCopyWith<$Res> get data;

}
/// @nodoc
class __$BookingDetailResponseCopyWithImpl<$Res>
    implements _$BookingDetailResponseCopyWith<$Res> {
  __$BookingDetailResponseCopyWithImpl(this._self, this._then);

  final _BookingDetailResponse _self;
  final $Res Function(_BookingDetailResponse) _then;

/// Create a copy of BookingDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_BookingDetailResponse(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as TourBookingData,
  ));
}

/// Create a copy of BookingDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TourBookingDataCopyWith<$Res> get data {
  
  return $TourBookingDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
