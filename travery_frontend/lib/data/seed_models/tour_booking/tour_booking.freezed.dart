// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tour_booking.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TourBooking {

 String? get id;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'tour_instance_id') String? get tourInstanceId;@JsonKey(name: 'passenger_name') String get passengerName;@JsonKey(name: 'passenger_phone') String get passengerPhone;@JsonKey(name: 'adult_count') int get adultCount;@JsonKey(name: 'child_count') int get childCount;@JsonKey(name: 'total_price') double get totalPrice;@JsonKey(name: 'refund_amount') double? get refundAmount;@JsonKey(name: 'special_notes') String? get specialNotes; BookingStatus get status;@JsonKey(name: 'coordinator_id') String? get coordinatorId;@JsonKey(name: 'coordinator_response') String? get coordinatorResponse;@JsonKey(name: 'cancellation_reason') DateTime? get cancellationReason;@JsonKey(name: 'cancelled_at') DateTime? get cancelledAt;@JsonKey(name: 'no_show_note') String? get noShowNote;@JsonKey(name: 'no_show_at') DateTime? get noShowAt;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;/// RELATIONS
 List<TourBookingMember>? get members; TourReview? get review;
/// Create a copy of TourBooking
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TourBookingCopyWith<TourBooking> get copyWith => _$TourBookingCopyWithImpl<TourBooking>(this as TourBooking, _$identity);

  /// Serializes this TourBooking to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TourBooking&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.tourInstanceId, tourInstanceId) || other.tourInstanceId == tourInstanceId)&&(identical(other.passengerName, passengerName) || other.passengerName == passengerName)&&(identical(other.passengerPhone, passengerPhone) || other.passengerPhone == passengerPhone)&&(identical(other.adultCount, adultCount) || other.adultCount == adultCount)&&(identical(other.childCount, childCount) || other.childCount == childCount)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.refundAmount, refundAmount) || other.refundAmount == refundAmount)&&(identical(other.specialNotes, specialNotes) || other.specialNotes == specialNotes)&&(identical(other.status, status) || other.status == status)&&(identical(other.coordinatorId, coordinatorId) || other.coordinatorId == coordinatorId)&&(identical(other.coordinatorResponse, coordinatorResponse) || other.coordinatorResponse == coordinatorResponse)&&(identical(other.cancellationReason, cancellationReason) || other.cancellationReason == cancellationReason)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&(identical(other.noShowNote, noShowNote) || other.noShowNote == noShowNote)&&(identical(other.noShowAt, noShowAt) || other.noShowAt == noShowAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.members, members)&&(identical(other.review, review) || other.review == review));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,tourInstanceId,passengerName,passengerPhone,adultCount,childCount,totalPrice,refundAmount,specialNotes,status,coordinatorId,coordinatorResponse,cancellationReason,cancelledAt,noShowNote,noShowAt,createdAt,updatedAt,const DeepCollectionEquality().hash(members),review]);

@override
String toString() {
  return 'TourBooking(id: $id, userId: $userId, tourInstanceId: $tourInstanceId, passengerName: $passengerName, passengerPhone: $passengerPhone, adultCount: $adultCount, childCount: $childCount, totalPrice: $totalPrice, refundAmount: $refundAmount, specialNotes: $specialNotes, status: $status, coordinatorId: $coordinatorId, coordinatorResponse: $coordinatorResponse, cancellationReason: $cancellationReason, cancelledAt: $cancelledAt, noShowNote: $noShowNote, noShowAt: $noShowAt, createdAt: $createdAt, updatedAt: $updatedAt, members: $members, review: $review)';
}


}

/// @nodoc
abstract mixin class $TourBookingCopyWith<$Res>  {
  factory $TourBookingCopyWith(TourBooking value, $Res Function(TourBooking) _then) = _$TourBookingCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'tour_instance_id') String? tourInstanceId,@JsonKey(name: 'passenger_name') String passengerName,@JsonKey(name: 'passenger_phone') String passengerPhone,@JsonKey(name: 'adult_count') int adultCount,@JsonKey(name: 'child_count') int childCount,@JsonKey(name: 'total_price') double totalPrice,@JsonKey(name: 'refund_amount') double? refundAmount,@JsonKey(name: 'special_notes') String? specialNotes, BookingStatus status,@JsonKey(name: 'coordinator_id') String? coordinatorId,@JsonKey(name: 'coordinator_response') String? coordinatorResponse,@JsonKey(name: 'cancellation_reason') DateTime? cancellationReason,@JsonKey(name: 'cancelled_at') DateTime? cancelledAt,@JsonKey(name: 'no_show_note') String? noShowNote,@JsonKey(name: 'no_show_at') DateTime? noShowAt,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt, List<TourBookingMember>? members, TourReview? review
});


