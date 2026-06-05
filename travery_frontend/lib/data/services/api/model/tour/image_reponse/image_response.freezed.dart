// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ImageResponse {

 String get url; bool get isThumbnail;
/// Create a copy of ImageResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageResponseCopyWith<ImageResponse> get copyWith => _$ImageResponseCopyWithImpl<ImageResponse>(this as ImageResponse, _$identity);

  /// Serializes this ImageResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageResponse&&(identical(other.url, url) || other.url == url)&&(identical(other.isThumbnail, isThumbnail) || other.isThumbnail == isThumbnail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,isThumbnail);

@override
String toString() {
  return 'ImageResponse(url: $url, isThumbnail: $isThumbnail)';
}


}

/// @nodoc
abstract mixin class $ImageResponseCopyWith<$Res>  {
  factory $ImageResponseCopyWith(ImageResponse value, $Res Function(ImageResponse) _then) = _$ImageResponseCopyWithImpl;
@useResult
$Res call({
 String url, bool isThumbnail
});




}
/// @nodoc
class _$ImageResponseCopyWithImpl<$Res>
    implements $ImageResponseCopyWith<$Res> {
  _$ImageResponseCopyWithImpl(this._self, this._then);

  final ImageResponse _self;
  final $Res Function(ImageResponse) _then;

/// Create a copy of ImageResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,Object? isThumbnail = null,}) {
  return _then(_self.copyWith(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,isThumbnail: null == isThumbnail ? _self.isThumbnail : isThumbnail // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ImageResponse].
extension ImageResponsePatterns on ImageResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImageResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImageResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImageResponse value)  $default,){
final _that = this;
switch (_that) {
case _ImageResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImageResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ImageResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String url,  bool isThumbnail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImageResponse() when $default != null:
return $default(_that.url,_that.isThumbnail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String url,  bool isThumbnail)  $default,) {final _that = this;
switch (_that) {
case _ImageResponse():
return $default(_that.url,_that.isThumbnail);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String url,  bool isThumbnail)?  $default,) {final _that = this;
switch (_that) {
case _ImageResponse() when $default != null:
return $default(_that.url,_that.isThumbnail);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ImageResponse implements ImageResponse {
  const _ImageResponse({required this.url, this.isThumbnail = false});
  factory _ImageResponse.fromJson(Map<String, dynamic> json) => _$ImageResponseFromJson(json);

@override final  String url;
@override@JsonKey() final  bool isThumbnail;

/// Create a copy of ImageResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageResponseCopyWith<_ImageResponse> get copyWith => __$ImageResponseCopyWithImpl<_ImageResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImageResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageResponse&&(identical(other.url, url) || other.url == url)&&(identical(other.isThumbnail, isThumbnail) || other.isThumbnail == isThumbnail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,isThumbnail);

@override
String toString() {
  return 'ImageResponse(url: $url, isThumbnail: $isThumbnail)';
}


}

/// @nodoc
abstract mixin class _$ImageResponseCopyWith<$Res> implements $ImageResponseCopyWith<$Res> {
  factory _$ImageResponseCopyWith(_ImageResponse value, $Res Function(_ImageResponse) _then) = __$ImageResponseCopyWithImpl;
@override @useResult
$Res call({
 String url, bool isThumbnail
});




}
/// @nodoc
class __$ImageResponseCopyWithImpl<$Res>
    implements _$ImageResponseCopyWith<$Res> {
  __$ImageResponseCopyWithImpl(this._self, this._then);

  final _ImageResponse _self;
  final $Res Function(_ImageResponse) _then;

/// Create a copy of ImageResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,Object? isThumbnail = null,}) {
  return _then(_ImageResponse(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,isThumbnail: null == isThumbnail ? _self.isThumbnail : isThumbnail // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
