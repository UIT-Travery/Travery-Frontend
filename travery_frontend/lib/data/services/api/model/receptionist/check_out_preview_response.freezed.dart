// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_out_preview_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckOutPreviewResponse {

 String get bookingId; num get roomCharges; num get addOnCharges; num get lateFees; num get totalBill; List<RecepAddOnOrderResponse> get unpaidAddOns;
/// Create a copy of CheckOutPreviewResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckOutPreviewResponseCopyWith<CheckOutPreviewResponse> get copyWith => _$CheckOutPreviewResponseCopyWithImpl<CheckOutPreviewResponse>(this as CheckOutPreviewResponse, _$identity);

  /// Serializes this CheckOutPreviewResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckOutPreviewResponse&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId)&&(identical(other.roomCharges, roomCharges) || other.roomCharges == roomCharges)&&(identical(other.addOnCharges, addOnCharges) || other.addOnCharges == addOnCharges)&&(identical(other.lateFees, lateFees) || other.lateFees == lateFees)&&(identical(other.totalBill, totalBill) || other.totalBill == totalBill)&&const DeepCollectionEquality().equals(other.unpaidAddOns, unpaidAddOns));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bookingId,roomCharges,addOnCharges,lateFees,totalBill,const DeepCollectionEquality().hash(unpaidAddOns));

@override
String toString() {
  return 'CheckOutPreviewResponse(bookingId: $bookingId, roomCharges: $roomCharges, addOnCharges: $addOnCharges, lateFees: $lateFees, totalBill: $totalBill, unpaidAddOns: $unpaidAddOns)';
}


}