$TourReviewCopyWith<$Res>? get review;

}
/// @nodoc
class _$TourBookingCopyWithImpl<$Res>
    implements $TourBookingCopyWith<$Res> {
  _$TourBookingCopyWithImpl(this._self, this._then);

  final TourBooking _self;
  final $Res Function(TourBooking) _then;

/// Create a copy of TourBooking
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? userId = null,Object? tourInstanceId = freezed,Object? passengerName = null,Object? passengerPhone = null,Object? adultCount = null,Object? childCount = null,Object? totalPrice = null,Object? refundAmount = freezed,Object? specialNotes = freezed,Object? status = null,Object? coordinatorId = freezed,Object? coordinatorResponse = freezed,Object? cancellationReason = freezed,Object? cancelledAt = freezed,Object? noShowNote = freezed,Object? noShowAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? members = freezed,Object? review = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,tourInstanceId: freezed == tourInstanceId ? _self.tourInstanceId : tourInstanceId // ignore: cast_nullable_to_non_nullable
as String?,passengerName: null == passengerName ? _self.passengerName : passengerName // ignore: cast_nullable_to_non_nullable
as String,passengerPhone: null == passengerPhone ? _self.passengerPhone : passengerPhone // ignore: cast_nullable_to_non_nullable
as String,adultCount: null == adultCount ? _self.adultCount : adultCount // ignore: cast_nullable_to_non_nullable
as int,childCount: null == childCount ? _self.childCount : childCount // ignore: cast_nullable_to_non_nullable
as int,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,refundAmount: freezed == refundAmount ? _self.refundAmount : refundAmount // ignore: cast_nullable_to_non_nullable
as double?,specialNotes: freezed == specialNotes ? _self.specialNotes : specialNotes // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BookingStatus,coordinatorId: freezed == coordinatorId ? _self.coordinatorId : coordinatorId // ignore: cast_nullable_to_non_nullable
as String?,coordinatorResponse: freezed == coordinatorResponse ? _self.coordinatorResponse : coordinatorResponse // ignore: cast_nullable_to_non_nullable
as String?,cancellationReason: freezed == cancellationReason ? _self.cancellationReason : cancellationReason // ignore: cast_nullable_to_non_nullable
as DateTime?,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,noShowNote: freezed == noShowNote ? _self.noShowNote : noShowNote // ignore: cast_nullable_to_non_nullable
as String?,noShowAt: freezed == noShowAt ? _self.noShowAt : noShowAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,members: freezed == members ? _self.members : members // ignore: cast_nullable_to_non_nullable
as List<TourBookingMember>?,review: freezed == review ? _self.review : review // ignore: cast_nullable_to_non_nullable
as TourReview?,
  ));
}
/// Create a copy of TourBooking
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TourReviewCopyWith<$Res>? get review {
    if (_self.review == null) {
    return null;
  }

  return $TourReviewCopyWith<$Res>(_self.review!, (value) {
    return _then(_self.copyWith(review: value));
  });
}
}


