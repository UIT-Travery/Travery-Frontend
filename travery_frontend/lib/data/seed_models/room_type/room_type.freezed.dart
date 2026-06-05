// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoomType {

 String? get id;@JsonKey(name: 'hotel_id') String get hotelId; String get name; String? get description;@JsonKey(name: 'price_per_night') double get pricePerNight;@JsonKey(name: 'max_occupancy') int get maxOccupancy;@JsonKey(name: 'bed_count') int get bedCount; BedType get bedType;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;@JsonKey(name: 'deleted_at') DateTime? get deletedAt;/// RELATIONS
 List<RoomTypeImage>? get images; List<Room>? get rooms;
/// Create a copy of RoomType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoomTypeCopyWith<RoomType> get copyWith => _$RoomTypeCopyWithImpl<RoomType>(this as RoomType, _$identity);

  /// Serializes this RoomType to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoomType&&(identical(other.id, id) || other.id == id)&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.pricePerNight, pricePerNight) || other.pricePerNight == pricePerNight)&&(identical(other.maxOccupancy, maxOccupancy) || other.maxOccupancy == maxOccupancy)&&(identical(other.bedCount, bedCount) || other.bedCount == bedCount)&&(identical(other.bedType, bedType) || other.bedType == bedType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&const DeepCollectionEquality().equals(other.images, images)&&const DeepCollectionEquality().equals(other.rooms, rooms));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,hotelId,name,description,pricePerNight,maxOccupancy,bedCount,bedType,createdAt,updatedAt,deletedAt,const DeepCollectionEquality().hash(images),const DeepCollectionEquality().hash(rooms));

@override
String toString() {
  return 'RoomType(id: $id, hotelId: $hotelId, name: $name, description: $description, pricePerNight: $pricePerNight, maxOccupancy: $maxOccupancy, bedCount: $bedCount, bedType: $bedType, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, images: $images, rooms: $rooms)';
}


}

/// @nodoc
abstract mixin class $RoomTypeCopyWith<$Res>  {
  factory $RoomTypeCopyWith(RoomType value, $Res Function(RoomType) _then) = _$RoomTypeCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'hotel_id') String hotelId, String name, String? description,@JsonKey(name: 'price_per_night') double pricePerNight,@JsonKey(name: 'max_occupancy') int maxOccupancy,@JsonKey(name: 'bed_count') int bedCount, BedType bedType,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'deleted_at') DateTime? deletedAt, List<RoomTypeImage>? images, List<Room>? rooms
});




}
/// @nodoc
class _$RoomTypeCopyWithImpl<$Res>
    implements $RoomTypeCopyWith<$Res> {
  _$RoomTypeCopyWithImpl(this._self, this._then);

  final RoomType _self;
  final $Res Function(RoomType) _then;

/// Create a copy of RoomType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? hotelId = null,Object? name = null,Object? description = freezed,Object? pricePerNight = null,Object? maxOccupancy = null,Object? bedCount = null,Object? bedType = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? images = freezed,Object? rooms = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,hotelId: null == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,pricePerNight: null == pricePerNight ? _self.pricePerNight : pricePerNight // ignore: cast_nullable_to_non_nullable
as double,maxOccupancy: null == maxOccupancy ? _self.maxOccupancy : maxOccupancy // ignore: cast_nullable_to_non_nullable
as int,bedCount: null == bedCount ? _self.bedCount : bedCount // ignore: cast_nullable_to_non_nullable
as int,bedType: null == bedType ? _self.bedType : bedType // ignore: cast_nullable_to_non_nullable
as BedType,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,images: freezed == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<RoomTypeImage>?,rooms: freezed == rooms ? _self.rooms : rooms // ignore: cast_nullable_to_non_nullable
as List<Room>?,
  ));
}

}


