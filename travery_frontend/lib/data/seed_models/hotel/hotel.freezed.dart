// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hotel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Hotel {

 String? get id; String get name; String? get description; String? get address; String? get city;@JsonKey(name: 'location_code') String? get locationCode; Map<String, dynamic>? get amenities;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;@JsonKey(name: 'deleted_at') DateTime? get deletedAt;/// RELATIONS
 List<HotelImage>? get images; List<RoomType>? get roomTypes;
/// Create a copy of Hotel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HotelCopyWith<Hotel> get copyWith => _$HotelCopyWithImpl<Hotel>(this as Hotel, _$identity);

  /// Serializes this Hotel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Hotel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&(identical(other.locationCode, locationCode) || other.locationCode == locationCode)&&const DeepCollectionEquality().equals(other.amenities, amenities)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&const DeepCollectionEquality().equals(other.images, images)&&const DeepCollectionEquality().equals(other.roomTypes, roomTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,address,city,locationCode,const DeepCollectionEquality().hash(amenities),createdAt,updatedAt,deletedAt,const DeepCollectionEquality().hash(images),const DeepCollectionEquality().hash(roomTypes));

@override
String toString() {
  return 'Hotel(id: $id, name: $name, description: $description, address: $address, city: $city, locationCode: $locationCode, amenities: $amenities, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, images: $images, roomTypes: $roomTypes)';
}


}