/// Adds pattern-matching-related methods to [TourBooking].
extension TourBookingPatterns on TourBooking {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TourBooking value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TourBooking() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TourBooking value)  $default,){
final _that = this;
switch (_that) {
case _TourBooking():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TourBooking value)?  $default,){
final _that = this;
switch (_that) {
case _TourBooking() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'tour_instance_id')  String? tourInstanceId, @JsonKey(name: 'passenger_name')  String passengerName, @JsonKey(name: 'passenger_phone')  String passengerPhone, @JsonKey(name: 'adult_count')  int adultCount, @JsonKey(name: 'child_count')  int childCount, @JsonKey(name: 'total_price')  double totalPrice, @JsonKey(name: 'refund_amount')  double? refundAmount, @JsonKey(name: 'special_notes')  String? specialNotes,  BookingStatus status, @JsonKey(name: 'coordinator_id')  String? coordinatorId, @JsonKey(name: 'coordinator_response')  String? coordinatorResponse, @JsonKey(name: 'cancellation_reason')  DateTime? cancellationReason, @JsonKey(name: 'cancelled_at')  DateTime? cancelledAt, @JsonKey(name: 'no_show_note')  String? noShowNote, @JsonKey(name: 'no_show_at')  DateTime? noShowAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  List<TourBookingMember>? members,  TourReview? review)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TourBooking() when $default != null:
return $default(_that.id,_that.userId,_that.tourInstanceId,_that.passengerName,_that.passengerPhone,_that.adultCount,_that.childCount,_that.totalPrice,_that.refundAmount,_that.specialNotes,_that.status,_that.coordinatorId,_that.coordinatorResponse,_that.cancellationReason,_that.cancelledAt,_that.noShowNote,_that.noShowAt,_that.createdAt,_that.updatedAt,_that.members,_that.review);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'tour_instance_id')  String? tourInstanceId, @JsonKey(name: 'passenger_name')  String passengerName, @JsonKey(name: 'passenger_phone')  String passengerPhone, @JsonKey(name: 'adult_count')  int adultCount, @JsonKey(name: 'child_count')  int childCount, @JsonKey(name: 'total_price')  double totalPrice, @JsonKey(name: 'refund_amount')  double? refundAmount, @JsonKey(name: 'special_notes')  String? specialNotes,  BookingStatus status, @JsonKey(name: 'coordinator_id')  String? coordinatorId, @JsonKey(name: 'coordinator_response')  String? coordinatorResponse, @JsonKey(name: 'cancellation_reason')  DateTime? cancellationReason, @JsonKey(name: 'cancelled_at')  DateTime? cancelledAt, @JsonKey(name: 'no_show_note')  String? noShowNote, @JsonKey(name: 'no_show_at')  DateTime? noShowAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  List<TourBookingMember>? members,  TourReview? review)  $default,) {final _that = this;
switch (_that) {
case _TourBooking():
return $default(_that.id,_that.userId,_that.tourInstanceId,_that.passengerName,_that.passengerPhone,_that.adultCount,_that.childCount,_that.totalPrice,_that.refundAmount,_that.specialNotes,_that.status,_that.coordinatorId,_that.coordinatorResponse,_that.cancellationReason,_that.cancelledAt,_that.noShowNote,_that.noShowAt,_that.createdAt,_that.updatedAt,_that.members,_that.review);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'tour_instance_id')  String? tourInstanceId, @JsonKey(name: 'passenger_name')  String passengerName, @JsonKey(name: 'passenger_phone')  String passengerPhone, @JsonKey(name: 'adult_count')  int adultCount, @JsonKey(name: 'child_count')  int childCount, @JsonKey(name: 'total_price')  double totalPrice, @JsonKey(name: 'refund_amount')  double? refundAmount, @JsonKey(name: 'special_notes')  String? specialNotes,  BookingStatus status, @JsonKey(name: 'coordinator_id')  String? coordinatorId, @JsonKey(name: 'coordinator_response')  String? coordinatorResponse, @JsonKey(name: 'cancellation_reason')  DateTime? cancellationReason, @JsonKey(name: 'cancelled_at')  DateTime? cancelledAt, @JsonKey(name: 'no_show_note')  String? noShowNote, @JsonKey(name: 'no_show_at')  DateTime? noShowAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  List<TourBookingMember>? members,  TourReview? review)?  $default,) {final _that = this;
switch (_that) {
case _TourBooking() when $default != null:
return $default(_that.id,_that.userId,_that.tourInstanceId,_that.passengerName,_that.passengerPhone,_that.adultCount,_that.childCount,_that.totalPrice,_that.refundAmount,_that.specialNotes,_that.status,_that.coordinatorId,_that.coordinatorResponse,_that.cancellationReason,_that.cancelledAt,_that.noShowNote,_that.noShowAt,_that.createdAt,_that.updatedAt,_that.members,_that.review);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TourBooking implements TourBooking {
  const _TourBooking({this.id, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'tour_instance_id') required this.tourInstanceId, @JsonKey(name: 'passenger_name') required this.passengerName, @JsonKey(name: 'passenger_phone') required this.passengerPhone, @JsonKey(name: 'adult_count') required this.adultCount, @JsonKey(name: 'child_count') required this.childCount, @JsonKey(name: 'total_price') required this.totalPrice, @JsonKey(name: 'refund_amount') this.refundAmount, @JsonKey(name: 'special_notes') this.specialNotes, required this.status, @JsonKey(name: 'coordinator_id') this.coordinatorId, @JsonKey(name: 'coordinator_response') this.coordinatorResponse, @JsonKey(name: 'cancellation_reason') this.cancellationReason, @JsonKey(name: 'cancelled_at') this.cancelledAt, @JsonKey(name: 'no_show_note') this.noShowNote, @JsonKey(name: 'no_show_at') this.noShowAt, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, final  List<TourBookingMember>? members, this.review}): _members = members;
  factory _TourBooking.fromJson(Map<String, dynamic> json) => _$TourBookingFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'tour_instance_id') final  String? tourInstanceId;
@override@JsonKey(name: 'passenger_name') final  String passengerName;
@override@JsonKey(name: 'passenger_phone') final  String passengerPhone;
@override@JsonKey(name: 'adult_count') final  int adultCount;
@override@JsonKey(name: 'child_count') final  int childCount;
@override@JsonKey(name: 'total_price') final  double totalPrice;
@override@JsonKey(name: 'refund_amount') final  double? refundAmount;
@override@JsonKey(name: 'special_notes') final  String? specialNotes;
@override final  BookingStatus status;
@override@JsonKey(name: 'coordinator_id') final  String? coordinatorId;
@override@JsonKey(name: 'coordinator_response') final  String? coordinatorResponse;
@override@JsonKey(name: 'cancellation_reason') final  DateTime? cancellationReason;
@override@JsonKey(name: 'cancelled_at') final  DateTime? cancelledAt;
@override@JsonKey(name: 'no_show_note') final  String? noShowNote;
@override@JsonKey(name: 'no_show_at') final  DateTime? noShowAt;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;
/// RELATIONS
 final  List<TourBookingMember>? _members;
/// RELATIONS
@override List<TourBookingMember>? get members {
  final value = _members;
  if (value == null) return null;
  if (_members is EqualUnmodifiableListView) return _members;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  TourReview? review;

/// Create a copy of TourBooking
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TourBookingCopyWith<_TourBooking> get copyWith => __$TourBookingCopyWithImpl<_TourBooking>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TourBookingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TourBooking&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.tourInstanceId, tourInstanceId) || other.tourInstanceId == tourInstanceId)&&(identical(other.passengerName, passengerName) || other.passengerName == passengerName)&&(identical(other.passengerPhone, passengerPhone) || other.passengerPhone == passengerPhone)&&(identical(other.adultCount, adultCount) || other.adultCount == adultCount)&&(identical(other.childCount, childCount) || other.childCount == childCount)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.refundAmount, refundAmount) || other.refundAmount == refundAmount)&&(identical(other.specialNotes, specialNotes) || other.specialNotes == specialNotes)&&(identical(other.status, status) || other.status == status)&&(identical(other.coordinatorId, coordinatorId) || other.coordinatorId == coordinatorId)&&(identical(other.coordinatorResponse, coordinatorResponse) || other.coordinatorResponse == coordinatorResponse)&&(identical(other.cancellationReason, cancellationReason) || other.cancellationReason == cancellationReason)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&(identical(other.noShowNote, noShowNote) || other.noShowNote == noShowNote)&&(identical(other.noShowAt, noShowAt) || other.noShowAt == noShowAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._members, _members)&&(identical(other.review, review) || other.review == review));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,tourInstanceId,passengerName,passengerPhone,adultCount,childCount,totalPrice,refundAmount,specialNotes,status,coordinatorId,coordinatorResponse,cancellationReason,cancelledAt,noShowNote,noShowAt,createdAt,updatedAt,const DeepCollectionEquality().hash(_members),review]);

