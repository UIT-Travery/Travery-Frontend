// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tour_itinerary_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TourItineraryResponse {

 int get dayNumber; String get title; String get description; List<ImageResponse> get images;
/// Create a copy of TourItineraryResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TourItineraryResponseCopyWith<TourItineraryResponse> get copyWith => _$TourItineraryResponseCopyWithImpl<TourItineraryResponse>(this as TourItineraryResponse, _$identity);

  /// Serializes this TourItineraryResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TourItineraryResponse&&(identical(other.dayNumber, dayNumber) || other.dayNumber == dayNumber)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.images, images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dayNumber,title,description,const DeepCollectionEquality().hash(images));

@override
String toString() {
  return 'TourItineraryResponse(dayNumber: $dayNumber, title: $title, description: $description, images: $images)';
}


}

/// @nodoc
abstract mixin class $TourItineraryResponseCopyWith<$Res>  {
  factory $TourItineraryResponseCopyWith(TourItineraryResponse value, $Res Function(TourItineraryResponse) _then) = _$TourItineraryResponseCopyWithImpl;
@useResult
$Res call({
 int dayNumber, String title, String description, List<ImageResponse> images
});




}
/// @nodoc
class _$TourItineraryResponseCopyWithImpl<$Res>
    implements $TourItineraryResponseCopyWith<$Res> {
  _$TourItineraryResponseCopyWithImpl(this._self, this._then);

  final TourItineraryResponse _self;
  final $Res Function(TourItineraryResponse) _then;

/// Create a copy of TourItineraryResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dayNumber = null,Object? title = null,Object? description = null,Object? images = null,}) {
  return _then(_self.copyWith(
dayNumber: null == dayNumber ? _self.dayNumber : dayNumber // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<ImageResponse>,
  ));
}

}


/// Adds pattern-matching-related methods to [TourItineraryResponse].
extension TourItineraryResponsePatterns on TourItineraryResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TourItineraryResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TourItineraryResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TourItineraryResponse value)  $default,){
final _that = this;
switch (_that) {
case _TourItineraryResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TourItineraryResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TourItineraryResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int dayNumber,  String title,  String description,  List<ImageResponse> images)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TourItineraryResponse() when $default != null:
return $default(_that.dayNumber,_that.title,_that.description,_that.images);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int dayNumber,  String title,  String description,  List<ImageResponse> images)  $default,) {final _that = this;
switch (_that) {
case _TourItineraryResponse():
return $default(_that.dayNumber,_that.title,_that.description,_that.images);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int dayNumber,  String title,  String description,  List<ImageResponse> images)?  $default,) {final _that = this;
switch (_that) {
case _TourItineraryResponse() when $default != null:
return $default(_that.dayNumber,_that.title,_that.description,_that.images);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TourItineraryResponse implements TourItineraryResponse {
  const _TourItineraryResponse({required this.dayNumber, required this.title, required this.description, final  List<ImageResponse> images = const []}): _images = images;
  factory _TourItineraryResponse.fromJson(Map<String, dynamic> json) => _$TourItineraryResponseFromJson(json);

@override final  int dayNumber;
@override final  String title;
@override final  String description;
 final  List<ImageResponse> _images;
@override@JsonKey() List<ImageResponse> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}


/// Create a copy of TourItineraryResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TourItineraryResponseCopyWith<_TourItineraryResponse> get copyWith => __$TourItineraryResponseCopyWithImpl<_TourItineraryResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TourItineraryResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TourItineraryResponse&&(identical(other.dayNumber, dayNumber) || other.dayNumber == dayNumber)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._images, _images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dayNumber,title,description,const DeepCollectionEquality().hash(_images));

@override
String toString() {
  return 'TourItineraryResponse(dayNumber: $dayNumber, title: $title, description: $description, images: $images)';
}


}

/// @nodoc
abstract mixin class _$TourItineraryResponseCopyWith<$Res> implements $TourItineraryResponseCopyWith<$Res> {
  factory _$TourItineraryResponseCopyWith(_TourItineraryResponse value, $Res Function(_TourItineraryResponse) _then) = __$TourItineraryResponseCopyWithImpl;
@override @useResult
$Res call({
 int dayNumber, String title, String description, List<ImageResponse> images
});




}
/// @nodoc
class __$TourItineraryResponseCopyWithImpl<$Res>
    implements _$TourItineraryResponseCopyWith<$Res> {
  __$TourItineraryResponseCopyWithImpl(this._self, this._then);

  final _TourItineraryResponse _self;
  final $Res Function(_TourItineraryResponse) _then;

/// Create a copy of TourItineraryResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dayNumber = null,Object? title = null,Object? description = null,Object? images = null,}) {
  return _then(_TourItineraryResponse(
dayNumber: null == dayNumber ? _self.dayNumber : dayNumber // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<ImageResponse>,
  ));
}


}

// dart format on
