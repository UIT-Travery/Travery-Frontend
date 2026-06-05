// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_payment_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreatePaymentResponse {

 int get httpStatus; String get message; PaymentResponseData get data;
/// Create a copy of CreatePaymentResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePaymentResponseCopyWith<CreatePaymentResponse> get copyWith => _$CreatePaymentResponseCopyWithImpl<CreatePaymentResponse>(this as CreatePaymentResponse, _$identity);

  /// Serializes this CreatePaymentResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePaymentResponse&&(identical(other.httpStatus, httpStatus) || other.httpStatus == httpStatus)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,httpStatus,message,data);

@override
String toString() {
  return 'CreatePaymentResponse(httpStatus: $httpStatus, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $CreatePaymentResponseCopyWith<$Res>  {
  factory $CreatePaymentResponseCopyWith(CreatePaymentResponse value, $Res Function(CreatePaymentResponse) _then) = _$CreatePaymentResponseCopyWithImpl;
@useResult
$Res call({
 int httpStatus, String message, PaymentResponseData data
});


$PaymentResponseDataCopyWith<$Res> get data;

}
/// @nodoc
class _$CreatePaymentResponseCopyWithImpl<$Res>
    implements $CreatePaymentResponseCopyWith<$Res> {
  _$CreatePaymentResponseCopyWithImpl(this._self, this._then);

  final CreatePaymentResponse _self;
  final $Res Function(CreatePaymentResponse) _then;

/// Create a copy of CreatePaymentResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? httpStatus = null,Object? message = null,Object? data = null,}) {
  return _then(_self.copyWith(
httpStatus: null == httpStatus ? _self.httpStatus : httpStatus // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as PaymentResponseData,
  ));
}
/// Create a copy of CreatePaymentResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentResponseDataCopyWith<$Res> get data {
  
  return $PaymentResponseDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreatePaymentResponse].
