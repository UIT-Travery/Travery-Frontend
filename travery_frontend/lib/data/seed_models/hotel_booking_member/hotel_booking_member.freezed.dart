// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hotel_booking_member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HotelBookingMember {

 String? get id;@JsonKey(name: 'hotel_booking_id') String get hotelBookingId;@JsonKey(name: 'full_name') String get fullName; String get cccd;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of HotelBookingMember
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HotelBookingMemberCopyWith<HotelBookingMember> get copyWith => _$HotelBookingMemberCopyWithImpl<HotelBookingMember>(this as HotelBookingMember, _$identity);

  /// Serializes this HotelBookingMember to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HotelBookingMember&&(identical(other.id, id) || other.id == id)&&(identical(other.hotelBookingId, hotelBookingId) || other.hotelBookingId == hotelBookingId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.cccd, cccd) || other.cccd == cccd)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,hotelBookingId,fullName,cccd,createdAt,updatedAt);

@override
String toString() {
  return 'HotelBookingMember(id: $id, hotelBookingId: $hotelBookingId, fullName: $fullName, cccd: $cccd, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $HotelBookingMemberCopyWith<$Res>  {
  factory $HotelBookingMemberCopyWith(HotelBookingMember value, $Res Function(HotelBookingMember) _then) = _$HotelBookingMemberCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'hotel_booking_id') String hotelBookingId,@JsonKey(name: 'full_name') String fullName, String cccd,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$HotelBookingMemberCopyWithImpl<$Res>
    implements $HotelBookingMemberCopyWith<$Res> {
  _$HotelBookingMemberCopyWithImpl(this._self, this._then);

  final HotelBookingMember _self;
  final $Res Function(HotelBookingMember) _then;

/// Create a copy of HotelBookingMember
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? hotelBookingId = null,Object? fullName = null,Object? cccd = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,hotelBookingId: null == hotelBookingId ? _self.hotelBookingId : hotelBookingId // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,cccd: null == cccd ? _self.cccd : cccd // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [HotelBookingMember].
extension HotelBookingMemberPatterns on HotelBookingMember {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HotelBookingMember value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HotelBookingMember() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HotelBookingMember value)  $default,){
final _that = this;
switch (_that) {
case _HotelBookingMember():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HotelBookingMember value)?  $default,){
final _that = this;
switch (_that) {
case _HotelBookingMember() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'hotel_booking_id')  String hotelBookingId, @JsonKey(name: 'full_name')  String fullName,  String cccd, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HotelBookingMember() when $default != null:
return $default(_that.id,_that.hotelBookingId,_that.fullName,_that.cccd,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'hotel_booking_id')  String hotelBookingId, @JsonKey(name: 'full_name')  String fullName,  String cccd, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _HotelBookingMember():
return $default(_that.id,_that.hotelBookingId,_that.fullName,_that.cccd,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'hotel_booking_id')  String hotelBookingId, @JsonKey(name: 'full_name')  String fullName,  String cccd, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _HotelBookingMember() when $default != null:
return $default(_that.id,_that.hotelBookingId,_that.fullName,_that.cccd,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HotelBookingMember implements HotelBookingMember {
  const _HotelBookingMember({this.id, @JsonKey(name: 'hotel_booking_id') required this.hotelBookingId, @JsonKey(name: 'full_name') required this.fullName, required this.cccd, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _HotelBookingMember.fromJson(Map<String, dynamic> json) => _$HotelBookingMemberFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'hotel_booking_id') final  String hotelBookingId;
@override@JsonKey(name: 'full_name') final  String fullName;
@override final  String cccd;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of HotelBookingMember
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HotelBookingMemberCopyWith<_HotelBookingMember> get copyWith => __$HotelBookingMemberCopyWithImpl<_HotelBookingMember>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HotelBookingMemberToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HotelBookingMember&&(identical(other.id, id) || other.id == id)&&(identical(other.hotelBookingId, hotelBookingId) || other.hotelBookingId == hotelBookingId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.cccd, cccd) || other.cccd == cccd)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,hotelBookingId,fullName,cccd,createdAt,updatedAt);

@override
String toString() {
  return 'HotelBookingMember(id: $id, hotelBookingId: $hotelBookingId, fullName: $fullName, cccd: $cccd, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$HotelBookingMemberCopyWith<$Res> implements $HotelBookingMemberCopyWith<$Res> {
  factory _$HotelBookingMemberCopyWith(_HotelBookingMember value, $Res Function(_HotelBookingMember) _then) = __$HotelBookingMemberCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'hotel_booking_id') String hotelBookingId,@JsonKey(name: 'full_name') String fullName, String cccd,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$HotelBookingMemberCopyWithImpl<$Res>
    implements _$HotelBookingMemberCopyWith<$Res> {
  __$HotelBookingMemberCopyWithImpl(this._self, this._then);

  final _HotelBookingMember _self;
  final $Res Function(_HotelBookingMember) _then;

/// Create a copy of HotelBookingMember
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? hotelBookingId = null,Object? fullName = null,Object? cccd = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_HotelBookingMember(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,hotelBookingId: null == hotelBookingId ? _self.hotelBookingId : hotelBookingId // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,cccd: null == cccd ? _self.cccd : cccd // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
