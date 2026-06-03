// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_user_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdminUserResponse {

 String get id; String? get fullName; String? get email; String? get phoneNumber; String? get avatarUrl; String? get status; String? get role; String? get createdAt;
/// Create a copy of AdminUserResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminUserResponseCopyWith<AdminUserResponse> get copyWith => _$AdminUserResponseCopyWithImpl<AdminUserResponse>(this as AdminUserResponse, _$identity);

  /// Serializes this AdminUserResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminUserResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.role, role) || other.role == role)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,email,phoneNumber,avatarUrl,status,role,createdAt);

@override
String toString() {
  return 'AdminUserResponse(id: $id, fullName: $fullName, email: $email, phoneNumber: $phoneNumber, avatarUrl: $avatarUrl, status: $status, role: $role, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $AdminUserResponseCopyWith<$Res>  {
  factory $AdminUserResponseCopyWith(AdminUserResponse value, $Res Function(AdminUserResponse) _then) = _$AdminUserResponseCopyWithImpl;
@useResult
$Res call({
 String id, String? fullName, String? email, String? phoneNumber, String? avatarUrl, String? status, String? role, String? createdAt
});




}
/// @nodoc
class _$AdminUserResponseCopyWithImpl<$Res>
    implements $AdminUserResponseCopyWith<$Res> {
  _$AdminUserResponseCopyWithImpl(this._self, this._then);

  final AdminUserResponse _self;
  final $Res Function(AdminUserResponse) _then;

/// Create a copy of AdminUserResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fullName = freezed,Object? email = freezed,Object? phoneNumber = freezed,Object? avatarUrl = freezed,Object? status = freezed,Object? role = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminUserResponse].
extension AdminUserResponsePatterns on AdminUserResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminUserResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminUserResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminUserResponse value)  $default,){
final _that = this;
switch (_that) {
case _AdminUserResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminUserResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AdminUserResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? fullName,  String? email,  String? phoneNumber,  String? avatarUrl,  String? status,  String? role,  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminUserResponse() when $default != null:
return $default(_that.id,_that.fullName,_that.email,_that.phoneNumber,_that.avatarUrl,_that.status,_that.role,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? fullName,  String? email,  String? phoneNumber,  String? avatarUrl,  String? status,  String? role,  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case _AdminUserResponse():
return $default(_that.id,_that.fullName,_that.email,_that.phoneNumber,_that.avatarUrl,_that.status,_that.role,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? fullName,  String? email,  String? phoneNumber,  String? avatarUrl,  String? status,  String? role,  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _AdminUserResponse() when $default != null:
return $default(_that.id,_that.fullName,_that.email,_that.phoneNumber,_that.avatarUrl,_that.status,_that.role,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdminUserResponse implements AdminUserResponse {
  const _AdminUserResponse({required this.id, this.fullName, this.email, this.phoneNumber, this.avatarUrl, this.status, this.role, this.createdAt});
  factory _AdminUserResponse.fromJson(Map<String, dynamic> json) => _$AdminUserResponseFromJson(json);

@override final  String id;
@override final  String? fullName;
@override final  String? email;
@override final  String? phoneNumber;
@override final  String? avatarUrl;
@override final  String? status;
@override final  String? role;
@override final  String? createdAt;

/// Create a copy of AdminUserResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminUserResponseCopyWith<_AdminUserResponse> get copyWith => __$AdminUserResponseCopyWithImpl<_AdminUserResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminUserResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminUserResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.role, role) || other.role == role)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,email,phoneNumber,avatarUrl,status,role,createdAt);

@override
String toString() {
  return 'AdminUserResponse(id: $id, fullName: $fullName, email: $email, phoneNumber: $phoneNumber, avatarUrl: $avatarUrl, status: $status, role: $role, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$AdminUserResponseCopyWith<$Res> implements $AdminUserResponseCopyWith<$Res> {
  factory _$AdminUserResponseCopyWith(_AdminUserResponse value, $Res Function(_AdminUserResponse) _then) = __$AdminUserResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, String? fullName, String? email, String? phoneNumber, String? avatarUrl, String? status, String? role, String? createdAt
});




}
/// @nodoc
class __$AdminUserResponseCopyWithImpl<$Res>
    implements _$AdminUserResponseCopyWith<$Res> {
  __$AdminUserResponseCopyWithImpl(this._self, this._then);

  final _AdminUserResponse _self;
  final $Res Function(_AdminUserResponse) _then;

/// Create a copy of AdminUserResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fullName = freezed,Object? email = freezed,Object? phoneNumber = freezed,Object? avatarUrl = freezed,Object? status = freezed,Object? role = freezed,Object? createdAt = freezed,}) {
  return _then(_AdminUserResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