@override
String toString() {
  return 'TourBooking(id: $id, userId: $userId, tourInstanceId: $tourInstanceId, passengerName: $passengerName, passengerPhone: $passengerPhone, adultCount: $adultCount, childCount: $childCount, totalPrice: $totalPrice, refundAmount: $refundAmount, specialNotes: $specialNotes, status: $status, coordinatorId: $coordinatorId, coordinatorResponse: $coordinatorResponse, cancellationReason: $cancellationReason, cancelledAt: $cancelledAt, noShowNote: $noShowNote, noShowAt: $noShowAt, createdAt: $createdAt, updatedAt: $updatedAt, members: $members, review: $review)';
}


}

/// @nodoc
abstract mixin class _$TourBookingCopyWith<$Res> implements $TourBookingCopyWith<$Res> {
  factory _$TourBookingCopyWith(_TourBooking value, $Res Function(_TourBooking) _then) = __$TourBookingCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'tour_instance_id') String? tourInstanceId,@JsonKey(name: 'passenger_name') String passengerName,@JsonKey(name: 'passenger_phone') String passengerPhone,@JsonKey(name: 'adult_count') int adultCount,@JsonKey(name: 'child_count') int childCount,@JsonKey(name: 'total_price') double totalPrice,@JsonKey(name: 'refund_amount') double? refundAmount,@JsonKey(name: 'special_notes') String? specialNotes, BookingStatus status,@JsonKey(name: 'coordinator_id') String? coordinatorId,@JsonKey(name: 'coordinator_response') String? coordinatorResponse,@JsonKey(name: 'cancellation_reason') DateTime? cancellationReason,@JsonKey(name: 'cancelled_at') DateTime? cancelledAt,@JsonKey(name: 'no_show_note') String? noShowNote,@JsonKey(name: 'no_show_at') DateTime? noShowAt,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt, List<TourBookingMember>? members, TourReview? review
});


