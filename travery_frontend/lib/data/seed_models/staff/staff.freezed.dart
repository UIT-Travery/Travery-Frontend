// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'staff.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Staff {

 String? get id;@JsonKey(name: 'hotel_id') String? get hotelId;@JsonKey(name: 'full_name') String get fullName; String get email;@JsonKey(name: 'phone_number') String? get phoneNumber;@JsonKey(name: 'password_hash') String? get passwordHash; StaffRole get role; StaffStatus get status;@JsonKey(name: 'cometchat_uid') String? get cometchatUid;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;@JsonKey(name: 'deleted_at') DateTime? get deletedAt;
/// Create a copy of Staff
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StaffCopyWith<Staff> get copyWith => _$StaffCopyWithImpl<Staff>(this as Staff, _$identity);

  /// Serializes this Staff to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Staff&&(identical(other.id, id) || other.id == id)&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.passwordHash, passwordHash) || other.passwordHash == passwordHash)&&(identical(other.role, role) || other.role == role)&&(identical(other.status, status) || other.status == status)&&(identical(other.cometchatUid, cometchatUid) || other.cometchatUid == cometchatUid)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,hotelId,fullName,email,phoneNumber,passwordHash,role,status,cometchatUid,createdAt,updatedAt,deletedAt);

@override
String toString() {
  return 'Staff(id: $id, hotelId: $hotelId, fullName: $fullName, email: $email, phoneNumber: $phoneNumber, passwordHash: $passwordHash, role: $role, status: $status, cometchatUid: $cometchatUid, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $StaffCopyWith<$Res>  {
  factory $StaffCopyWith(Staff value, $Res Function(Staff) _then) = _$StaffCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'hotel_id') String? hotelId,@JsonKey(name: 'full_name') String fullName, String email,@JsonKey(name: 'phone_number') String? phoneNumber,@JsonKey(name: 'password_hash') String? passwordHash, StaffRole role, StaffStatus status,@JsonKey(name: 'cometchat_uid') String? cometchatUid,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'deleted_at') DateTime? deletedAt
});




}
/// @nodoc
class _$StaffCopyWithImpl<$Res>
    implements $StaffCopyWith<$Res> {
  _$StaffCopyWithImpl(this._self, this._then);

  final Staff _self;
  final $Res Function(Staff) _then;

/// Create a copy of Staff
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? hotelId = freezed,Object? fullName = null,Object? email = null,Object? phoneNumber = freezed,Object? passwordHash = freezed,Object? role = null,Object? status = null,Object? cometchatUid = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,hotelId: freezed == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String?,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,passwordHash: freezed == passwordHash ? _self.passwordHash : passwordHash // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as StaffRole,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StaffStatus,cometchatUid: freezed == cometchatUid ? _self.cometchatUid : cometchatUid // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Staff].
extension StaffPatterns on Staff {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Staff value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Staff() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Staff value)  $default,){
final _that = this;
switch (_that) {
case _Staff():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Staff value)?  $default,){
final _that = this;
switch (_that) {
case _Staff() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'hotel_id')  String? hotelId, @JsonKey(name: 'full_name')  String fullName,  String email, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'password_hash')  String? passwordHash,  StaffRole role,  StaffStatus status, @JsonKey(name: 'cometchat_uid')  String? cometchatUid, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'deleted_at')  DateTime? deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Staff() when $default != null:
return $default(_that.id,_that.hotelId,_that.fullName,_that.email,_that.phoneNumber,_that.passwordHash,_that.role,_that.status,_that.cometchatUid,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'hotel_id')  String? hotelId, @JsonKey(name: 'full_name')  String fullName,  String email, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'password_hash')  String? passwordHash,  StaffRole role,  StaffStatus status, @JsonKey(name: 'cometchat_uid')  String? cometchatUid, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'deleted_at')  DateTime? deletedAt)  $default,) {final _that = this;
switch (_that) {
case _Staff():
return $default(_that.id,_that.hotelId,_that.fullName,_that.email,_that.phoneNumber,_that.passwordHash,_that.role,_that.status,_that.cometchatUid,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'hotel_id')  String? hotelId, @JsonKey(name: 'full_name')  String fullName,  String email, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'password_hash')  String? passwordHash,  StaffRole role,  StaffStatus status, @JsonKey(name: 'cometchat_uid')  String? cometchatUid, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'deleted_at')  DateTime? deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _Staff() when $default != null:
return $default(_that.id,_that.hotelId,_that.fullName,_that.email,_that.phoneNumber,_that.passwordHash,_that.role,_that.status,_that.cometchatUid,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Staff implements Staff {
  const _Staff({this.id, @JsonKey(name: 'hotel_id') this.hotelId, @JsonKey(name: 'full_name') required this.fullName, required this.email, @JsonKey(name: 'phone_number') this.phoneNumber, @JsonKey(name: 'password_hash') this.passwordHash, required this.role, required this.status, @JsonKey(name: 'cometchat_uid') this.cometchatUid, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'deleted_at') this.deletedAt});
  factory _Staff.fromJson(Map<String, dynamic> json) => _$StaffFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'hotel_id') final  String? hotelId;
