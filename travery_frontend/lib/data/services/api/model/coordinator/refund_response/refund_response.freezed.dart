// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refund_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RefundResponse {

 String get id; String get userId; String get userName; String get userEmail; double get requestedAmount; double? get actualRefunded; String? get customerReason; String? get rejectReason; String get bookingType; String? get bankName; String? get accountNumber; String? get accountHolderName; String get createdAt; String get updatedAt;
/// Create a copy of RefundResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefundResponseCopyWith<RefundResponse> get copyWith => _$RefundResponseCopyWithImpl<RefundResponse>(this as RefundResponse, _$identity);

  /// Serializes this RefundResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefundResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.userEmail, userEmail) || other.userEmail == userEmail)&&(identical(other.requestedAmount, requestedAmount) || other.requestedAmount == requestedAmount)&&(identical(other.actualRefunded, actualRefunded) || other.actualRefunded == actualRefunded)&&(identical(other.customerReason, customerReason) || other.customerReason == customerReason)&&(identical(other.rejectReason, rejectReason) || other.rejectReason == rejectReason)&&(identical(other.bookingType, bookingType) || other.bookingType == bookingType)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.accountHolderName, accountHolderName) || other.accountHolderName == accountHolderName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,userName,userEmail,requestedAmount,actualRefunded,customerReason,rejectReason,bookingType,bankName,accountNumber,accountHolderName,createdAt,updatedAt);