@override $TourReviewCopyWith<$Res>? get review;

}
/// @nodoc
class __$TourBookingCopyWithImpl<$Res>
    implements _$TourBookingCopyWith<$Res> {
  __$TourBookingCopyWithImpl(this._self, this._then);

  final _TourBooking _self;
  final $Res Function(_TourBooking) _then;

/// Create a copy of TourBooking
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? userId = null,Object? tourInstanceId = freezed,Object? passengerName = null,Object? passengerPhone = null,Object? adultCount = null,Object? childCount = null,Object? totalPrice = null,Object? refundAmount = freezed,Object? specialNotes = freezed,Object? status = null,Object? coordinatorId = freezed,Object? coordinatorResponse = freezed,Object? cancellationReason = freezed,Object? cancelledAt = freezed,Object? noShowNote = freezed,Object? noShowAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? members = freezed,Object? review = freezed,}) {
  return _then(_TourBooking(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,tourInstanceId: freezed == tourInstanceId ? _self.tourInstanceId : tourInstanceId // ignore: cast_nullable_to_non_nullable
as String?,passengerName: null == passengerName ? _self.passengerName : passengerName // ignore: cast_nullable_to_non_nullable
as String,passengerPhone: null == passengerPhone ? _self.passengerPhone : passengerPhone // ignore: cast_nullable_to_non_nullable
as String,adultCount: null == adultCount ? _self.adultCount : adultCount // ignore: cast_nullable_to_non_nullable
as int,childCount: null == childCount ? _self.childCount : childCount // ignore: cast_nullable_to_non_nullable
as int,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,refundAmount: freezed == refundAmount ? _self.refundAmount : refundAmount // ignore: cast_nullable_to_non_nullable
as double?,specialNotes: freezed == specialNotes ? _self.specialNotes : specialNotes // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BookingStatus,coordinatorId: freezed == coordinatorId ? _self.coordinatorId : coordinatorId // ignore: cast_nullable_to_non_nullable
as String?,coordinatorResponse: freezed == coordinatorResponse ? _self.coordinatorResponse : coordinatorResponse // ignore: cast_nullable_to_non_nullable
as String?,cancellationReason: freezed == cancellationReason ? _self.cancellationReason : cancellationReason // ignore: cast_nullable_to_non_nullable
as DateTime?,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,noShowNote: freezed == noShowNote ? _self.noShowNote : noShowNote // ignore: cast_nullable_to_non_nullable
as String?,noShowAt: freezed == noShowAt ? _self.noShowAt : noShowAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,members: freezed == members ? _self._members : members // ignore: cast_nullable_to_non_nullable
as List<TourBookingMember>?,review: freezed == review ? _self.review : review // ignore: cast_nullable_to_non_nullable
as TourReview?,
  ));
}

/// Create a copy of TourBooking
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TourReviewCopyWith<$Res>? get review {
    if (_self.review == null) {
    return null;
  }

  return $TourReviewCopyWith<$Res>(_self.review!, (value) {
    return _then(_self.copyWith(review: value));
  });
}
}

// dart format on
