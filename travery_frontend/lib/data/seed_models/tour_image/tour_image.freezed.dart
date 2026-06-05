// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tour_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TourImage {

 String? get id;@JsonKey(name: 'url') String get imageUrl;@JsonKey(name: 'isThumnail') bool get isThumbnail; int get displayOrder;
/// Create a copy of TourImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TourImageCopyWith<TourImage> get copyWith => _$TourImageCopyWithImpl<TourImage>(this as TourImage, _$identity);

  /// Serializes this TourImage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TourImage&&(identical(other.id, id) || other.id == id)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.isThumbnail, isThumbnail) || other.isThumbnail == isThumbnail)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,imageUrl,isThumbnail,displayOrder);

@override
String toString() {
  return 'TourImage(id: $id, imageUrl: $imageUrl, isThumbnail: $isThumbnail, displayOrder: $displayOrder)';
}


}

/// @nodoc
abstract mixin class $TourImageCopyWith<$Res>  {
  factory $TourImageCopyWith(TourImage value, $Res Function(TourImage) _then) = _$TourImageCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'url') String imageUrl,@JsonKey(name: 'isThumnail') bool isThumbnail, int displayOrder
});




}
/// @nodoc
class _$TourImageCopyWithImpl<$Res>
    implements $TourImageCopyWith<$Res> {
  _$TourImageCopyWithImpl(this._self, this._then);

  final TourImage _self;
  final $Res Function(TourImage) _then;

/// Create a copy of TourImage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? imageUrl = null,Object? isThumbnail = null,Object? displayOrder = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,isThumbnail: null == isThumbnail ? _self.isThumbnail : isThumbnail // ignore: cast_nullable_to_non_nullable
as bool,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TourImage].
extension TourImagePatterns on TourImage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TourImage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TourImage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TourImage value)  $default,){
final _that = this;
switch (_that) {
case _TourImage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TourImage value)?  $default,){
final _that = this;
switch (_that) {
case _TourImage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'url')  String imageUrl, @JsonKey(name: 'isThumnail')  bool isThumbnail,  int displayOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TourImage() when $default != null:
return $default(_that.id,_that.imageUrl,_that.isThumbnail,_that.displayOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'url')  String imageUrl, @JsonKey(name: 'isThumnail')  bool isThumbnail,  int displayOrder)  $default,) {final _that = this;
switch (_that) {
case _TourImage():
return $default(_that.id,_that.imageUrl,_that.isThumbnail,_that.displayOrder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'url')  String imageUrl, @JsonKey(name: 'isThumnail')  bool isThumbnail,  int displayOrder)?  $default,) {final _that = this;
switch (_that) {
case _TourImage() when $default != null:
return $default(_that.id,_that.imageUrl,_that.isThumbnail,_that.displayOrder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TourImage implements TourImage {
  const _TourImage({this.id, @JsonKey(name: 'url') required this.imageUrl, @JsonKey(name: 'isThumnail') this.isThumbnail = false, this.displayOrder = 0});
  factory _TourImage.fromJson(Map<String, dynamic> json) => _$TourImageFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'url') final  String imageUrl;
@override@JsonKey(name: 'isThumnail') final  bool isThumbnail;
@override@JsonKey() final  int displayOrder;

/// Create a copy of TourImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TourImageCopyWith<_TourImage> get copyWith => __$TourImageCopyWithImpl<_TourImage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TourImageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TourImage&&(identical(other.id, id) || other.id == id)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.isThumbnail, isThumbnail) || other.isThumbnail == isThumbnail)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,imageUrl,isThumbnail,displayOrder);

@override
String toString() {
  return 'TourImage(id: $id, imageUrl: $imageUrl, isThumbnail: $isThumbnail, displayOrder: $displayOrder)';
}


}

/// @nodoc
abstract mixin class _$TourImageCopyWith<$Res> implements $TourImageCopyWith<$Res> {
  factory _$TourImageCopyWith(_TourImage value, $Res Function(_TourImage) _then) = __$TourImageCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'url') String imageUrl,@JsonKey(name: 'isThumnail') bool isThumbnail, int displayOrder
});




}
/// @nodoc
class __$TourImageCopyWithImpl<$Res>
    implements _$TourImageCopyWith<$Res> {
  __$TourImageCopyWithImpl(this._self, this._then);

  final _TourImage _self;
  final $Res Function(_TourImage) _then;

/// Create a copy of TourImage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? imageUrl = null,Object? isThumbnail = null,Object? displayOrder = null,}) {
  return _then(_TourImage(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,isThumbnail: null == isThumbnail ? _self.isThumbnail : isThumbnail // ignore: cast_nullable_to_non_nullable
as bool,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