@override
String toString() {
  return 'RefundResponse(id: $id, userId: $userId, userName: $userName, userEmail: $userEmail, requestedAmount: $requestedAmount, actualRefunded: $actualRefunded, customerReason: $customerReason, rejectReason: $rejectReason, bookingType: $bookingType, bankName: $bankName, accountNumber: $accountNumber, accountHolderName: $accountHolderName, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $RefundResponseCopyWith<$Res>  {
  factory $RefundResponseCopyWith(RefundResponse value, $Res Function(RefundResponse) _then) = _$RefundResponseCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String userName, String userEmail, double requestedAmount, double? actualRefunded, String? customerReason, String? rejectReason, String bookingType, String? bankName, String? accountNumber, String? accountHolderName, String createdAt, String updatedAt
});




}
/// @nodoc
class _$RefundResponseCopyWithImpl<$Res>
    implements $RefundResponseCopyWith<$Res> {
  _$RefundResponseCopyWithImpl(this._self, this._then);

  final RefundResponse _self;
  final $Res Function(RefundResponse) _then;

/// Create a copy of RefundResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? userName = null,Object? userEmail = null,Object? requestedAmount = null,Object? actualRefunded = freezed,Object? customerReason = freezed,Object? rejectReason = freezed,Object? bookingType = null,Object? bankName = freezed,Object? accountNumber = freezed,Object? accountHolderName = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,userEmail: null == userEmail ? _self.userEmail : userEmail // ignore: cast_nullable_to_non_nullable
as String,requestedAmount: null == requestedAmount ? _self.requestedAmount : requestedAmount // ignore: cast_nullable_to_non_nullable
as double,actualRefunded: freezed == actualRefunded ? _self.actualRefunded : actualRefunded // ignore: cast_nullable_to_non_nullable
as double?,customerReason: freezed == customerReason ? _self.customerReason : customerReason // ignore: cast_nullable_to_non_nullable
as String?,rejectReason: freezed == rejectReason ? _self.rejectReason : rejectReason // ignore: cast_nullable_to_non_nullable
as String?,bookingType: null == bookingType ? _self.bookingType : bookingType // ignore: cast_nullable_to_non_nullable
as String,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,accountNumber: freezed == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String?,accountHolderName: freezed == accountHolderName ? _self.accountHolderName : accountHolderName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RefundResponse].
extension RefundResponsePatterns on RefundResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RefundResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RefundResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RefundResponse value)  $default,){
final _that = this;
switch (_that) {
case _RefundResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RefundResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RefundResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String userName,  String userEmail,  double requestedAmount,  double? actualRefunded,  String? customerReason,  String? rejectReason,  String bookingType,  String? bankName,  String? accountNumber,  String? accountHolderName,  String createdAt,  String updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RefundResponse() when $default != null:
return $default(_that.id,_that.userId,_that.userName,_that.userEmail,_that.requestedAmount,_that.actualRefunded,_that.customerReason,_that.rejectReason,_that.bookingType,_that.bankName,_that.accountNumber,_that.accountHolderName,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String userName,  String userEmail,  double requestedAmount,  double? actualRefunded,  String? customerReason,  String? rejectReason,  String bookingType,  String? bankName,  String? accountNumber,  String? accountHolderName,  String createdAt,  String updatedAt)  $default,) {final _that = this;
switch (_that) {
case _RefundResponse():
return $default(_that.id,_that.userId,_that.userName,_that.userEmail,_that.requestedAmount,_that.actualRefunded,_that.customerReason,_that.rejectReason,_that.bookingType,_that.bankName,_that.accountNumber,_that.accountHolderName,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String userName,  String userEmail,  double requestedAmount,  double? actualRefunded,  String? customerReason,  String? rejectReason,  String bookingType,  String? bankName,  String? accountNumber,  String? accountHolderName,  String createdAt,  String updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _RefundResponse() when $default != null:
return $default(_that.id,_that.userId,_that.userName,_that.userEmail,_that.requestedAmount,_that.actualRefunded,_that.customerReason,_that.rejectReason,_that.bookingType,_that.bankName,_that.accountNumber,_that.accountHolderName,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RefundResponse implements RefundResponse {
  const _RefundResponse({required this.id, required this.userId, required this.userName, required this.userEmail, required this.requestedAmount, this.actualRefunded, this.customerReason, this.rejectReason, required this.bookingType, this.bankName, this.accountNumber, this.accountHolderName, required this.createdAt, required this.updatedAt});
  factory _RefundResponse.fromJson(Map<String, dynamic> json) => _$RefundResponseFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String userName;
@override final  String userEmail;
@override final  double requestedAmount;
@override final  double? actualRefunded;
@override final  String? customerReason;
@override final  String? rejectReason;
@override final  String bookingType;
@override final  String? bankName;
@override final  String? accountNumber;
@override final  String? accountHolderName;
@override final  String createdAt;
@override final  String updatedAt;

/// Create a copy of RefundResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefundResponseCopyWith<_RefundResponse> get copyWith => __$RefundResponseCopyWithImpl<_RefundResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RefundResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefundResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.userEmail, userEmail) || other.userEmail == userEmail)&&(identical(other.requestedAmount, requestedAmount) || other.requestedAmount == requestedAmount)&&(identical(other.actualRefunded, actualRefunded) || other.actualRefunded == actualRefunded)&&(identical(other.customerReason, customerReason) || other.customerReason == customerReason)&&(identical(other.rejectReason, rejectReason) || other.rejectReason == rejectReason)&&(identical(other.bookingType, bookingType) || other.bookingType == bookingType)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.accountHolderName, accountHolderName) || other.accountHolderName == accountHolderName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,userName,userEmail,requestedAmount,actualRefunded,customerReason,rejectReason,bookingType,bankName,accountNumber,accountHolderName,createdAt,updatedAt);

@override
String toString() {
  return 'RefundResponse(id: $id, userId: $userId, userName: $userName, userEmail: $userEmail, requestedAmount: $requestedAmount, actualRefunded: $actualRefunded, customerReason: $customerReason, rejectReason: $rejectReason, bookingType: $bookingType, bankName: $bankName, accountNumber: $accountNumber, accountHolderName: $accountHolderName, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$RefundResponseCopyWith<$Res> implements $RefundResponseCopyWith<$Res> {
  factory _$RefundResponseCopyWith(_RefundResponse value, $Res Function(_RefundResponse) _then) = __$RefundResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String userName, String userEmail, double requestedAmount, double? actualRefunded, String? customerReason, String? rejectReason, String bookingType, String? bankName, String? accountNumber, String? accountHolderName, String createdAt, String updatedAt
});




}
/// @nodoc
class __$RefundResponseCopyWithImpl<$Res>
    implements _$RefundResponseCopyWith<$Res> {
  __$RefundResponseCopyWithImpl(this._self, this._then);

  final _RefundResponse _self;
  final $Res Function(_RefundResponse) _then;

/// Create a copy of RefundResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? userName = null,Object? userEmail = null,Object? requestedAmount = null,Object? actualRefunded = freezed,Object? customerReason = freezed,Object? rejectReason = freezed,Object? bookingType = null,Object? bankName = freezed,Object? accountNumber = freezed,Object? accountHolderName = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_RefundResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,userEmail: null == userEmail ? _self.userEmail : userEmail // ignore: cast_nullable_to_non_nullable
as String,requestedAmount: null == requestedAmount ? _self.requestedAmount : requestedAmount // ignore: cast_nullable_to_non_nullable
as double,actualRefunded: freezed == actualRefunded ? _self.actualRefunded : actualRefunded // ignore: cast_nullable_to_non_nullable
as double?,customerReason: freezed == customerReason ? _self.customerReason : customerReason // ignore: cast_nullable_to_non_nullable
as String?,rejectReason: freezed == rejectReason ? _self.rejectReason : rejectReason // ignore: cast_nullable_to_non_nullable
as String?,bookingType: null == bookingType ? _self.bookingType : bookingType // ignore: cast_nullable_to_non_nullable
as String,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,accountNumber: freezed == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String?,accountHolderName: freezed == accountHolderName ? _self.accountHolderName : accountHolderName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