/// Adds pattern-matching-related methods to [RoomType].
extension RoomTypePatterns on RoomType {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoomType value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoomType() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoomType value)  $default,){
final _that = this;
switch (_that) {
case _RoomType():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoomType value)?  $default,){
final _that = this;
switch (_that) {
case _RoomType() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'hotel_id')  String hotelId,  String name,  String? description, @JsonKey(name: 'price_per_night')  double pricePerNight, @JsonKey(name: 'max_occupancy')  int maxOccupancy, @JsonKey(name: 'bed_count')  int bedCount,  BedType bedType, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'deleted_at')  DateTime? deletedAt,  List<RoomTypeImage>? images,  List<Room>? rooms)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoomType() when $default != null:
return $default(_that.id,_that.hotelId,_that.name,_that.description,_that.pricePerNight,_that.maxOccupancy,_that.bedCount,_that.bedType,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.images,_that.rooms);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'hotel_id')  String hotelId,  String name,  String? description, @JsonKey(name: 'price_per_night')  double pricePerNight, @JsonKey(name: 'max_occupancy')  int maxOccupancy, @JsonKey(name: 'bed_count')  int bedCount,  BedType bedType, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'deleted_at')  DateTime? deletedAt,  List<RoomTypeImage>? images,  List<Room>? rooms)  $default,) {final _that = this;
switch (_that) {
case _RoomType():
return $default(_that.id,_that.hotelId,_that.name,_that.description,_that.pricePerNight,_that.maxOccupancy,_that.bedCount,_that.bedType,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.images,_that.rooms);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'hotel_id')  String hotelId,  String name,  String? description, @JsonKey(name: 'price_per_night')  double pricePerNight, @JsonKey(name: 'max_occupancy')  int maxOccupancy, @JsonKey(name: 'bed_count')  int bedCount,  BedType bedType, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'deleted_at')  DateTime? deletedAt,  List<RoomTypeImage>? images,  List<Room>? rooms)?  $default,) {final _that = this;
switch (_that) {
case _RoomType() when $default != null:
return $default(_that.id,_that.hotelId,_that.name,_that.description,_that.pricePerNight,_that.maxOccupancy,_that.bedCount,_that.bedType,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.images,_that.rooms);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoomType implements RoomType {
  const _RoomType({this.id, @JsonKey(name: 'hotel_id') required this.hotelId, required this.name, this.description, @JsonKey(name: 'price_per_night') required this.pricePerNight, @JsonKey(name: 'max_occupancy') required this.maxOccupancy, @JsonKey(name: 'bed_count') required this.bedCount, required this.bedType, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'deleted_at') this.deletedAt, final  List<RoomTypeImage>? images, final  List<Room>? rooms}): _images = images,_rooms = rooms;
  factory _RoomType.fromJson(Map<String, dynamic> json) => _$RoomTypeFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'hotel_id') final  String hotelId;
@override final  String name;
@override final  String? description;
@override@JsonKey(name: 'price_per_night') final  double pricePerNight;
@override@JsonKey(name: 'max_occupancy') final  int maxOccupancy;
@override@JsonKey(name: 'bed_count') final  int bedCount;
@override final  BedType bedType;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;
@override@JsonKey(name: 'deleted_at') final  DateTime? deletedAt;
/// RELATIONS
 final  List<RoomTypeImage>? _images;
/// RELATIONS
@override List<RoomTypeImage>? get images {
  final value = _images;
  if (value == null) return null;
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Room>? _rooms;
@override List<Room>? get rooms {
  final value = _rooms;
  if (value == null) return null;
  if (_rooms is EqualUnmodifiableListView) return _rooms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of RoomType
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoomTypeCopyWith<_RoomType> get copyWith => __$RoomTypeCopyWithImpl<_RoomType>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoomTypeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoomType&&(identical(other.id, id) || other.id == id)&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.pricePerNight, pricePerNight) || other.pricePerNight == pricePerNight)&&(identical(other.maxOccupancy, maxOccupancy) || other.maxOccupancy == maxOccupancy)&&(identical(other.bedCount, bedCount) || other.bedCount == bedCount)&&(identical(other.bedType, bedType) || other.bedType == bedType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&const DeepCollectionEquality().equals(other._images, _images)&&const DeepCollectionEquality().equals(other._rooms, _rooms));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,hotelId,name,description,pricePerNight,maxOccupancy,bedCount,bedType,createdAt,updatedAt,deletedAt,const DeepCollectionEquality().hash(_images),const DeepCollectionEquality().hash(_rooms));

@override
String toString() {
  return 'RoomType(id: $id, hotelId: $hotelId, name: $name, description: $description, pricePerNight: $pricePerNight, maxOccupancy: $maxOccupancy, bedCount: $bedCount, bedType: $bedType, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, images: $images, rooms: $rooms)';
}


}

/// @nodoc
abstract mixin class _$RoomTypeCopyWith<$Res> implements $RoomTypeCopyWith<$Res> {
  factory _$RoomTypeCopyWith(_RoomType value, $Res Function(_RoomType) _then) = __$RoomTypeCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'hotel_id') String hotelId, String name, String? description,@JsonKey(name: 'price_per_night') double pricePerNight,@JsonKey(name: 'max_occupancy') int maxOccupancy,@JsonKey(name: 'bed_count') int bedCount, BedType bedType,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'deleted_at') DateTime? deletedAt, List<RoomTypeImage>? images, List<Room>? rooms
});




}
/// @nodoc
class __$RoomTypeCopyWithImpl<$Res>
    implements _$RoomTypeCopyWith<$Res> {
  __$RoomTypeCopyWithImpl(this._self, this._then);

  final _RoomType _self;
  final $Res Function(_RoomType) _then;

/// Create a copy of RoomType
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? hotelId = null,Object? name = null,Object? description = freezed,Object? pricePerNight = null,Object? maxOccupancy = null,Object? bedCount = null,Object? bedType = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? images = freezed,Object? rooms = freezed,}) {
  return _then(_RoomType(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,hotelId: null == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,pricePerNight: null == pricePerNight ? _self.pricePerNight : pricePerNight // ignore: cast_nullable_to_non_nullable
as double,maxOccupancy: null == maxOccupancy ? _self.maxOccupancy : maxOccupancy // ignore: cast_nullable_to_non_nullable
as int,bedCount: null == bedCount ? _self.bedCount : bedCount // ignore: cast_nullable_to_non_nullable
as int,bedType: null == bedType ? _self.bedType : bedType // ignore: cast_nullable_to_non_nullable
as BedType,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,images: freezed == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<RoomTypeImage>?,rooms: freezed == rooms ? _self._rooms : rooms // ignore: cast_nullable_to_non_nullable
as List<Room>?,
  ));
}


}

// dart format on