extension CreatePaymentResponsePatterns on CreatePaymentResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreatePaymentResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreatePaymentResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreatePaymentResponse value)  $default,){
final _that = this;
switch (_that) {
case _CreatePaymentResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreatePaymentResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CreatePaymentResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int httpStatus,  String message,  PaymentResponseData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreatePaymentResponse() when $default != null:
return $default(_that.httpStatus,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int httpStatus,  String message,  PaymentResponseData data)  $default,) {final _that = this;
switch (_that) {
case _CreatePaymentResponse():
return $default(_that.httpStatus,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int httpStatus,  String message,  PaymentResponseData data)?  $default,) {final _that = this;
switch (_that) {
case _CreatePaymentResponse() when $default != null:
return $default(_that.httpStatus,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreatePaymentResponse implements CreatePaymentResponse {
  const _CreatePaymentResponse({required this.httpStatus, required this.message, required this.data});
  factory _CreatePaymentResponse.fromJson(Map<String, dynamic> json) => _$CreatePaymentResponseFromJson(json);

@override final  int httpStatus;
@override final  String message;
@override final  PaymentResponseData data;

/// Create a copy of CreatePaymentResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatePaymentResponseCopyWith<_CreatePaymentResponse> get copyWith => __$CreatePaymentResponseCopyWithImpl<_CreatePaymentResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreatePaymentResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatePaymentResponse&&(identical(other.httpStatus, httpStatus) || other.httpStatus == httpStatus)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,httpStatus,message,data);

@override
String toString() {
  return 'CreatePaymentResponse(httpStatus: $httpStatus, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$CreatePaymentResponseCopyWith<$Res> implements $CreatePaymentResponseCopyWith<$Res> {
  factory _$CreatePaymentResponseCopyWith(_CreatePaymentResponse value, $Res Function(_CreatePaymentResponse) _then) = __$CreatePaymentResponseCopyWithImpl;
@override @useResult
$Res call({
 int httpStatus, String message, PaymentResponseData data
});


@override $PaymentResponseDataCopyWith<$Res> get data;

}
/// @nodoc
class __$CreatePaymentResponseCopyWithImpl<$Res>
    implements _$CreatePaymentResponseCopyWith<$Res> {
  __$CreatePaymentResponseCopyWithImpl(this._self, this._then);

  final _CreatePaymentResponse _self;
  final $Res Function(_CreatePaymentResponse) _then;

/// Create a copy of CreatePaymentResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? httpStatus = null,Object? message = null,Object? data = null,}) {
  return _then(_CreatePaymentResponse(
httpStatus: null == httpStatus ? _self.httpStatus : httpStatus // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as PaymentResponseData,
  ));
}

/// Create a copy of CreatePaymentResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentResponseDataCopyWith<$Res> get data {
  
  return $PaymentResponseDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$PaymentResponseData {

 String get transactionId; double get amount; String get paymentUrl; String? get expiresAt;
/// Create a copy of PaymentResponseData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentResponseDataCopyWith<PaymentResponseData> get copyWith => _$PaymentResponseDataCopyWithImpl<PaymentResponseData>(this as PaymentResponseData, _$identity);

  /// Serializes this PaymentResponseData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentResponseData&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentUrl, paymentUrl) || other.paymentUrl == paymentUrl)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,transactionId,amount,paymentUrl,expiresAt);

@override
String toString() {
  return 'PaymentResponseData(transactionId: $transactionId, amount: $amount, paymentUrl: $paymentUrl, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class $PaymentResponseDataCopyWith<$Res>  {
  factory $PaymentResponseDataCopyWith(PaymentResponseData value, $Res Function(PaymentResponseData) _then) = _$PaymentResponseDataCopyWithImpl;
@useResult
$Res call({
 String transactionId, double amount, String paymentUrl, String? expiresAt
});




}
/// @nodoc
class _$PaymentResponseDataCopyWithImpl<$Res>
    implements $PaymentResponseDataCopyWith<$Res> {
  _$PaymentResponseDataCopyWithImpl(this._self, this._then);

  final PaymentResponseData _self;
  final $Res Function(PaymentResponseData) _then;

/// Create a copy of PaymentResponseData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? transactionId = null,Object? amount = null,Object? paymentUrl = null,Object? expiresAt = freezed,}) {
  return _then(_self.copyWith(
transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,paymentUrl: null == paymentUrl ? _self.paymentUrl : paymentUrl // ignore: cast_nullable_to_non_nullable
as String,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentResponseData].
extension PaymentResponseDataPatterns on PaymentResponseData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentResponseData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentResponseData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentResponseData value)  $default,){
final _that = this;
switch (_that) {
case _PaymentResponseData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentResponseData value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentResponseData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String transactionId,  double amount,  String paymentUrl,  String? expiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentResponseData() when $default != null:
return $default(_that.transactionId,_that.amount,_that.paymentUrl,_that.expiresAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String transactionId,  double amount,  String paymentUrl,  String? expiresAt)  $default,) {final _that = this;
switch (_that) {
case _PaymentResponseData():
return $default(_that.transactionId,_that.amount,_that.paymentUrl,_that.expiresAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String transactionId,  double amount,  String paymentUrl,  String? expiresAt)?  $default,) {final _that = this;
switch (_that) {
case _PaymentResponseData() when $default != null:
return $default(_that.transactionId,_that.amount,_that.paymentUrl,_that.expiresAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentResponseData implements PaymentResponseData {
  const _PaymentResponseData({required this.transactionId, required this.amount, required this.paymentUrl, this.expiresAt});
  factory _PaymentResponseData.fromJson(Map<String, dynamic> json) => _$PaymentResponseDataFromJson(json);

@override final  String transactionId;
@override final  double amount;
@override final  String paymentUrl;
@override final  String? expiresAt;

/// Create a copy of PaymentResponseData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentResponseDataCopyWith<_PaymentResponseData> get copyWith => __$PaymentResponseDataCopyWithImpl<_PaymentResponseData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentResponseDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentResponseData&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentUrl, paymentUrl) || other.paymentUrl == paymentUrl)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,transactionId,amount,paymentUrl,expiresAt);

@override
String toString() {
  return 'PaymentResponseData(transactionId: $transactionId, amount: $amount, paymentUrl: $paymentUrl, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class _$PaymentResponseDataCopyWith<$Res> implements $PaymentResponseDataCopyWith<$Res> {
  factory _$PaymentResponseDataCopyWith(_PaymentResponseData value, $Res Function(_PaymentResponseData) _then) = __$PaymentResponseDataCopyWithImpl;
@override @useResult
$Res call({
 String transactionId, double amount, String paymentUrl, String? expiresAt
});




}
/// @nodoc
class __$PaymentResponseDataCopyWithImpl<$Res>
    implements _$PaymentResponseDataCopyWith<$Res> {
  __$PaymentResponseDataCopyWithImpl(this._self, this._then);

  final _PaymentResponseData _self;
  final $Res Function(_PaymentResponseData) _then;

/// Create a copy of PaymentResponseData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? transactionId = null,Object? amount = null,Object? paymentUrl = null,Object? expiresAt = freezed,}) {
  return _then(_PaymentResponseData(
transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,paymentUrl: null == paymentUrl ? _self.paymentUrl : paymentUrl // ignore: cast_nullable_to_non_nullable
as String,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
