// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tour_review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TourReview {

 String? get id;@JsonKey(name: 'tour_booking_id') String get tourBookingId; int get rating; String? get comment;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of TourReview
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TourReviewCopyWith<TourReview> get copyWith => _$TourReviewCopyWithImpl<TourReview>(this as TourReview, _$identity);

  /// Serializes this TourReview to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TourReview&&(identical(other.id, id) || other.id == id)&&(identical(other.tourBookingId, tourBookingId) || other.tourBookingId == tourBookingId)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tourBookingId,rating,comment,createdAt,updatedAt);

@override
String toString() {
  return 'TourReview(id: $id, tourBookingId: $tourBookingId, rating: $rating, comment: $comment, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TourReviewCopyWith<$Res>  {
  factory $TourReviewCopyWith(TourReview value, $Res Function(TourReview) _then) = _$TourReviewCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'tour_booking_id') String tourBookingId, int rating, String? comment,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$TourReviewCopyWithImpl<$Res>
    implements $TourReviewCopyWith<$Res> {
  _$TourReviewCopyWithImpl(this._self, this._then);

  final TourReview _self;
  final $Res Function(TourReview) _then;

/// Create a copy of TourReview
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? tourBookingId = null,Object? rating = null,Object? comment = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,tourBookingId: null == tourBookingId ? _self.tourBookingId : tourBookingId // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TourReview].
extension TourReviewPatterns on TourReview {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TourReview value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TourReview() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TourReview value)  $default,){
final _that = this;
switch (_that) {
case _TourReview():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TourReview value)?  $default,){
final _that = this;
switch (_that) {
case _TourReview() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'tour_booking_id')  String tourBookingId,  int rating,  String? comment, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TourReview() when $default != null:
return $default(_that.id,_that.tourBookingId,_that.rating,_that.comment,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'tour_booking_id')  String tourBookingId,  int rating,  String? comment, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TourReview():
return $default(_that.id,_that.tourBookingId,_that.rating,_that.comment,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'tour_booking_id')  String tourBookingId,  int rating,  String? comment, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TourReview() when $default != null:
return $default(_that.id,_that.tourBookingId,_that.rating,_that.comment,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TourReview implements TourReview {
  const _TourReview({this.id, @JsonKey(name: 'tour_booking_id') required this.tourBookingId, required this.rating, this.comment, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _TourReview.fromJson(Map<String, dynamic> json) => _$TourReviewFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'tour_booking_id') final  String tourBookingId;
@override final  int rating;
@override final  String? comment;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of TourReview
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TourReviewCopyWith<_TourReview> get copyWith => __$TourReviewCopyWithImpl<_TourReview>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TourReviewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TourReview&&(identical(other.id, id) || other.id == id)&&(identical(other.tourBookingId, tourBookingId) || other.tourBookingId == tourBookingId)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tourBookingId,rating,comment,createdAt,updatedAt);

@override
String toString() {
  return 'TourReview(id: $id, tourBookingId: $tourBookingId, rating: $rating, comment: $comment, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TourReviewCopyWith<$Res> implements $TourReviewCopyWith<$Res> {
  factory _$TourReviewCopyWith(_TourReview value, $Res Function(_TourReview) _then) = __$TourReviewCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'tour_booking_id') String tourBookingId, int rating, String? comment,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$TourReviewCopyWithImpl<$Res>
    implements _$TourReviewCopyWith<$Res> {
  __$TourReviewCopyWithImpl(this._self, this._then);

  final _TourReview _self;
  final $Res Function(_TourReview) _then;

/// Create a copy of TourReview
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? tourBookingId = null,Object? rating = null,Object? comment = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_TourReview(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,tourBookingId: null == tourBookingId ? _self.tourBookingId : tourBookingId // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
