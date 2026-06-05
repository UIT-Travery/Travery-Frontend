// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tour_itinerary_day_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TourItineraryDayImage {

 String? get id;@JsonKey(name: 'itinerary_day_id') String get itineraryDayId;@JsonKey(name: 'image_url') String get imageUrl; String? get caption;@JsonKey(name: 'display_order') int get displayOrder;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of TourItineraryDayImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TourItineraryDayImageCopyWith<TourItineraryDayImage> get copyWith => _$TourItineraryDayImageCopyWithImpl<TourItineraryDayImage>(this as TourItineraryDayImage, _$identity);

  /// Serializes this TourItineraryDayImage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TourItineraryDayImage&&(identical(other.id, id) || other.id == id)&&(identical(other.itineraryDayId, itineraryDayId) || other.itineraryDayId == itineraryDayId)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,itineraryDayId,imageUrl,caption,displayOrder,createdAt,updatedAt);

@override
String toString() {
  return 'TourItineraryDayImage(id: $id, itineraryDayId: $itineraryDayId, imageUrl: $imageUrl, caption: $caption, displayOrder: $displayOrder, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TourItineraryDayImageCopyWith<$Res>  {
  factory $TourItineraryDayImageCopyWith(TourItineraryDayImage value, $Res Function(TourItineraryDayImage) _then) = _$TourItineraryDayImageCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'itinerary_day_id') String itineraryDayId,@JsonKey(name: 'image_url') String imageUrl, String? caption,@JsonKey(name: 'display_order') int displayOrder,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$TourItineraryDayImageCopyWithImpl<$Res>
    implements $TourItineraryDayImageCopyWith<$Res> {
  _$TourItineraryDayImageCopyWithImpl(this._self, this._then);

  final TourItineraryDayImage _self;
  final $Res Function(TourItineraryDayImage) _then;

/// Create a copy of TourItineraryDayImage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? itineraryDayId = null,Object? imageUrl = null,Object? caption = freezed,Object? displayOrder = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,itineraryDayId: null == itineraryDayId ? _self.itineraryDayId : itineraryDayId // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TourItineraryDayImage].
extension TourItineraryDayImagePatterns on TourItineraryDayImage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TourItineraryDayImage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TourItineraryDayImage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TourItineraryDayImage value)  $default,){
final _that = this;
switch (_that) {
case _TourItineraryDayImage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TourItineraryDayImage value)?  $default,){
final _that = this;
switch (_that) {
case _TourItineraryDayImage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'itinerary_day_id')  String itineraryDayId, @JsonKey(name: 'image_url')  String imageUrl,  String? caption, @JsonKey(name: 'display_order')  int displayOrder, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TourItineraryDayImage() when $default != null:
return $default(_that.id,_that.itineraryDayId,_that.imageUrl,_that.caption,_that.displayOrder,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'itinerary_day_id')  String itineraryDayId, @JsonKey(name: 'image_url')  String imageUrl,  String? caption, @JsonKey(name: 'display_order')  int displayOrder, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TourItineraryDayImage():
return $default(_that.id,_that.itineraryDayId,_that.imageUrl,_that.caption,_that.displayOrder,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'itinerary_day_id')  String itineraryDayId, @JsonKey(name: 'image_url')  String imageUrl,  String? caption, @JsonKey(name: 'display_order')  int displayOrder, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TourItineraryDayImage() when $default != null:
return $default(_that.id,_that.itineraryDayId,_that.imageUrl,_that.caption,_that.displayOrder,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TourItineraryDayImage implements TourItineraryDayImage {
  const _TourItineraryDayImage({this.id, @JsonKey(name: 'itinerary_day_id') required this.itineraryDayId, @JsonKey(name: 'image_url') required this.imageUrl, this.caption, @JsonKey(name: 'display_order') required this.displayOrder, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _TourItineraryDayImage.fromJson(Map<String, dynamic> json) => _$TourItineraryDayImageFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'itinerary_day_id') final  String itineraryDayId;
@override@JsonKey(name: 'image_url') final  String imageUrl;
@override final  String? caption;
@override@JsonKey(name: 'display_order') final  int displayOrder;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of TourItineraryDayImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TourItineraryDayImageCopyWith<_TourItineraryDayImage> get copyWith => __$TourItineraryDayImageCopyWithImpl<_TourItineraryDayImage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TourItineraryDayImageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TourItineraryDayImage&&(identical(other.id, id) || other.id == id)&&(identical(other.itineraryDayId, itineraryDayId) || other.itineraryDayId == itineraryDayId)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,itineraryDayId,imageUrl,caption,displayOrder,createdAt,updatedAt);

@override
String toString() {
  return 'TourItineraryDayImage(id: $id, itineraryDayId: $itineraryDayId, imageUrl: $imageUrl, caption: $caption, displayOrder: $displayOrder, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TourItineraryDayImageCopyWith<$Res> implements $TourItineraryDayImageCopyWith<$Res> {
  factory _$TourItineraryDayImageCopyWith(_TourItineraryDayImage value, $Res Function(_TourItineraryDayImage) _then) = __$TourItineraryDayImageCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'itinerary_day_id') String itineraryDayId,@JsonKey(name: 'image_url') String imageUrl, String? caption,@JsonKey(name: 'display_order') int displayOrder,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$TourItineraryDayImageCopyWithImpl<$Res>
    implements _$TourItineraryDayImageCopyWith<$Res> {
  __$TourItineraryDayImageCopyWithImpl(this._self, this._then);

  final _TourItineraryDayImage _self;
  final $Res Function(_TourItineraryDayImage) _then;

/// Create a copy of TourItineraryDayImage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? itineraryDayId = null,Object? imageUrl = null,Object? caption = freezed,Object? displayOrder = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_TourItineraryDayImage(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,itineraryDayId: null == itineraryDayId ? _self.itineraryDayId : itineraryDayId // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
