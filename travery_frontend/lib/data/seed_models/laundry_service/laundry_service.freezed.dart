// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'laundry_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LaundryService {

 String? get id;@JsonKey(name: 'hotel_id') String get hotelId; String get name; String? get description; LaundryServiceType get serviceType;@JsonKey(name: 'price_per_kg') double get pricePerKg;@JsonKey(name: 'is_available') bool get isAvailable;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of LaundryService
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LaundryServiceCopyWith<LaundryService> get copyWith => _$LaundryServiceCopyWithImpl<LaundryService>(this as LaundryService, _$identity);

  /// Serializes this LaundryService to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LaundryService&&(identical(other.id, id) || other.id == id)&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.serviceType, serviceType) || other.serviceType == serviceType)&&(identical(other.pricePerKg, pricePerKg) || other.pricePerKg == pricePerKg)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,hotelId,name,description,serviceType,pricePerKg,isAvailable,createdAt,updatedAt);

@override
String toString() {
  return 'LaundryService(id: $id, hotelId: $hotelId, name: $name, description: $description, serviceType: $serviceType, pricePerKg: $pricePerKg, isAvailable: $isAvailable, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $LaundryServiceCopyWith<$Res>  {
  factory $LaundryServiceCopyWith(LaundryService value, $Res Function(LaundryService) _then) = _$LaundryServiceCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'hotel_id') String hotelId, String name, String? description, LaundryServiceType serviceType,@JsonKey(name: 'price_per_kg') double pricePerKg,@JsonKey(name: 'is_available') bool isAvailable,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$LaundryServiceCopyWithImpl<$Res>
    implements $LaundryServiceCopyWith<$Res> {
  _$LaundryServiceCopyWithImpl(this._self, this._then);

  final LaundryService _self;
  final $Res Function(LaundryService) _then;

/// Create a copy of LaundryService
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? hotelId = null,Object? name = null,Object? description = freezed,Object? serviceType = null,Object? pricePerKg = null,Object? isAvailable = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,hotelId: null == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,serviceType: null == serviceType ? _self.serviceType : serviceType // ignore: cast_nullable_to_non_nullable
as LaundryServiceType,pricePerKg: null == pricePerKg ? _self.pricePerKg : pricePerKg // ignore: cast_nullable_to_non_nullable
as double,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [LaundryService].
extension LaundryServicePatterns on LaundryService {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LaundryService value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LaundryService() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LaundryService value)  $default,){
final _that = this;
switch (_that) {
case _LaundryService():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LaundryService value)?  $default,){
final _that = this;
switch (_that) {
case _LaundryService() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'hotel_id')  String hotelId,  String name,  String? description,  LaundryServiceType serviceType, @JsonKey(name: 'price_per_kg')  double pricePerKg, @JsonKey(name: 'is_available')  bool isAvailable, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LaundryService() when $default != null:
return $default(_that.id,_that.hotelId,_that.name,_that.description,_that.serviceType,_that.pricePerKg,_that.isAvailable,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'hotel_id')  String hotelId,  String name,  String? description,  LaundryServiceType serviceType, @JsonKey(name: 'price_per_kg')  double pricePerKg, @JsonKey(name: 'is_available')  bool isAvailable, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _LaundryService():
return $default(_that.id,_that.hotelId,_that.name,_that.description,_that.serviceType,_that.pricePerKg,_that.isAvailable,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'hotel_id')  String hotelId,  String name,  String? description,  LaundryServiceType serviceType, @JsonKey(name: 'price_per_kg')  double pricePerKg, @JsonKey(name: 'is_available')  bool isAvailable, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _LaundryService() when $default != null:
return $default(_that.id,_that.hotelId,_that.name,_that.description,_that.serviceType,_that.pricePerKg,_that.isAvailable,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LaundryService implements LaundryService {
  const _LaundryService({this.id, @JsonKey(name: 'hotel_id') required this.hotelId, required this.name, this.description, required this.serviceType, @JsonKey(name: 'price_per_kg') required this.pricePerKg, @JsonKey(name: 'is_available') required this.isAvailable, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _LaundryService.fromJson(Map<String, dynamic> json) => _$LaundryServiceFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'hotel_id') final  String hotelId;
@override final  String name;
@override final  String? description;
@override final  LaundryServiceType serviceType;
@override@JsonKey(name: 'price_per_kg') final  double pricePerKg;
@override@JsonKey(name: 'is_available') final  bool isAvailable;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of LaundryService
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LaundryServiceCopyWith<_LaundryService> get copyWith => __$LaundryServiceCopyWithImpl<_LaundryService>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LaundryServiceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LaundryService&&(identical(other.id, id) || other.id == id)&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.serviceType, serviceType) || other.serviceType == serviceType)&&(identical(other.pricePerKg, pricePerKg) || other.pricePerKg == pricePerKg)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,hotelId,name,description,serviceType,pricePerKg,isAvailable,createdAt,updatedAt);

@override
String toString() {
  return 'LaundryService(id: $id, hotelId: $hotelId, name: $name, description: $description, serviceType: $serviceType, pricePerKg: $pricePerKg, isAvailable: $isAvailable, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$LaundryServiceCopyWith<$Res> implements $LaundryServiceCopyWith<$Res> {
  factory _$LaundryServiceCopyWith(_LaundryService value, $Res Function(_LaundryService) _then) = __$LaundryServiceCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'hotel_id') String hotelId, String name, String? description, LaundryServiceType serviceType,@JsonKey(name: 'price_per_kg') double pricePerKg,@JsonKey(name: 'is_available') bool isAvailable,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$LaundryServiceCopyWithImpl<$Res>
    implements _$LaundryServiceCopyWith<$Res> {
  __$LaundryServiceCopyWithImpl(this._self, this._then);

  final _LaundryService _self;
  final $Res Function(_LaundryService) _then;

/// Create a copy of LaundryService
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? hotelId = null,Object? name = null,Object? description = freezed,Object? serviceType = null,Object? pricePerKg = null,Object? isAvailable = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_LaundryService(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,hotelId: null == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,serviceType: null == serviceType ? _self.serviceType : serviceType // ignore: cast_nullable_to_non_nullable
as LaundryServiceType,pricePerKg: null == pricePerKg ? _self.pricePerKg : pricePerKg // ignore: cast_nullable_to_non_nullable
as double,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
