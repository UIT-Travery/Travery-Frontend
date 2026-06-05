// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_type_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoomTypeImage {

 String? get id;@JsonKey(name: 'room_type_id') String get roomTypeId;@JsonKey(name: 'image_url') String get imageUrl;@JsonKey(name: 'display_order') int get displayOrder;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of RoomTypeImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoomTypeImageCopyWith<RoomTypeImage> get copyWith => _$RoomTypeImageCopyWithImpl<RoomTypeImage>(this as RoomTypeImage, _$identity);

  /// Serializes this RoomTypeImage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoomTypeImage&&(identical(other.id, id) || other.id == id)&&(identical(other.roomTypeId, roomTypeId) || other.roomTypeId == roomTypeId)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,roomTypeId,imageUrl,displayOrder,createdAt,updatedAt);

@override
String toString() {
  return 'RoomTypeImage(id: $id, roomTypeId: $roomTypeId, imageUrl: $imageUrl, displayOrder: $displayOrder, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $RoomTypeImageCopyWith<$Res>  {
  factory $RoomTypeImageCopyWith(RoomTypeImage value, $Res Function(RoomTypeImage) _then) = _$RoomTypeImageCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'room_type_id') String roomTypeId,@JsonKey(name: 'image_url') String imageUrl,@JsonKey(name: 'display_order') int displayOrder,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$RoomTypeImageCopyWithImpl<$Res>
    implements $RoomTypeImageCopyWith<$Res> {
  _$RoomTypeImageCopyWithImpl(this._self, this._then);

  final RoomTypeImage _self;
  final $Res Function(RoomTypeImage) _then;

/// Create a copy of RoomTypeImage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? roomTypeId = null,Object? imageUrl = null,Object? displayOrder = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,roomTypeId: null == roomTypeId ? _self.roomTypeId : roomTypeId // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [RoomTypeImage].
extension RoomTypeImagePatterns on RoomTypeImage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoomTypeImage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoomTypeImage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoomTypeImage value)  $default,){
final _that = this;
switch (_that) {
case _RoomTypeImage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoomTypeImage value)?  $default,){
final _that = this;
switch (_that) {
case _RoomTypeImage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'room_type_id')  String roomTypeId, @JsonKey(name: 'image_url')  String imageUrl, @JsonKey(name: 'display_order')  int displayOrder, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoomTypeImage() when $default != null:
return $default(_that.id,_that.roomTypeId,_that.imageUrl,_that.displayOrder,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'room_type_id')  String roomTypeId, @JsonKey(name: 'image_url')  String imageUrl, @JsonKey(name: 'display_order')  int displayOrder, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _RoomTypeImage():
return $default(_that.id,_that.roomTypeId,_that.imageUrl,_that.displayOrder,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'room_type_id')  String roomTypeId, @JsonKey(name: 'image_url')  String imageUrl, @JsonKey(name: 'display_order')  int displayOrder, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _RoomTypeImage() when $default != null:
return $default(_that.id,_that.roomTypeId,_that.imageUrl,_that.displayOrder,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoomTypeImage implements RoomTypeImage {
  const _RoomTypeImage({this.id, @JsonKey(name: 'room_type_id') required this.roomTypeId, @JsonKey(name: 'image_url') required this.imageUrl, @JsonKey(name: 'display_order') required this.displayOrder, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _RoomTypeImage.fromJson(Map<String, dynamic> json) => _$RoomTypeImageFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'room_type_id') final  String roomTypeId;
@override@JsonKey(name: 'image_url') final  String imageUrl;
@override@JsonKey(name: 'display_order') final  int displayOrder;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of RoomTypeImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoomTypeImageCopyWith<_RoomTypeImage> get copyWith => __$RoomTypeImageCopyWithImpl<_RoomTypeImage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoomTypeImageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoomTypeImage&&(identical(other.id, id) || other.id == id)&&(identical(other.roomTypeId, roomTypeId) || other.roomTypeId == roomTypeId)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,roomTypeId,imageUrl,displayOrder,createdAt,updatedAt);

@override
String toString() {
  return 'RoomTypeImage(id: $id, roomTypeId: $roomTypeId, imageUrl: $imageUrl, displayOrder: $displayOrder, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$RoomTypeImageCopyWith<$Res> implements $RoomTypeImageCopyWith<$Res> {
  factory _$RoomTypeImageCopyWith(_RoomTypeImage value, $Res Function(_RoomTypeImage) _then) = __$RoomTypeImageCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'room_type_id') String roomTypeId,@JsonKey(name: 'image_url') String imageUrl,@JsonKey(name: 'display_order') int displayOrder,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$RoomTypeImageCopyWithImpl<$Res>
    implements _$RoomTypeImageCopyWith<$Res> {
  __$RoomTypeImageCopyWithImpl(this._self, this._then);

  final _RoomTypeImage _self;
  final $Res Function(_RoomTypeImage) _then;

/// Create a copy of RoomTypeImage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? roomTypeId = null,Object? imageUrl = null,Object? displayOrder = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_RoomTypeImage(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,roomTypeId: null == roomTypeId ? _self.roomTypeId : roomTypeId // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