/// @nodoc
abstract mixin class $HotelCopyWith<$Res>  {
  factory $HotelCopyWith(Hotel value, $Res Function(Hotel) _then) = _$HotelCopyWithImpl;
@useResult
$Res call({
 String? id, String name, String? description, String? address, String? city,@JsonKey(name: 'location_code') String? locationCode, Map<String, dynamic>? amenities,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'deleted_at') DateTime? deletedAt, List<HotelImage>? images, List<RoomType>? roomTypes
});




}
/// @nodoc
class _$HotelCopyWithImpl<$Res>
    implements $HotelCopyWith<$Res> {
  _$HotelCopyWithImpl(this._self, this._then);

  final Hotel _self;
  final $Res Function(Hotel) _then;

/// Create a copy of Hotel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? description = freezed,Object? address = freezed,Object? city = freezed,Object? locationCode = freezed,Object? amenities = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? images = freezed,Object? roomTypes = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,locationCode: freezed == locationCode ? _self.locationCode : locationCode // ignore: cast_nullable_to_non_nullable
as String?,amenities: freezed == amenities ? _self.amenities : amenities // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,images: freezed == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<HotelImage>?,roomTypes: freezed == roomTypes ? _self.roomTypes : roomTypes // ignore: cast_nullable_to_non_nullable
as List<RoomType>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Hotel].
extension HotelPatterns on Hotel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Hotel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Hotel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Hotel value)  $default,){
final _that = this;
switch (_that) {
case _Hotel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Hotel value)?  $default,){
final _that = this;
switch (_that) {
case _Hotel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String name,  String? description,  String? address,  String? city, @JsonKey(name: 'location_code')  String? locationCode,  Map<String, dynamic>? amenities, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'deleted_at')  DateTime? deletedAt,  List<HotelImage>? images,  List<RoomType>? roomTypes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Hotel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.address,_that.city,_that.locationCode,_that.amenities,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.images,_that.roomTypes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String name,  String? description,  String? address,  String? city, @JsonKey(name: 'location_code')  String? locationCode,  Map<String, dynamic>? amenities, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'deleted_at')  DateTime? deletedAt,  List<HotelImage>? images,  List<RoomType>? roomTypes)  $default,) {final _that = this;
switch (_that) {
case _Hotel():
return $default(_that.id,_that.name,_that.description,_that.address,_that.city,_that.locationCode,_that.amenities,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.images,_that.roomTypes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String name,  String? description,  String? address,  String? city, @JsonKey(name: 'location_code')  String? locationCode,  Map<String, dynamic>? amenities, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'deleted_at')  DateTime? deletedAt,  List<HotelImage>? images,  List<RoomType>? roomTypes)?  $default,) {final _that = this;
switch (_that) {
case _Hotel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.address,_that.city,_that.locationCode,_that.amenities,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.images,_that.roomTypes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Hotel implements Hotel {
  const _Hotel({this.id, required this.name, this.description, this.address, this.city, @JsonKey(name: 'location_code') this.locationCode, final  Map<String, dynamic>? amenities, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'deleted_at') this.deletedAt, final  List<HotelImage>? images, final  List<RoomType>? roomTypes}): _amenities = amenities,_images = images,_roomTypes = roomTypes;
  factory _Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);

@override final  String? id;
@override final  String name;
@override final  String? description;
@override final  String? address;
@override final  String? city;
@override@JsonKey(name: 'location_code') final  String? locationCode;
 final  Map<String, dynamic>? _amenities;
@override Map<String, dynamic>? get amenities {
  final value = _amenities;
  if (value == null) return null;
  if (_amenities is EqualUnmodifiableMapView) return _amenities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;
@override@JsonKey(name: 'deleted_at') final  DateTime? deletedAt;
/// RELATIONS
 final  List<HotelImage>? _images;
/// RELATIONS
@override List<HotelImage>? get images {
  final value = _images;
  if (value == null) return null;
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<RoomType>? _roomTypes;
@override List<RoomType>? get roomTypes {
  final value = _roomTypes;
  if (value == null) return null;
  if (_roomTypes is EqualUnmodifiableListView) return _roomTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Hotel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HotelCopyWith<_Hotel> get copyWith => __$HotelCopyWithImpl<_Hotel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HotelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Hotel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&(identical(other.locationCode, locationCode) || other.locationCode == locationCode)&&const DeepCollectionEquality().equals(other._amenities, _amenities)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&const DeepCollectionEquality().equals(other._images, _images)&&const DeepCollectionEquality().equals(other._roomTypes, _roomTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,address,city,locationCode,const DeepCollectionEquality().hash(_amenities),createdAt,updatedAt,deletedAt,const DeepCollectionEquality().hash(_images),const DeepCollectionEquality().hash(_roomTypes));

@override
String toString() {
  return 'Hotel(id: $id, name: $name, description: $description, address: $address, city: $city, locationCode: $locationCode, amenities: $amenities, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, images: $images, roomTypes: $roomTypes)';
}


}

/// @nodoc
abstract mixin class _$HotelCopyWith<$Res> implements $HotelCopyWith<$Res> {
  factory _$HotelCopyWith(_Hotel value, $Res Function(_Hotel) _then) = __$HotelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String name, String? description, String? address, String? city,@JsonKey(name: 'location_code') String? locationCode, Map<String, dynamic>? amenities,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'deleted_at') DateTime? deletedAt, List<HotelImage>? images, List<RoomType>? roomTypes
});




}
/// @nodoc
class __$HotelCopyWithImpl<$Res>
    implements _$HotelCopyWith<$Res> {
  __$HotelCopyWithImpl(this._self, this._then);

  final _Hotel _self;
  final $Res Function(_Hotel) _then;

/// Create a copy of Hotel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? description = freezed,Object? address = freezed,Object? city = freezed,Object? locationCode = freezed,Object? amenities = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? images = freezed,Object? roomTypes = freezed,}) {
  return _then(_Hotel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,locationCode: freezed == locationCode ? _self.locationCode : locationCode // ignore: cast_nullable_to_non_nullable
as String?,amenities: freezed == amenities ? _self._amenities : amenities // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,images: freezed == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<HotelImage>?,roomTypes: freezed == roomTypes ? _self._roomTypes : roomTypes // ignore: cast_nullable_to_non_nullable
as List<RoomType>?,
  ));
}


}

// dart format on
