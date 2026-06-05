// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tour_booking_member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TourBookingMember {

 String? get id;@JsonKey(name: 'tour_booking_id') String get tourBookingId;@JsonKey(name: 'full_name') String get fullName;@JsonKey(name: 'identity_number') String? get identityNumber;@JsonKey(name: 'identity_type') IdentityType? get identityType;@JsonKey(name: 'is_child') bool get isChild; BookingMemberStatus get status;@JsonKey(name: 'cancelled_at') DateTime? get cancelledAt;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of TourBookingMember
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TourBookingMemberCopyWith<TourBookingMember> get copyWith => _$TourBookingMemberCopyWithImpl<TourBookingMember>(this as TourBookingMember, _$identity);

  /// Serializes this TourBookingMember to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TourBookingMember&&(identical(other.id, id) || other.id == id)&&(identical(other.tourBookingId, tourBookingId) || other.tourBookingId == tourBookingId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.identityNumber, identityNumber) || other.identityNumber == identityNumber)&&(identical(other.identityType, identityType) || other.identityType == identityType)&&(identical(other.isChild, isChild) || other.isChild == isChild)&&(identical(other.status, status) || other.status == status)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tourBookingId,fullName,identityNumber,identityType,isChild,status,cancelledAt,createdAt,updatedAt);

