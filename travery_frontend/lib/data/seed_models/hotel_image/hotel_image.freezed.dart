// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hotel_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HotelImage {

 String? get id;@JsonKey(name: 'hotel_id') String get hotelId;@JsonKey(name: 'image_url') String get imageUrl;@JsonKey(name: 'display_order') int get displayOrder;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of HotelImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HotelImageCopyWith<HotelImage> get copyWith => _$HotelImageCopyWithImpl<HotelImage>(this as HotelImage, _$identity);

  /// Serializes this HotelImage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HotelImage&&(identical(other.id, id) || other.id == id)&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,hotelId,imageUrl,displayOrder,createdAt,updatedAt);

@override
String toString() {
  return 'HotelImage(id: $id, hotelId: $hotelId, imageUrl: $imageUrl, displayOrder: $displayOrder, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $HotelImageCopyWith<$Res>  {
  factory $HotelImageCopyWith(HotelImage value, $Res Function(HotelImage) _then) = _$HotelImageCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'hotel_id') String hotelId,@JsonKey(name: 'image_url') String imageUrl,@JsonKey(name: 'display_order') int displayOrder,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$HotelImageCopyWithImpl<$Res>
    implements $HotelImageCopyWith<$Res> {
  _$HotelImageCopyWithImpl(this._self, this._then);

  final HotelImage _self;
  final $Res Function(HotelImage) _then;

/// Create a copy of HotelImage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? hotelId = null,Object? imageUrl = null,Object? displayOrder = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,hotelId: null == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [HotelImage].
extension HotelImagePatterns on HotelImage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HotelImage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HotelImage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HotelImage value)  $default,){
final _that = this;
switch (_that) {
case _HotelImage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HotelImage value)?  $default,){
final _that = this;
switch (_that) {
case _HotelImage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'hotel_id')  String hotelId, @JsonKey(name: 'image_url')  String imageUrl, @JsonKey(name: 'display_order')  int displayOrder, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HotelImage() when $default != null:
return $default(_that.id,_that.hotelId,_that.imageUrl,_that.displayOrder,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'hotel_id')  String hotelId, @JsonKey(name: 'image_url')  String imageUrl, @JsonKey(name: 'display_order')  int displayOrder, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _HotelImage():
return $default(_that.id,_that.hotelId,_that.imageUrl,_that.displayOrder,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'hotel_id')  String hotelId, @JsonKey(name: 'image_url')  String imageUrl, @JsonKey(name: 'display_order')  int displayOrder, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _HotelImage() when $default != null:
return $default(_that.id,_that.hotelId,_that.imageUrl,_that.displayOrder,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HotelImage implements HotelImage {
  const _HotelImage({this.id, @JsonKey(name: 'hotel_id') required this.hotelId, @JsonKey(name: 'image_url') required this.imageUrl, @JsonKey(name: 'display_order') required this.displayOrder, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _HotelImage.fromJson(Map<String, dynamic> json) => _$HotelImageFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'hotel_id') final  String hotelId;
@override@JsonKey(name: 'image_url') final  String imageUrl;
@override@JsonKey(name: 'display_order') final  int displayOrder;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of HotelImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HotelImageCopyWith<_HotelImage> get copyWith => __$HotelImageCopyWithImpl<_HotelImage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HotelImageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HotelImage&&(identical(other.id, id) || other.id == id)&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,hotelId,imageUrl,displayOrder,createdAt,updatedAt);

@override
String toString() {
  return 'HotelImage(id: $id, hotelId: $hotelId, imageUrl: $imageUrl, displayOrder: $displayOrder, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$HotelImageCopyWith<$Res> implements $HotelImageCopyWith<$Res> {
  factory _$HotelImageCopyWith(_HotelImage value, $Res Function(_HotelImage) _then) = __$HotelImageCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'hotel_id') String hotelId,@JsonKey(name: 'image_url') String imageUrl,@JsonKey(name: 'display_order') int displayOrder,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$HotelImageCopyWithImpl<$Res>
    implements _$HotelImageCopyWith<$Res> {
  __$HotelImageCopyWithImpl(this._self, this._then);

  final _HotelImage _self;
  final $Res Function(_HotelImage) _then;

/// Create a copy of HotelImage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? hotelId = null,Object? imageUrl = null,Object? displayOrder = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_HotelImage(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,hotelId: null == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
