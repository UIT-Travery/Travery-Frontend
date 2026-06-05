// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tour_summary_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TourSummaryResponse {

 String get id; String get name; double get averageRating; double get price; String? get thumbnailUrl; String get destinationName; int get durationDays;
/// Create a copy of TourSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TourSummaryResponseCopyWith<TourSummaryResponse> get copyWith => _$TourSummaryResponseCopyWithImpl<TourSummaryResponse>(this as TourSummaryResponse, _$identity);

  /// Serializes this TourSummaryResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TourSummaryResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.price, price) || other.price == price)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.destinationName, destinationName) || other.destinationName == destinationName)&&(identical(other.durationDays, durationDays) || other.durationDays == durationDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,averageRating,price,thumbnailUrl,destinationName,durationDays);

@override
String toString() {
  return 'TourSummaryResponse(id: $id, name: $name, averageRating: $averageRating, price: $price, thumbnailUrl: $thumbnailUrl, destinationName: $destinationName, durationDays: $durationDays)';
}


}

/// @nodoc
abstract mixin class $TourSummaryResponseCopyWith<$Res>  {
  factory $TourSummaryResponseCopyWith(TourSummaryResponse value, $Res Function(TourSummaryResponse) _then) = _$TourSummaryResponseCopyWithImpl;
@useResult
$Res call({
 String id, String name, double averageRating, double price, String? thumbnailUrl, String destinationName, int durationDays
});




}
/// @nodoc
class _$TourSummaryResponseCopyWithImpl<$Res>
    implements $TourSummaryResponseCopyWith<$Res> {
  _$TourSummaryResponseCopyWithImpl(this._self, this._then);

  final TourSummaryResponse _self;
  final $Res Function(TourSummaryResponse) _then;

/// Create a copy of TourSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? averageRating = null,Object? price = null,Object? thumbnailUrl = freezed,Object? destinationName = null,Object? durationDays = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,destinationName: null == destinationName ? _self.destinationName : destinationName // ignore: cast_nullable_to_non_nullable
as String,durationDays: null == durationDays ? _self.durationDays : durationDays // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TourSummaryResponse].
extension TourSummaryResponsePatterns on TourSummaryResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TourSummaryResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TourSummaryResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TourSummaryResponse value)  $default,){
final _that = this;
switch (_that) {
case _TourSummaryResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TourSummaryResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TourSummaryResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  double averageRating,  double price,  String? thumbnailUrl,  String destinationName,  int durationDays)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TourSummaryResponse() when $default != null:
return $default(_that.id,_that.name,_that.averageRating,_that.price,_that.thumbnailUrl,_that.destinationName,_that.durationDays);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  double averageRating,  double price,  String? thumbnailUrl,  String destinationName,  int durationDays)  $default,) {final _that = this;
switch (_that) {
case _TourSummaryResponse():
return $default(_that.id,_that.name,_that.averageRating,_that.price,_that.thumbnailUrl,_that.destinationName,_that.durationDays);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  double averageRating,  double price,  String? thumbnailUrl,  String destinationName,  int durationDays)?  $default,) {final _that = this;
switch (_that) {
case _TourSummaryResponse() when $default != null:
return $default(_that.id,_that.name,_that.averageRating,_that.price,_that.thumbnailUrl,_that.destinationName,_that.durationDays);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TourSummaryResponse implements TourSummaryResponse {
  const _TourSummaryResponse({required this.id, required this.name, required this.averageRating, required this.price, this.thumbnailUrl, required this.destinationName, required this.durationDays});
  factory _TourSummaryResponse.fromJson(Map<String, dynamic> json) => _$TourSummaryResponseFromJson(json);

@override final  String id;
@override final  String name;
@override final  double averageRating;
@override final  double price;
@override final  String? thumbnailUrl;
@override final  String destinationName;
@override final  int durationDays;

/// Create a copy of TourSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TourSummaryResponseCopyWith<_TourSummaryResponse> get copyWith => __$TourSummaryResponseCopyWithImpl<_TourSummaryResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TourSummaryResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TourSummaryResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.price, price) || other.price == price)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.destinationName, destinationName) || other.destinationName == destinationName)&&(identical(other.durationDays, durationDays) || other.durationDays == durationDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,averageRating,price,thumbnailUrl,destinationName,durationDays);

@override
String toString() {
  return 'TourSummaryResponse(id: $id, name: $name, averageRating: $averageRating, price: $price, thumbnailUrl: $thumbnailUrl, destinationName: $destinationName, durationDays: $durationDays)';
}


}

/// @nodoc
abstract mixin class _$TourSummaryResponseCopyWith<$Res> implements $TourSummaryResponseCopyWith<$Res> {
  factory _$TourSummaryResponseCopyWith(_TourSummaryResponse value, $Res Function(_TourSummaryResponse) _then) = __$TourSummaryResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, double averageRating, double price, String? thumbnailUrl, String destinationName, int durationDays
});




}
/// @nodoc
class __$TourSummaryResponseCopyWithImpl<$Res>
    implements _$TourSummaryResponseCopyWith<$Res> {
  __$TourSummaryResponseCopyWithImpl(this._self, this._then);

  final _TourSummaryResponse _self;
  final $Res Function(_TourSummaryResponse) _then;

/// Create a copy of TourSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? averageRating = null,Object? price = null,Object? thumbnailUrl = freezed,Object? destinationName = null,Object? durationDays = null,}) {
  return _then(_TourSummaryResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,destinationName: null == destinationName ? _self.destinationName : destinationName // ignore: cast_nullable_to_non_nullable
as String,durationDays: null == durationDays ? _self.durationDays : durationDays // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
