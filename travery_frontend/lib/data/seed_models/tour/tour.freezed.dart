// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tour.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Tour {

 String? get id; String get name; String? get description;@JsonKey(name: 'pricePerAdult') double get pricePerAdult;@JsonKey(name: 'pricePerChild') double get pricePerChild;@JsonKey(name: 'averageRating') double get averageRating;@JsonKey(name: 'ratingCount') int get ratingCount;@JsonKey(name: 'startLocation') String get startLocation;@JsonKey(name: 'durationDays') int get durationDays;/// RELATIONS
 List<TourImage>? get images; List<TourInstance>? get instances;
/// Create a copy of Tour
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TourCopyWith<Tour> get copyWith => _$TourCopyWithImpl<Tour>(this as Tour, _$identity);

  /// Serializes this Tour to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Tour&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.pricePerAdult, pricePerAdult) || other.pricePerAdult == pricePerAdult)&&(identical(other.pricePerChild, pricePerChild) || other.pricePerChild == pricePerChild)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.ratingCount, ratingCount) || other.ratingCount == ratingCount)&&(identical(other.startLocation, startLocation) || other.startLocation == startLocation)&&(identical(other.durationDays, durationDays) || other.durationDays == durationDays)&&const DeepCollectionEquality().equals(other.images, images)&&const DeepCollectionEquality().equals(other.instances, instances));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,pricePerAdult,pricePerChild,averageRating,ratingCount,startLocation,durationDays,const DeepCollectionEquality().hash(images),const DeepCollectionEquality().hash(instances));

@override
String toString() {
  return 'Tour(id: $id, name: $name, description: $description, pricePerAdult: $pricePerAdult, pricePerChild: $pricePerChild, averageRating: $averageRating, ratingCount: $ratingCount, startLocation: $startLocation, durationDays: $durationDays, images: $images, instances: $instances)';
}


}

/// @nodoc
abstract mixin class $TourCopyWith<$Res>  {
  factory $TourCopyWith(Tour value, $Res Function(Tour) _then) = _$TourCopyWithImpl;
@useResult
$Res call({
 String? id, String name, String? description,@JsonKey(name: 'pricePerAdult') double pricePerAdult,@JsonKey(name: 'pricePerChild') double pricePerChild,@JsonKey(name: 'averageRating') double averageRating,@JsonKey(name: 'ratingCount') int ratingCount,@JsonKey(name: 'startLocation') String startLocation,@JsonKey(name: 'durationDays') int durationDays, List<TourImage>? images, List<TourInstance>? instances
});




}
/// @nodoc
class _$TourCopyWithImpl<$Res>
    implements $TourCopyWith<$Res> {
  _$TourCopyWithImpl(this._self, this._then);

  final Tour _self;
  final $Res Function(Tour) _then;

/// Create a copy of Tour
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? description = freezed,Object? pricePerAdult = null,Object? pricePerChild = null,Object? averageRating = null,Object? ratingCount = null,Object? startLocation = null,Object? durationDays = null,Object? images = freezed,Object? instances = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,pricePerAdult: null == pricePerAdult ? _self.pricePerAdult : pricePerAdult // ignore: cast_nullable_to_non_nullable
as double,pricePerChild: null == pricePerChild ? _self.pricePerChild : pricePerChild // ignore: cast_nullable_to_non_nullable
as double,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double,ratingCount: null == ratingCount ? _self.ratingCount : ratingCount // ignore: cast_nullable_to_non_nullable
as int,startLocation: null == startLocation ? _self.startLocation : startLocation // ignore: cast_nullable_to_non_nullable
as String,durationDays: null == durationDays ? _self.durationDays : durationDays // ignore: cast_nullable_to_non_nullable
as int,images: freezed == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<TourImage>?,instances: freezed == instances ? _self.instances : instances // ignore: cast_nullable_to_non_nullable
as List<TourInstance>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Tour].
extension TourPatterns on Tour {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Tour value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Tour() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Tour value)  $default,){
final _that = this;
switch (_that) {
case _Tour():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Tour value)?  $default,){
final _that = this;
switch (_that) {
case _Tour() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String name,  String? description, @JsonKey(name: 'pricePerAdult')  double pricePerAdult, @JsonKey(name: 'pricePerChild')  double pricePerChild, @JsonKey(name: 'averageRating')  double averageRating, @JsonKey(name: 'ratingCount')  int ratingCount, @JsonKey(name: 'startLocation')  String startLocation, @JsonKey(name: 'durationDays')  int durationDays,  List<TourImage>? images,  List<TourInstance>? instances)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Tour() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.pricePerAdult,_that.pricePerChild,_that.averageRating,_that.ratingCount,_that.startLocation,_that.durationDays,_that.images,_that.instances);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String name,  String? description, @JsonKey(name: 'pricePerAdult')  double pricePerAdult, @JsonKey(name: 'pricePerChild')  double pricePerChild, @JsonKey(name: 'averageRating')  double averageRating, @JsonKey(name: 'ratingCount')  int ratingCount, @JsonKey(name: 'startLocation')  String startLocation, @JsonKey(name: 'durationDays')  int durationDays,  List<TourImage>? images,  List<TourInstance>? instances)  $default,) {final _that = this;
switch (_that) {
case _Tour():
return $default(_that.id,_that.name,_that.description,_that.pricePerAdult,_that.pricePerChild,_that.averageRating,_that.ratingCount,_that.startLocation,_that.durationDays,_that.images,_that.instances);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String name,  String? description, @JsonKey(name: 'pricePerAdult')  double pricePerAdult, @JsonKey(name: 'pricePerChild')  double pricePerChild, @JsonKey(name: 'averageRating')  double averageRating, @JsonKey(name: 'ratingCount')  int ratingCount, @JsonKey(name: 'startLocation')  String startLocation, @JsonKey(name: 'durationDays')  int durationDays,  List<TourImage>? images,  List<TourInstance>? instances)?  $default,) {final _that = this;
switch (_that) {
case _Tour() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.pricePerAdult,_that.pricePerChild,_that.averageRating,_that.ratingCount,_that.startLocation,_that.durationDays,_that.images,_that.instances);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Tour implements Tour {
  const _Tour({this.id, required this.name, this.description, @JsonKey(name: 'pricePerAdult') required this.pricePerAdult, @JsonKey(name: 'pricePerChild') required this.pricePerChild, @JsonKey(name: 'averageRating') this.averageRating = 0.0, @JsonKey(name: 'ratingCount') this.ratingCount = 0, @JsonKey(name: 'startLocation') this.startLocation = '', @JsonKey(name: 'durationDays') this.durationDays = 0, final  List<TourImage>? images, final  List<TourInstance>? instances}): _images = images,_instances = instances;
  factory _Tour.fromJson(Map<String, dynamic> json) => _$TourFromJson(json);

@override final  String? id;
@override final  String name;
@override final  String? description;
@override@JsonKey(name: 'pricePerAdult') final  double pricePerAdult;
@override@JsonKey(name: 'pricePerChild') final  double pricePerChild;
@override@JsonKey(name: 'averageRating') final  double averageRating;
@override@JsonKey(name: 'ratingCount') final  int ratingCount;
@override@JsonKey(name: 'startLocation') final  String startLocation;
@override@JsonKey(name: 'durationDays') final  int durationDays;
/// RELATIONS
 final  List<TourImage>? _images;
/// RELATIONS
@override List<TourImage>? get images {
  final value = _images;
  if (value == null) return null;
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<TourInstance>? _instances;
@override List<TourInstance>? get instances {
  final value = _instances;
  if (value == null) return null;
  if (_instances is EqualUnmodifiableListView) return _instances;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Tour
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TourCopyWith<_Tour> get copyWith => __$TourCopyWithImpl<_Tour>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TourToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Tour&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.pricePerAdult, pricePerAdult) || other.pricePerAdult == pricePerAdult)&&(identical(other.pricePerChild, pricePerChild) || other.pricePerChild == pricePerChild)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.ratingCount, ratingCount) || other.ratingCount == ratingCount)&&(identical(other.startLocation, startLocation) || other.startLocation == startLocation)&&(identical(other.durationDays, durationDays) || other.durationDays == durationDays)&&const DeepCollectionEquality().equals(other._images, _images)&&const DeepCollectionEquality().equals(other._instances, _instances));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,pricePerAdult,pricePerChild,averageRating,ratingCount,startLocation,durationDays,const DeepCollectionEquality().hash(_images),const DeepCollectionEquality().hash(_instances));

