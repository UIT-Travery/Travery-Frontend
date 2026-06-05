// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MealService {

 String? get id;@JsonKey(name: 'hotel_id') String get hotelId; String get name; MealType get mealType; String? get description; double get price;@JsonKey(name: 'is_available') bool get isAvailable;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of MealService
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MealServiceCopyWith<MealService> get copyWith => _$MealServiceCopyWithImpl<MealService>(this as MealService, _$identity);

  /// Serializes this MealService to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MealService&&(identical(other.id, id) || other.id == id)&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId)&&(identical(other.name, name) || other.name == name)&&(identical(other.mealType, mealType) || other.mealType == mealType)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,hotelId,name,mealType,description,price,isAvailable,createdAt,updatedAt);

@override
String toString() {
  return 'MealService(id: $id, hotelId: $hotelId, name: $name, mealType: $mealType, description: $description, price: $price, isAvailable: $isAvailable, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $MealServiceCopyWith<$Res>  {
  factory $MealServiceCopyWith(MealService value, $Res Function(MealService) _then) = _$MealServiceCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'hotel_id') String hotelId, String name, MealType mealType, String? description, double price,@JsonKey(name: 'is_available') bool isAvailable,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$MealServiceCopyWithImpl<$Res>
    implements $MealServiceCopyWith<$Res> {
  _$MealServiceCopyWithImpl(this._self, this._then);

  final MealService _self;
  final $Res Function(MealService) _then;

/// Create a copy of MealService
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? hotelId = null,Object? name = null,Object? mealType = null,Object? description = freezed,Object? price = null,Object? isAvailable = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,hotelId: null == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,mealType: null == mealType ? _self.mealType : mealType // ignore: cast_nullable_to_non_nullable
as MealType,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [MealService].
extension MealServicePatterns on MealService {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MealService value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MealService() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MealService value)  $default,){
final _that = this;
switch (_that) {
case _MealService():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MealService value)?  $default,){
final _that = this;
switch (_that) {
case _MealService() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'hotel_id')  String hotelId,  String name,  MealType mealType,  String? description,  double price, @JsonKey(name: 'is_available')  bool isAvailable, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MealService() when $default != null:
return $default(_that.id,_that.hotelId,_that.name,_that.mealType,_that.description,_that.price,_that.isAvailable,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'hotel_id')  String hotelId,  String name,  MealType mealType,  String? description,  double price, @JsonKey(name: 'is_available')  bool isAvailable, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _MealService():
return $default(_that.id,_that.hotelId,_that.name,_that.mealType,_that.description,_that.price,_that.isAvailable,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'hotel_id')  String hotelId,  String name,  MealType mealType,  String? description,  double price, @JsonKey(name: 'is_available')  bool isAvailable, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _MealService() when $default != null:
return $default(_that.id,_that.hotelId,_that.name,_that.mealType,_that.description,_that.price,_that.isAvailable,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MealService implements MealService {
  const _MealService({this.id, @JsonKey(name: 'hotel_id') required this.hotelId, required this.name, required this.mealType, this.description, required this.price, @JsonKey(name: 'is_available') required this.isAvailable, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _MealService.fromJson(Map<String, dynamic> json) => _$MealServiceFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'hotel_id') final  String hotelId;
@override final  String name;
@override final  MealType mealType;
@override final  String? description;
@override final  double price;
@override@JsonKey(name: 'is_available') final  bool isAvailable;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of MealService
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MealServiceCopyWith<_MealService> get copyWith => __$MealServiceCopyWithImpl<_MealService>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MealServiceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MealService&&(identical(other.id, id) || other.id == id)&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId)&&(identical(other.name, name) || other.name == name)&&(identical(other.mealType, mealType) || other.mealType == mealType)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,hotelId,name,mealType,description,price,isAvailable,createdAt,updatedAt);

@override
String toString() {
  return 'MealService(id: $id, hotelId: $hotelId, name: $name, mealType: $mealType, description: $description, price: $price, isAvailable: $isAvailable, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$MealServiceCopyWith<$Res> implements $MealServiceCopyWith<$Res> {
  factory _$MealServiceCopyWith(_MealService value, $Res Function(_MealService) _then) = __$MealServiceCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'hotel_id') String hotelId, String name, MealType mealType, String? description, double price,@JsonKey(name: 'is_available') bool isAvailable,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$MealServiceCopyWithImpl<$Res>
    implements _$MealServiceCopyWith<$Res> {
  __$MealServiceCopyWithImpl(this._self, this._then);

  final _MealService _self;
  final $Res Function(_MealService) _then;

/// Create a copy of MealService
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? hotelId = null,Object? name = null,Object? mealType = null,Object? description = freezed,Object? price = null,Object? isAvailable = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_MealService(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,hotelId: null == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,mealType: null == mealType ? _self.mealType : mealType // ignore: cast_nullable_to_non_nullable
as MealType,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