@override@JsonKey(name: 'full_name') final  String fullName;
@override final  String email;
@override@JsonKey(name: 'phone_number') final  String? phoneNumber;
@override@JsonKey(name: 'password_hash') final  String? passwordHash;
@override final  StaffRole role;
@override final  StaffStatus status;
@override@JsonKey(name: 'cometchat_uid') final  String? cometchatUid;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;
@override@JsonKey(name: 'deleted_at') final  DateTime? deletedAt;

/// Create a copy of Staff
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StaffCopyWith<_Staff> get copyWith => __$StaffCopyWithImpl<_Staff>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StaffToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Staff&&(identical(other.id, id) || other.id == id)&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.passwordHash, passwordHash) || other.passwordHash == passwordHash)&&(identical(other.role, role) || other.role == role)&&(identical(other.status, status) || other.status == status)&&(identical(other.cometchatUid, cometchatUid) || other.cometchatUid == cometchatUid)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,hotelId,fullName,email,phoneNumber,passwordHash,role,status,cometchatUid,createdAt,updatedAt,deletedAt);

@override
String toString() {
  return 'Staff(id: $id, hotelId: $hotelId, fullName: $fullName, email: $email, phoneNumber: $phoneNumber, passwordHash: $passwordHash, role: $role, status: $status, cometchatUid: $cometchatUid, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$StaffCopyWith<$Res> implements $StaffCopyWith<$Res> {
  factory _$StaffCopyWith(_Staff value, $Res Function(_Staff) _then) = __$StaffCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'hotel_id') String? hotelId,@JsonKey(name: 'full_name') String fullName, String email,@JsonKey(name: 'phone_number') String? phoneNumber,@JsonKey(name: 'password_hash') String? passwordHash, StaffRole role, StaffStatus status,@JsonKey(name: 'cometchat_uid') String? cometchatUid,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'deleted_at') DateTime? deletedAt
});




}
/// @nodoc
class __$StaffCopyWithImpl<$Res>
    implements _$StaffCopyWith<$Res> {
  __$StaffCopyWithImpl(this._self, this._then);

  final _Staff _self;
  final $Res Function(_Staff) _then;

/// Create a copy of Staff
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? hotelId = freezed,Object? fullName = null,Object? email = null,Object? phoneNumber = freezed,Object? passwordHash = freezed,Object? role = null,Object? status = null,Object? cometchatUid = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,}) {
  return _then(_Staff(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,hotelId: freezed == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as String?,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,passwordHash: freezed == passwordHash ? _self.passwordHash : passwordHash // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as StaffRole,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StaffStatus,cometchatUid: freezed == cometchatUid ? _self.cometchatUid : cometchatUid // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