/// @nodoc
abstract mixin class $CheckOutPreviewResponseCopyWith<$Res>  {
  factory $CheckOutPreviewResponseCopyWith(CheckOutPreviewResponse value, $Res Function(CheckOutPreviewResponse) _then) = _$CheckOutPreviewResponseCopyWithImpl;
@useResult
$Res call({
 String bookingId, num roomCharges, num addOnCharges, num lateFees, num totalBill, List<RecepAddOnOrderResponse> unpaidAddOns
});




}
/// @nodoc
class _$CheckOutPreviewResponseCopyWithImpl<$Res>
    implements $CheckOutPreviewResponseCopyWith<$Res> {
  _$CheckOutPreviewResponseCopyWithImpl(this._self, this._then);

  final CheckOutPreviewResponse _self;
  final $Res Function(CheckOutPreviewResponse) _then;

/// Create a copy of CheckOutPreviewResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bookingId = null,Object? roomCharges = null,Object? addOnCharges = null,Object? lateFees = null,Object? totalBill = null,Object? unpaidAddOns = null,}) {
  return _then(_self.copyWith(
bookingId: null == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as String,roomCharges: null == roomCharges ? _self.roomCharges : roomCharges // ignore: cast_nullable_to_non_nullable
as num,addOnCharges: null == addOnCharges ? _self.addOnCharges : addOnCharges // ignore: cast_nullable_to_non_nullable
as num,lateFees: null == lateFees ? _self.lateFees : lateFees // ignore: cast_nullable_to_non_nullable
as num,totalBill: null == totalBill ? _self.totalBill : totalBill // ignore: cast_nullable_to_non_nullable
as num,unpaidAddOns: null == unpaidAddOns ? _self.unpaidAddOns : unpaidAddOns // ignore: cast_nullable_to_non_nullable
as List<RecepAddOnOrderResponse>,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckOutPreviewResponse].
extension CheckOutPreviewResponsePatterns on CheckOutPreviewResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckOutPreviewResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckOutPreviewResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckOutPreviewResponse value)  $default,){
final _that = this;
switch (_that) {
case _CheckOutPreviewResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckOutPreviewResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CheckOutPreviewResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String bookingId,  num roomCharges,  num addOnCharges,  num lateFees,  num totalBill,  List<RecepAddOnOrderResponse> unpaidAddOns)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckOutPreviewResponse() when $default != null:
return $default(_that.bookingId,_that.roomCharges,_that.addOnCharges,_that.lateFees,_that.totalBill,_that.unpaidAddOns);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String bookingId,  num roomCharges,  num addOnCharges,  num lateFees,  num totalBill,  List<RecepAddOnOrderResponse> unpaidAddOns)  $default,) {final _that = this;
switch (_that) {
case _CheckOutPreviewResponse():
return $default(_that.bookingId,_that.roomCharges,_that.addOnCharges,_that.lateFees,_that.totalBill,_that.unpaidAddOns);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String bookingId,  num roomCharges,  num addOnCharges,  num lateFees,  num totalBill,  List<RecepAddOnOrderResponse> unpaidAddOns)?  $default,) {final _that = this;
switch (_that) {
case _CheckOutPreviewResponse() when $default != null:
return $default(_that.bookingId,_that.roomCharges,_that.addOnCharges,_that.lateFees,_that.totalBill,_that.unpaidAddOns);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckOutPreviewResponse implements CheckOutPreviewResponse {
  const _CheckOutPreviewResponse({required this.bookingId, required this.roomCharges, required this.addOnCharges, required this.lateFees, required this.totalBill, required final  List<RecepAddOnOrderResponse> unpaidAddOns}): _unpaidAddOns = unpaidAddOns;
  factory _CheckOutPreviewResponse.fromJson(Map<String, dynamic> json) => _$CheckOutPreviewResponseFromJson(json);

@override final  String bookingId;
@override final  num roomCharges;
@override final  num addOnCharges;
@override final  num lateFees;
@override final  num totalBill;
 final  List<RecepAddOnOrderResponse> _unpaidAddOns;
@override List<RecepAddOnOrderResponse> get unpaidAddOns {
  if (_unpaidAddOns is EqualUnmodifiableListView) return _unpaidAddOns;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_unpaidAddOns);
}


/// Create a copy of CheckOutPreviewResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckOutPreviewResponseCopyWith<_CheckOutPreviewResponse> get copyWith => __$CheckOutPreviewResponseCopyWithImpl<_CheckOutPreviewResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckOutPreviewResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckOutPreviewResponse&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId)&&(identical(other.roomCharges, roomCharges) || other.roomCharges == roomCharges)&&(identical(other.addOnCharges, addOnCharges) || other.addOnCharges == addOnCharges)&&(identical(other.lateFees, lateFees) || other.lateFees == lateFees)&&(identical(other.totalBill, totalBill) || other.totalBill == totalBill)&&const DeepCollectionEquality().equals(other._unpaidAddOns, _unpaidAddOns));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bookingId,roomCharges,addOnCharges,lateFees,totalBill,const DeepCollectionEquality().hash(_unpaidAddOns));

@override
String toString() {
  return 'CheckOutPreviewResponse(bookingId: $bookingId, roomCharges: $roomCharges, addOnCharges: $addOnCharges, lateFees: $lateFees, totalBill: $totalBill, unpaidAddOns: $unpaidAddOns)';
}


}

/// @nodoc
abstract mixin class _$CheckOutPreviewResponseCopyWith<$Res> implements $CheckOutPreviewResponseCopyWith<$Res> {
  factory _$CheckOutPreviewResponseCopyWith(_CheckOutPreviewResponse value, $Res Function(_CheckOutPreviewResponse) _then) = __$CheckOutPreviewResponseCopyWithImpl;
@override @useResult
$Res call({
 String bookingId, num roomCharges, num addOnCharges, num lateFees, num totalBill, List<RecepAddOnOrderResponse> unpaidAddOns
});




}
/// @nodoc
class __$CheckOutPreviewResponseCopyWithImpl<$Res>
    implements _$CheckOutPreviewResponseCopyWith<$Res> {
  __$CheckOutPreviewResponseCopyWithImpl(this._self, this._then);

  final _CheckOutPreviewResponse _self;
  final $Res Function(_CheckOutPreviewResponse) _then;

/// Create a copy of CheckOutPreviewResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bookingId = null,Object? roomCharges = null,Object? addOnCharges = null,Object? lateFees = null,Object? totalBill = null,Object? unpaidAddOns = null,}) {
  return _then(_CheckOutPreviewResponse(
bookingId: null == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as String,roomCharges: null == roomCharges ? _self.roomCharges : roomCharges // ignore: cast_nullable_to_non_nullable
as num,addOnCharges: null == addOnCharges ? _self.addOnCharges : addOnCharges // ignore: cast_nullable_to_non_nullable
as num,lateFees: null == lateFees ? _self.lateFees : lateFees // ignore: cast_nullable_to_non_nullable
as num,totalBill: null == totalBill ? _self.totalBill : totalBill // ignore: cast_nullable_to_non_nullable
as num,unpaidAddOns: null == unpaidAddOns ? _self._unpaidAddOns : unpaidAddOns // ignore: cast_nullable_to_non_nullable
as List<RecepAddOnOrderResponse>,
  ));
}


}

// dart format on