@override
String toString() {
  return 'Tour(id: $id, name: $name, description: $description, pricePerAdult: $pricePerAdult, pricePerChild: $pricePerChild, averageRating: $averageRating, ratingCount: $ratingCount, startLocation: $startLocation, durationDays: $durationDays, images: $images, instances: $instances)';
}


}

/// @nodoc
abstract mixin class _$TourCopyWith<$Res> implements $TourCopyWith<$Res> {
  factory _$TourCopyWith(_Tour value, $Res Function(_Tour) _then) = __$TourCopyWithImpl;
@override @useResult
$Res call({
 String? id, String name, String? description,@JsonKey(name: 'pricePerAdult') double pricePerAdult,@JsonKey(name: 'pricePerChild') double pricePerChild,@JsonKey(name: 'averageRating') double averageRating,@JsonKey(name: 'ratingCount') int ratingCount,@JsonKey(name: 'startLocation') String startLocation,@JsonKey(name: 'durationDays') int durationDays, List<TourImage>? images, List<TourInstance>? instances
});




}
/// @nodoc
class __$TourCopyWithImpl<$Res>
    implements _$TourCopyWith<$Res> {
  __$TourCopyWithImpl(this._self, this._then);

  final _Tour _self;
  final $Res Function(_Tour) _then;

/// Create a copy of Tour
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? description = freezed,Object? pricePerAdult = null,Object? pricePerChild = null,Object? averageRating = null,Object? ratingCount = null,Object? startLocation = null,Object? durationDays = null,Object? images = freezed,Object? instances = freezed,}) {
  return _then(_Tour(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,pricePerAdult: null == pricePerAdult ? _self.pricePerAdult : pricePerAdult // ignore: cast_nullable_to_non_nullable
as double,pricePerChild: null == pricePerChild ? _self.pricePerChild : pricePerChild // ignore: cast_nullable_to_non_nullable
as double,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double,ratingCount: null == ratingCount ? _self.ratingCount : ratingCount // ignore: cast_nullable_to_non_nullable
as int,startLocation: null == startLocation ? _self.startLocation : startLocation // ignore: cast_nullable_to_non_nullable
as String,durationDays: null == durationDays ? _self.durationDays : durationDays // ignore: cast_nullable_to_non_nullable
as int,images: freezed == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<TourImage>?,instances: freezed == instances ? _self._instances : instances // ignore: cast_nullable_to_non_nullable
as List<TourInstance>?,
  ));
}


}

// dart format on
