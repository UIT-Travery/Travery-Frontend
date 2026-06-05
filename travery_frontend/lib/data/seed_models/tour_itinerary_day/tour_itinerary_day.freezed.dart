// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tour_itinerary_day.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TourItineraryDay {

 String? get id;@JsonKey(name: 'tour_id') String get tourId;@JsonKey(name: 'day_number') int get dayNumber; String get title; String? get description;@JsonKey(name: 'meal_count') int get mealCount;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;/// RELATION
 List<TourItineraryDayImage>? get images;
/// Create a copy of TourItineraryDay
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TourItineraryDayCopyWith<TourItineraryDay> get copyWith => _$TourItineraryDayCopyWithImpl<TourItineraryDay>(this as TourItineraryDay, _$identity);

  /// Serializes this TourItineraryDay to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TourItineraryDay&&(identical(other.id, id) || other.id == id)&&(identical(other.tourId, tourId) || other.tourId == tourId)&&(identical(other.dayNumber, dayNumber) || other.dayNumber == dayNumber)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.mealCount, mealCount) || other.mealCount == mealCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.images, images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tourId,dayNumber,title,description,mealCount,createdAt,updatedAt,const DeepCollectionEquality().hash(images));

@override
String toString() {
  return 'TourItineraryDay(id: $id, tourId: $tourId, dayNumber: $dayNumber, title: $title, description: $description, mealCount: $mealCount, createdAt: $createdAt, updatedAt: $updatedAt, images: $images)';
}


}

/// @nodoc
abstract mixin class $TourItineraryDayCopyWith<$Res>  {
  factory $TourItineraryDayCopyWith(TourItineraryDay value, $Res Function(TourItineraryDay) _then) = _$TourItineraryDayCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'tour_id') String tourId,@JsonKey(name: 'day_number') int dayNumber, String title, String? description,@JsonKey(name: 'meal_count') int mealCount,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt, List<TourItineraryDayImage>? images
});




}
/// @nodoc
class _$TourItineraryDayCopyWithImpl<$Res>
    implements $TourItineraryDayCopyWith<$Res> {
  _$TourItineraryDayCopyWithImpl(this._self, this._then);

  final TourItineraryDay _self;
  final $Res Function(TourItineraryDay) _then;

/// Create a copy of TourItineraryDay
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? tourId = null,Object? dayNumber = null,Object? title = null,Object? description = freezed,Object? mealCount = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? images = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,tourId: null == tourId ? _self.tourId : tourId // ignore: cast_nullable_to_non_nullable
as String,dayNumber: null == dayNumber ? _self.dayNumber : dayNumber // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,mealCount: null == mealCount ? _self.mealCount : mealCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,images: freezed == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<TourItineraryDayImage>?,
  ));
}

}


/// Adds pattern-matching-related methods to [TourItineraryDay].
extension TourItineraryDayPatterns on TourItineraryDay {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TourItineraryDay value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TourItineraryDay() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TourItineraryDay value)  $default,){
final _that = this;
switch (_that) {
case _TourItineraryDay():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TourItineraryDay value)?  $default,){
final _that = this;
switch (_that) {
case _TourItineraryDay() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'tour_id')  String tourId, @JsonKey(name: 'day_number')  int dayNumber,  String title,  String? description, @JsonKey(name: 'meal_count')  int mealCount, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  List<TourItineraryDayImage>? images)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TourItineraryDay() when $default != null:
return $default(_that.id,_that.tourId,_that.dayNumber,_that.title,_that.description,_that.mealCount,_that.createdAt,_that.updatedAt,_that.images);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'tour_id')  String tourId, @JsonKey(name: 'day_number')  int dayNumber,  String title,  String? description, @JsonKey(name: 'meal_count')  int mealCount, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  List<TourItineraryDayImage>? images)  $default,) {final _that = this;
switch (_that) {
case _TourItineraryDay():
return $default(_that.id,_that.tourId,_that.dayNumber,_that.title,_that.description,_that.mealCount,_that.createdAt,_that.updatedAt,_that.images);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'tour_id')  String tourId, @JsonKey(name: 'day_number')  int dayNumber,  String title,  String? description, @JsonKey(name: 'meal_count')  int mealCount, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  List<TourItineraryDayImage>? images)?  $default,) {final _that = this;
switch (_that) {
case _TourItineraryDay() when $default != null:
return $default(_that.id,_that.tourId,_that.dayNumber,_that.title,_that.description,_that.mealCount,_that.createdAt,_that.updatedAt,_that.images);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TourItineraryDay implements TourItineraryDay {
  const _TourItineraryDay({this.id, @JsonKey(name: 'tour_id') required this.tourId, @JsonKey(name: 'day_number') required this.dayNumber, required this.title, this.description, @JsonKey(name: 'meal_count') required this.mealCount, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, final  List<TourItineraryDayImage>? images}): _images = images;
  factory _TourItineraryDay.fromJson(Map<String, dynamic> json) => _$TourItineraryDayFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'tour_id') final  String tourId;
@override@JsonKey(name: 'day_number') final  int dayNumber;
@override final  String title;
@override final  String? description;
@override@JsonKey(name: 'meal_count') final  int mealCount;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;
/// RELATION
 final  List<TourItineraryDayImage>? _images;
/// RELATION
@override List<TourItineraryDayImage>? get images {
  final value = _images;
  if (value == null) return null;
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of TourItineraryDay
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TourItineraryDayCopyWith<_TourItineraryDay> get copyWith => __$TourItineraryDayCopyWithImpl<_TourItineraryDay>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TourItineraryDayToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TourItineraryDay&&(identical(other.id, id) || other.id == id)&&(identical(other.tourId, tourId) || other.tourId == tourId)&&(identical(other.dayNumber, dayNumber) || other.dayNumber == dayNumber)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.mealCount, mealCount) || other.mealCount == mealCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._images, _images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tourId,dayNumber,title,description,mealCount,createdAt,updatedAt,const DeepCollectionEquality().hash(_images));

@override
String toString() {
  return 'TourItineraryDay(id: $id, tourId: $tourId, dayNumber: $dayNumber, title: $title, description: $description, mealCount: $mealCount, createdAt: $createdAt, updatedAt: $updatedAt, images: $images)';
}


}

/// @nodoc
abstract mixin class _$TourItineraryDayCopyWith<$Res> implements $TourItineraryDayCopyWith<$Res> {
  factory _$TourItineraryDayCopyWith(_TourItineraryDay value, $Res Function(_TourItineraryDay) _then) = __$TourItineraryDayCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'tour_id') String tourId,@JsonKey(name: 'day_number') int dayNumber, String title, String? description,@JsonKey(name: 'meal_count') int mealCount,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt, List<TourItineraryDayImage>? images
});




}
/// @nodoc
class __$TourItineraryDayCopyWithImpl<$Res>
    implements _$TourItineraryDayCopyWith<$Res> {
  __$TourItineraryDayCopyWithImpl(this._self, this._then);

  final _TourItineraryDay _self;
  final $Res Function(_TourItineraryDay) _then;

/// Create a copy of TourItineraryDay
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? tourId = null,Object? dayNumber = null,Object? title = null,Object? description = freezed,Object? mealCount = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? images = freezed,}) {
  return _then(_TourItineraryDay(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,tourId: null == tourId ? _self.tourId : tourId // ignore: cast_nullable_to_non_nullable
as String,dayNumber: null == dayNumber ? _self.dayNumber : dayNumber // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,mealCount: null == mealCount ? _self.mealCount : mealCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,images: freezed == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<TourItineraryDayImage>?,
  ));
}


}

// dart format on
