// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tour_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TourResponse {

 String get id; String get name; String get description; String get destinationName; String get hotelName; String get pickupLocation; double get pricePerAdult; double get pricePerChild; bool get custom;
/// Create a copy of TourResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TourResponseCopyWith<TourResponse> get copyWith => _$TourResponseCopyWithImpl<TourResponse>(this as TourResponse, _$identity);

  /// Serializes this TourResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TourResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.destinationName, destinationName) || other.destinationName == destinationName)&&(identical(other.hotelName, hotelName) || other.hotelName == hotelName)&&(identical(other.pickupLocation, pickupLocation) || other.pickupLocation == pickupLocation)&&(identical(other.pricePerAdult, pricePerAdult) || other.pricePerAdult == pricePerAdult)&&(identical(other.pricePerChild, pricePerChild) || other.pricePerChild == pricePerChild)&&(identical(other.custom, custom) || other.custom == custom));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,destinationName,hotelName,pickupLocation,pricePerAdult,pricePerChild,custom);

@override
String toString() {
  return 'TourResponse(id: $id, name: $name, description: $description, destinationName: $destinationName, hotelName: $hotelName, pickupLocation: $pickupLocation, pricePerAdult: $pricePerAdult, pricePerChild: $pricePerChild, custom: $custom)';
}


}

/// @nodoc
abstract mixin class $TourResponseCopyWith<$Res>  {
  factory $TourResponseCopyWith(TourResponse value, $Res Function(TourResponse) _then) = _$TourResponseCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, String destinationName, String hotelName, String pickupLocation, double pricePerAdult, double pricePerChild, bool custom
});




}
/// @nodoc
class _$TourResponseCopyWithImpl<$Res>
    implements $TourResponseCopyWith<$Res> {
  _$TourResponseCopyWithImpl(this._self, this._then);

  final TourResponse _self;
  final $Res Function(TourResponse) _then;

/// Create a copy of TourResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? destinationName = null,Object? hotelName = null,Object? pickupLocation = null,Object? pricePerAdult = null,Object? pricePerChild = null,Object? custom = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,destinationName: null == destinationName ? _self.destinationName : destinationName // ignore: cast_nullable_to_non_nullable
as String,hotelName: null == hotelName ? _self.hotelName : hotelName // ignore: cast_nullable_to_non_nullable
as String,pickupLocation: null == pickupLocation ? _self.pickupLocation : pickupLocation // ignore: cast_nullable_to_non_nullable
as String,pricePerAdult: null == pricePerAdult ? _self.pricePerAdult : pricePerAdult // ignore: cast_nullable_to_non_nullable
as double,pricePerChild: null == pricePerChild ? _self.pricePerChild : pricePerChild // ignore: cast_nullable_to_non_nullable
as double,custom: null == custom ? _self.custom : custom // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TourResponse].
extension TourResponsePatterns on TourResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TourResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TourResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TourResponse value)  $default,){
final _that = this;
switch (_that) {
case _TourResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TourResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TourResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String destinationName,  String hotelName,  String pickupLocation,  double pricePerAdult,  double pricePerChild,  bool custom)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TourResponse() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.destinationName,_that.hotelName,_that.pickupLocation,_that.pricePerAdult,_that.pricePerChild,_that.custom);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String destinationName,  String hotelName,  String pickupLocation,  double pricePerAdult,  double pricePerChild,  bool custom)  $default,) {final _that = this;
switch (_that) {
case _TourResponse():
return $default(_that.id,_that.name,_that.description,_that.destinationName,_that.hotelName,_that.pickupLocation,_that.pricePerAdult,_that.pricePerChild,_that.custom);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  String destinationName,  String hotelName,  String pickupLocation,  double pricePerAdult,  double pricePerChild,  bool custom)?  $default,) {final _that = this;
switch (_that) {
case _TourResponse() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.destinationName,_that.hotelName,_that.pickupLocation,_that.pricePerAdult,_that.pricePerChild,_that.custom);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TourResponse implements TourResponse {
  const _TourResponse({required this.id, required this.name, this.description = '', this.destinationName = '', this.hotelName = '', this.pickupLocation = '', this.pricePerAdult = 0.0, this.pricePerChild = 0.0, this.custom = false});
  factory _TourResponse.fromJson(Map<String, dynamic> json) => _$TourResponseFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey() final  String description;
@override@JsonKey() final  String destinationName;
@override@JsonKey() final  String hotelName;
@override@JsonKey() final  String pickupLocation;
@override@JsonKey() final  double pricePerAdult;
@override@JsonKey() final  double pricePerChild;
@override@JsonKey() final  bool custom;

/// Create a copy of TourResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TourResponseCopyWith<_TourResponse> get copyWith => __$TourResponseCopyWithImpl<_TourResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TourResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TourResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.destinationName, destinationName) || other.destinationName == destinationName)&&(identical(other.hotelName, hotelName) || other.hotelName == hotelName)&&(identical(other.pickupLocation, pickupLocation) || other.pickupLocation == pickupLocation)&&(identical(other.pricePerAdult, pricePerAdult) || other.pricePerAdult == pricePerAdult)&&(identical(other.pricePerChild, pricePerChild) || other.pricePerChild == pricePerChild)&&(identical(other.custom, custom) || other.custom == custom));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,destinationName,hotelName,pickupLocation,pricePerAdult,pricePerChild,custom);

@override
String toString() {
  return 'TourResponse(id: $id, name: $name, description: $description, destinationName: $destinationName, hotelName: $hotelName, pickupLocation: $pickupLocation, pricePerAdult: $pricePerAdult, pricePerChild: $pricePerChild, custom: $custom)';
}


}

/// @nodoc
abstract mixin class _$TourResponseCopyWith<$Res> implements $TourResponseCopyWith<$Res> {
  factory _$TourResponseCopyWith(_TourResponse value, $Res Function(_TourResponse) _then) = __$TourResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, String destinationName, String hotelName, String pickupLocation, double pricePerAdult, double pricePerChild, bool custom
});




}
/// @nodoc
class __$TourResponseCopyWithImpl<$Res>
    implements _$TourResponseCopyWith<$Res> {
  __$TourResponseCopyWithImpl(this._self, this._then);

  final _TourResponse _self;
  final $Res Function(_TourResponse) _then;

/// Create a copy of TourResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? destinationName = null,Object? hotelName = null,Object? pickupLocation = null,Object? pricePerAdult = null,Object? pricePerChild = null,Object? custom = null,}) {
  return _then(_TourResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,destinationName: null == destinationName ? _self.destinationName : destinationName // ignore: cast_nullable_to_non_nullable
as String,hotelName: null == hotelName ? _self.hotelName : hotelName // ignore: cast_nullable_to_non_nullable
as String,pickupLocation: null == pickupLocation ? _self.pickupLocation : pickupLocation // ignore: cast_nullable_to_non_nullable
as String,pricePerAdult: null == pricePerAdult ? _self.pricePerAdult : pricePerAdult // ignore: cast_nullable_to_non_nullable
as double,pricePerChild: null == pricePerChild ? _self.pricePerChild : pricePerChild // ignore: cast_nullable_to_non_nullable
as double,custom: null == custom ? _self.custom : custom // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