@override
String toString() {
  return 'TourBookingMember(id: $id, tourBookingId: $tourBookingId, fullName: $fullName, identityNumber: $identityNumber, identityType: $identityType, isChild: $isChild, status: $status, cancelledAt: $cancelledAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TourBookingMemberCopyWith<$Res>  {
  factory $TourBookingMemberCopyWith(TourBookingMember value, $Res Function(TourBookingMember) _then) = _$TourBookingMemberCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'tour_booking_id') String tourBookingId,@JsonKey(name: 'full_name') String fullName,@JsonKey(name: 'identity_number') String? identityNumber,@JsonKey(name: 'identity_type') IdentityType? identityType,@JsonKey(name: 'is_child') bool isChild, BookingMemberStatus status,@JsonKey(name: 'cancelled_at') DateTime? cancelledAt,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$TourBookingMemberCopyWithImpl<$Res>
    implements $TourBookingMemberCopyWith<$Res> {
  _$TourBookingMemberCopyWithImpl(this._self, this._then);

  final TourBookingMember _self;
  final $Res Function(TourBookingMember) _then;

/// Create a copy of TourBookingMember
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? tourBookingId = null,Object? fullName = null,Object? identityNumber = freezed,Object? identityType = freezed,Object? isChild = null,Object? status = null,Object? cancelledAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,tourBookingId: null == tourBookingId ? _self.tourBookingId : tourBookingId // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,identityNumber: freezed == identityNumber ? _self.identityNumber : identityNumber // ignore: cast_nullable_to_non_nullable
as String?,identityType: freezed == identityType ? _self.identityType : identityType // ignore: cast_nullable_to_non_nullable
as IdentityType?,isChild: null == isChild ? _self.isChild : isChild // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BookingMemberStatus,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TourBookingMember].
extension TourBookingMemberPatterns on TourBookingMember {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TourBookingMember value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TourBookingMember() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TourBookingMember value)  $default,){
final _that = this;
switch (_that) {
case _TourBookingMember():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TourBookingMember value)?  $default,){
final _that = this;
switch (_that) {
case _TourBookingMember() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'tour_booking_id')  String tourBookingId, @JsonKey(name: 'full_name')  String fullName, @JsonKey(name: 'identity_number')  String? identityNumber, @JsonKey(name: 'identity_type')  IdentityType? identityType, @JsonKey(name: 'is_child')  bool isChild,  BookingMemberStatus status, @JsonKey(name: 'cancelled_at')  DateTime? cancelledAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TourBookingMember() when $default != null:
return $default(_that.id,_that.tourBookingId,_that.fullName,_that.identityNumber,_that.identityType,_that.isChild,_that.status,_that.cancelledAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'tour_booking_id')  String tourBookingId, @JsonKey(name: 'full_name')  String fullName, @JsonKey(name: 'identity_number')  String? identityNumber, @JsonKey(name: 'identity_type')  IdentityType? identityType, @JsonKey(name: 'is_child')  bool isChild,  BookingMemberStatus status, @JsonKey(name: 'cancelled_at')  DateTime? cancelledAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TourBookingMember():
return $default(_that.id,_that.tourBookingId,_that.fullName,_that.identityNumber,_that.identityType,_that.isChild,_that.status,_that.cancelledAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'tour_booking_id')  String tourBookingId, @JsonKey(name: 'full_name')  String fullName, @JsonKey(name: 'identity_number')  String? identityNumber, @JsonKey(name: 'identity_type')  IdentityType? identityType, @JsonKey(name: 'is_child')  bool isChild,  BookingMemberStatus status, @JsonKey(name: 'cancelled_at')  DateTime? cancelledAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TourBookingMember() when $default != null:
return $default(_that.id,_that.tourBookingId,_that.fullName,_that.identityNumber,_that.identityType,_that.isChild,_that.status,_that.cancelledAt,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TourBookingMember implements TourBookingMember {
  const _TourBookingMember({this.id, @JsonKey(name: 'tour_booking_id') required this.tourBookingId, @JsonKey(name: 'full_name') required this.fullName, @JsonKey(name: 'identity_number') this.identityNumber, @JsonKey(name: 'identity_type') this.identityType, @JsonKey(name: 'is_child') required this.isChild, required this.status, @JsonKey(name: 'cancelled_at') this.cancelledAt, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _TourBookingMember.fromJson(Map<String, dynamic> json) => _$TourBookingMemberFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'tour_booking_id') final  String tourBookingId;
@override@JsonKey(name: 'full_name') final  String fullName;
@override@JsonKey(name: 'identity_number') final  String? identityNumber;
@override@JsonKey(name: 'identity_type') final  IdentityType? identityType;
@override@JsonKey(name: 'is_child') final  bool isChild;
@override final  BookingMemberStatus status;
@override@JsonKey(name: 'cancelled_at') final  DateTime? cancelledAt;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of TourBookingMember
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TourBookingMemberCopyWith<_TourBookingMember> get copyWith => __$TourBookingMemberCopyWithImpl<_TourBookingMember>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TourBookingMemberToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TourBookingMember&&(identical(other.id, id) || other.id == id)&&(identical(other.tourBookingId, tourBookingId) || other.tourBookingId == tourBookingId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.identityNumber, identityNumber) || other.identityNumber == identityNumber)&&(identical(other.identityType, identityType) || other.identityType == identityType)&&(identical(other.isChild, isChild) || other.isChild == isChild)&&(identical(other.status, status) || other.status == status)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tourBookingId,fullName,identityNumber,identityType,isChild,status,cancelledAt,createdAt,updatedAt);

@override
String toString() {
  return 'TourBookingMember(id: $id, tourBookingId: $tourBookingId, fullName: $fullName, identityNumber: $identityNumber, identityType: $identityType, isChild: $isChild, status: $status, cancelledAt: $cancelledAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TourBookingMemberCopyWith<$Res> implements $TourBookingMemberCopyWith<$Res> {
  factory _$TourBookingMemberCopyWith(_TourBookingMember value, $Res Function(_TourBookingMember) _then) = __$TourBookingMemberCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'tour_booking_id') String tourBookingId,@JsonKey(name: 'full_name') String fullName,@JsonKey(name: 'identity_number') String? identityNumber,@JsonKey(name: 'identity_type') IdentityType? identityType,@JsonKey(name: 'is_child') bool isChild, BookingMemberStatus status,@JsonKey(name: 'cancelled_at') DateTime? cancelledAt,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$TourBookingMemberCopyWithImpl<$Res>
    implements _$TourBookingMemberCopyWith<$Res> {
  __$TourBookingMemberCopyWithImpl(this._self, this._then);

  final _TourBookingMember _self;
  final $Res Function(_TourBookingMember) _then;

/// Create a copy of TourBookingMember
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? tourBookingId = null,Object? fullName = null,Object? identityNumber = freezed,Object? identityType = freezed,Object? isChild = null,Object? status = null,Object? cancelledAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_TourBookingMember(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,tourBookingId: null == tourBookingId ? _self.tourBookingId : tourBookingId // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,identityNumber: freezed == identityNumber ? _self.identityNumber : identityNumber // ignore: cast_nullable_to_non_nullable
as String?,identityType: freezed == identityType ? _self.identityType : identityType // ignore: cast_nullable_to_non_nullable
as IdentityType?,isChild: null == isChild ? _self.isChild : isChild // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BookingMemberStatus,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
