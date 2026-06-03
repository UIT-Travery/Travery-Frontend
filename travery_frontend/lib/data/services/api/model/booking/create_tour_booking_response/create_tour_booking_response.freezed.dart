// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_tour_booking_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateTourBookingResponse {

 TourBookingData get data;
/// Create a copy of CreateTourBookingResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTourBookingResponseCopyWith<CreateTourBookingResponse> get copyWith => _$CreateTourBookingResponseCopyWithImpl<CreateTourBookingResponse>(this as CreateTourBookingResponse, _$identity);

  /// Serializes this CreateTourBookingResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTourBookingResponse&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'CreateTourBookingResponse(data: $data)';
}


}

/// @nodoc
abstract mixin class $CreateTourBookingResponseCopyWith<$Res>  {
  factory $CreateTourBookingResponseCopyWith(CreateTourBookingResponse value, $Res Function(CreateTourBookingResponse) _then) = _$CreateTourBookingResponseCopyWithImpl;
@useResult
$Res call({
 TourBookingData data
});


$TourBookingDataCopyWith<$Res> get data;

}
/// @nodoc
class _$CreateTourBookingResponseCopyWithImpl<$Res>
    implements $CreateTourBookingResponseCopyWith<$Res> {
  _$CreateTourBookingResponseCopyWithImpl(this._self, this._then);

  final CreateTourBookingResponse _self;
  final $Res Function(CreateTourBookingResponse) _then;

/// Create a copy of CreateTourBookingResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as TourBookingData,
  ));
}
/// Create a copy of CreateTourBookingResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TourBookingDataCopyWith<$Res> get data {
  
  return $TourBookingDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreateTourBookingResponse].
extension CreateTourBookingResponsePatterns on CreateTourBookingResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateTourBookingResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateTourBookingResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateTourBookingResponse value)  $default,){
final _that = this;
switch (_that) {
case _CreateTourBookingResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateTourBookingResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CreateTourBookingResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TourBookingData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateTourBookingResponse() when $default != null:
return $default(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TourBookingData data)  $default,) {final _that = this;
switch (_that) {
case _CreateTourBookingResponse():
return $default(_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TourBookingData data)?  $default,) {final _that = this;
switch (_that) {
case _CreateTourBookingResponse() when $default != null:
return $default(_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateTourBookingResponse implements CreateTourBookingResponse {
  const _CreateTourBookingResponse({required this.data});
  factory _CreateTourBookingResponse.fromJson(Map<String, dynamic> json) => _$CreateTourBookingResponseFromJson(json);

@override final  TourBookingData data;

/// Create a copy of CreateTourBookingResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTourBookingResponseCopyWith<_CreateTourBookingResponse> get copyWith => __$CreateTourBookingResponseCopyWithImpl<_CreateTourBookingResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateTourBookingResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTourBookingResponse&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'CreateTourBookingResponse(data: $data)';
}


}

/// @nodoc
abstract mixin class _$CreateTourBookingResponseCopyWith<$Res> implements $CreateTourBookingResponseCopyWith<$Res> {
  factory _$CreateTourBookingResponseCopyWith(_CreateTourBookingResponse value, $Res Function(_CreateTourBookingResponse) _then) = __$CreateTourBookingResponseCopyWithImpl;
@override @useResult
$Res call({
 TourBookingData data
});


@override $TourBookingDataCopyWith<$Res> get data;

}
/// @nodoc
class __$CreateTourBookingResponseCopyWithImpl<$Res>
    implements _$CreateTourBookingResponseCopyWith<$Res> {
  __$CreateTourBookingResponseCopyWithImpl(this._self, this._then);

  final _CreateTourBookingResponse _self;
  final $Res Function(_CreateTourBookingResponse) _then;

/// Create a copy of CreateTourBookingResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_CreateTourBookingResponse(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as TourBookingData,
  ));
}

/// Create a copy of CreateTourBookingResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TourBookingDataCopyWith<$Res> get data {
  
  return $TourBookingDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$TourBookingData {

 String get id; String get customerName; String get customerPhone; String get specialRequests; String get status; double get totalPrice; double get pricePerAdultAtBooking; double get pricePerChildAtBooking; String? get paymentDeadline; String get tourName; String get startDate; String get endDate; List<BookingMemberData> get members; PaymentData? get payment; String get paymentMethod; String get paymentStatus; String get transactionId; String get gatewayTransactionId;
/// Create a copy of TourBookingData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TourBookingDataCopyWith<TourBookingData> get copyWith => _$TourBookingDataCopyWithImpl<TourBookingData>(this as TourBookingData, _$identity);

  /// Serializes this TourBookingData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TourBookingData&&(identical(other.id, id) || other.id == id)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.customerPhone, customerPhone) || other.customerPhone == customerPhone)&&(identical(other.specialRequests, specialRequests) || other.specialRequests == specialRequests)&&(identical(other.status, status) || other.status == status)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.pricePerAdultAtBooking, pricePerAdultAtBooking) || other.pricePerAdultAtBooking == pricePerAdultAtBooking)&&(identical(other.pricePerChildAtBooking, pricePerChildAtBooking) || other.pricePerChildAtBooking == pricePerChildAtBooking)&&(identical(other.paymentDeadline, paymentDeadline) || other.paymentDeadline == paymentDeadline)&&(identical(other.tourName, tourName) || other.tourName == tourName)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other.members, members)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.gatewayTransactionId, gatewayTransactionId) || other.gatewayTransactionId == gatewayTransactionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,customerName,customerPhone,specialRequests,status,totalPrice,pricePerAdultAtBooking,pricePerChildAtBooking,paymentDeadline,tourName,startDate,endDate,const DeepCollectionEquality().hash(members),payment,paymentMethod,paymentStatus,transactionId,gatewayTransactionId);

@override
String toString() {
  return 'TourBookingData(id: $id, customerName: $customerName, customerPhone: $customerPhone, specialRequests: $specialRequests, status: $status, totalPrice: $totalPrice, pricePerAdultAtBooking: $pricePerAdultAtBooking, pricePerChildAtBooking: $pricePerChildAtBooking, paymentDeadline: $paymentDeadline, tourName: $tourName, startDate: $startDate, endDate: $endDate, members: $members, payment: $payment, paymentMethod: $paymentMethod, paymentStatus: $paymentStatus, transactionId: $transactionId, gatewayTransactionId: $gatewayTransactionId)';
}


}

/// @nodoc
abstract mixin class $TourBookingDataCopyWith<$Res>  {
  factory $TourBookingDataCopyWith(TourBookingData value, $Res Function(TourBookingData) _then) = _$TourBookingDataCopyWithImpl;
@useResult
$Res call({
 String id, String customerName, String customerPhone, String specialRequests, String status, double totalPrice, double pricePerAdultAtBooking, double pricePerChildAtBooking, String? paymentDeadline, String tourName, String startDate, String endDate, List<BookingMemberData> members, PaymentData? payment, String paymentMethod, String paymentStatus, String transactionId, String gatewayTransactionId
});


$PaymentDataCopyWith<$Res>? get payment;

}
/// @nodoc
class _$TourBookingDataCopyWithImpl<$Res>
    implements $TourBookingDataCopyWith<$Res> {
  _$TourBookingDataCopyWithImpl(this._self, this._then);

  final TourBookingData _self;
  final $Res Function(TourBookingData) _then;

/// Create a copy of TourBookingData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? customerName = null,Object? customerPhone = null,Object? specialRequests = null,Object? status = null,Object? totalPrice = null,Object? pricePerAdultAtBooking = null,Object? pricePerChildAtBooking = null,Object? paymentDeadline = freezed,Object? tourName = null,Object? startDate = null,Object? endDate = null,Object? members = null,Object? payment = freezed,Object? paymentMethod = null,Object? paymentStatus = null,Object? transactionId = null,Object? gatewayTransactionId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,customerPhone: null == customerPhone ? _self.customerPhone : customerPhone // ignore: cast_nullable_to_non_nullable
as String,specialRequests: null == specialRequests ? _self.specialRequests : specialRequests // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,pricePerAdultAtBooking: null == pricePerAdultAtBooking ? _self.pricePerAdultAtBooking : pricePerAdultAtBooking // ignore: cast_nullable_to_non_nullable
as double,pricePerChildAtBooking: null == pricePerChildAtBooking ? _self.pricePerChildAtBooking : pricePerChildAtBooking // ignore: cast_nullable_to_non_nullable
as double,paymentDeadline: freezed == paymentDeadline ? _self.paymentDeadline : paymentDeadline // ignore: cast_nullable_to_non_nullable
as String?,tourName: null == tourName ? _self.tourName : tourName // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,members: null == members ? _self.members : members // ignore: cast_nullable_to_non_nullable
as List<BookingMemberData>,payment: freezed == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as PaymentData?,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String,transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,gatewayTransactionId: null == gatewayTransactionId ? _self.gatewayTransactionId : gatewayTransactionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of TourBookingData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentDataCopyWith<$Res>? get payment {
    if (_self.payment == null) {
    return null;
  }

  return $PaymentDataCopyWith<$Res>(_self.payment!, (value) {
    return _then(_self.copyWith(payment: value));
  });
}
}


/// Adds pattern-matching-related methods to [TourBookingData].
extension TourBookingDataPatterns on TourBookingData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TourBookingData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TourBookingData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TourBookingData value)  $default,){
final _that = this;
switch (_that) {
case _TourBookingData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TourBookingData value)?  $default,){
final _that = this;
switch (_that) {
case _TourBookingData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String customerName,  String customerPhone,  String specialRequests,  String status,  double totalPrice,  double pricePerAdultAtBooking,  double pricePerChildAtBooking,  String? paymentDeadline,  String tourName,  String startDate,  String endDate,  List<BookingMemberData> members,  PaymentData? payment,  String paymentMethod,  String paymentStatus,  String transactionId,  String gatewayTransactionId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TourBookingData() when $default != null:
return $default(_that.id,_that.customerName,_that.customerPhone,_that.specialRequests,_that.status,_that.totalPrice,_that.pricePerAdultAtBooking,_that.pricePerChildAtBooking,_that.paymentDeadline,_that.tourName,_that.startDate,_that.endDate,_that.members,_that.payment,_that.paymentMethod,_that.paymentStatus,_that.transactionId,_that.gatewayTransactionId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String customerName,  String customerPhone,  String specialRequests,  String status,  double totalPrice,  double pricePerAdultAtBooking,  double pricePerChildAtBooking,  String? paymentDeadline,  String tourName,  String startDate,  String endDate,  List<BookingMemberData> members,  PaymentData? payment,  String paymentMethod,  String paymentStatus,  String transactionId,  String gatewayTransactionId)  $default,) {final _that = this;
switch (_that) {
case _TourBookingData():
return $default(_that.id,_that.customerName,_that.customerPhone,_that.specialRequests,_that.status,_that.totalPrice,_that.pricePerAdultAtBooking,_that.pricePerChildAtBooking,_that.paymentDeadline,_that.tourName,_that.startDate,_that.endDate,_that.members,_that.payment,_that.paymentMethod,_that.paymentStatus,_that.transactionId,_that.gatewayTransactionId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String customerName,  String customerPhone,  String specialRequests,  String status,  double totalPrice,  double pricePerAdultAtBooking,  double pricePerChildAtBooking,  String? paymentDeadline,  String tourName,  String startDate,  String endDate,  List<BookingMemberData> members,  PaymentData? payment,  String paymentMethod,  String paymentStatus,  String transactionId,  String gatewayTransactionId)?  $default,) {final _that = this;
switch (_that) {
case _TourBookingData() when $default != null:
return $default(_that.id,_that.customerName,_that.customerPhone,_that.specialRequests,_that.status,_that.totalPrice,_that.pricePerAdultAtBooking,_that.pricePerChildAtBooking,_that.paymentDeadline,_that.tourName,_that.startDate,_that.endDate,_that.members,_that.payment,_that.paymentMethod,_that.paymentStatus,_that.transactionId,_that.gatewayTransactionId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TourBookingData implements TourBookingData {
  const _TourBookingData({required this.id, this.customerName = '', this.customerPhone = '', this.specialRequests = '', this.status = 'PENDING', this.totalPrice = 0, this.pricePerAdultAtBooking = 0, this.pricePerChildAtBooking = 0, this.paymentDeadline, this.tourName = '', this.startDate = '', this.endDate = '', final  List<BookingMemberData> members = const [], this.payment, this.paymentMethod = '', this.paymentStatus = '', this.transactionId = '', this.gatewayTransactionId = ''}): _members = members;
  factory _TourBookingData.fromJson(Map<String, dynamic> json) => _$TourBookingDataFromJson(json);

@override final  String id;
@override@JsonKey() final  String customerName;
@override@JsonKey() final  String customerPhone;
@override@JsonKey() final  String specialRequests;
@override@JsonKey() final  String status;
@override@JsonKey() final  double totalPrice;
@override@JsonKey() final  double pricePerAdultAtBooking;
@override@JsonKey() final  double pricePerChildAtBooking;
@override final  String? paymentDeadline;
@override@JsonKey() final  String tourName;
@override@JsonKey() final  String startDate;
@override@JsonKey() final  String endDate;
 final  List<BookingMemberData> _members;
@override@JsonKey() List<BookingMemberData> get members {
  if (_members is EqualUnmodifiableListView) return _members;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_members);
}

@override final  PaymentData? payment;
@override@JsonKey() final  String paymentMethod;
@override@JsonKey() final  String paymentStatus;
@override@JsonKey() final  String transactionId;
@override@JsonKey() final  String gatewayTransactionId;

/// Create a copy of TourBookingData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TourBookingDataCopyWith<_TourBookingData> get copyWith => __$TourBookingDataCopyWithImpl<_TourBookingData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TourBookingDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TourBookingData&&(identical(other.id, id) || other.id == id)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.customerPhone, customerPhone) || other.customerPhone == customerPhone)&&(identical(other.specialRequests, specialRequests) || other.specialRequests == specialRequests)&&(identical(other.status, status) || other.status == status)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.pricePerAdultAtBooking, pricePerAdultAtBooking) || other.pricePerAdultAtBooking == pricePerAdultAtBooking)&&(identical(other.pricePerChildAtBooking, pricePerChildAtBooking) || other.pricePerChildAtBooking == pricePerChildAtBooking)&&(identical(other.paymentDeadline, paymentDeadline) || other.paymentDeadline == paymentDeadline)&&(identical(other.tourName, tourName) || other.tourName == tourName)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other._members, _members)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.gatewayTransactionId, gatewayTransactionId) || other.gatewayTransactionId == gatewayTransactionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,customerName,customerPhone,specialRequests,status,totalPrice,pricePerAdultAtBooking,pricePerChildAtBooking,paymentDeadline,tourName,startDate,endDate,const DeepCollectionEquality().hash(_members),payment,paymentMethod,paymentStatus,transactionId,gatewayTransactionId);

@override
String toString() {
  return 'TourBookingData(id: $id, customerName: $customerName, customerPhone: $customerPhone, specialRequests: $specialRequests, status: $status, totalPrice: $totalPrice, pricePerAdultAtBooking: $pricePerAdultAtBooking, pricePerChildAtBooking: $pricePerChildAtBooking, paymentDeadline: $paymentDeadline, tourName: $tourName, startDate: $startDate, endDate: $endDate, members: $members, payment: $payment, paymentMethod: $paymentMethod, paymentStatus: $paymentStatus, transactionId: $transactionId, gatewayTransactionId: $gatewayTransactionId)';
}


}

/// @nodoc
abstract mixin class _$TourBookingDataCopyWith<$Res> implements $TourBookingDataCopyWith<$Res> {
  factory _$TourBookingDataCopyWith(_TourBookingData value, $Res Function(_TourBookingData) _then) = __$TourBookingDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String customerName, String customerPhone, String specialRequests, String status, double totalPrice, double pricePerAdultAtBooking, double pricePerChildAtBooking, String? paymentDeadline, String tourName, String startDate, String endDate, List<BookingMemberData> members, PaymentData? payment, String paymentMethod, String paymentStatus, String transactionId, String gatewayTransactionId
});


@override $PaymentDataCopyWith<$Res>? get payment;

}
/// @nodoc
class __$TourBookingDataCopyWithImpl<$Res>
    implements _$TourBookingDataCopyWith<$Res> {
  __$TourBookingDataCopyWithImpl(this._self, this._then);

  final _TourBookingData _self;
  final $Res Function(_TourBookingData) _then;

/// Create a copy of TourBookingData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? customerName = null,Object? customerPhone = null,Object? specialRequests = null,Object? status = null,Object? totalPrice = null,Object? pricePerAdultAtBooking = null,Object? pricePerChildAtBooking = null,Object? paymentDeadline = freezed,Object? tourName = null,Object? startDate = null,Object? endDate = null,Object? members = null,Object? payment = freezed,Object? paymentMethod = null,Object? paymentStatus = null,Object? transactionId = null,Object? gatewayTransactionId = null,}) {
  return _then(_TourBookingData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,customerPhone: null == customerPhone ? _self.customerPhone : customerPhone // ignore: cast_nullable_to_non_nullable
as String,specialRequests: null == specialRequests ? _self.specialRequests : specialRequests // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,pricePerAdultAtBooking: null == pricePerAdultAtBooking ? _self.pricePerAdultAtBooking : pricePerAdultAtBooking // ignore: cast_nullable_to_non_nullable
as double,pricePerChildAtBooking: null == pricePerChildAtBooking ? _self.pricePerChildAtBooking : pricePerChildAtBooking // ignore: cast_nullable_to_non_nullable
as double,paymentDeadline: freezed == paymentDeadline ? _self.paymentDeadline : paymentDeadline // ignore: cast_nullable_to_non_nullable
as String?,tourName: null == tourName ? _self.tourName : tourName // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,members: null == members ? _self._members : members // ignore: cast_nullable_to_non_nullable
as List<BookingMemberData>,payment: freezed == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as PaymentData?,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String,transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,gatewayTransactionId: null == gatewayTransactionId ? _self.gatewayTransactionId : gatewayTransactionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of TourBookingData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentDataCopyWith<$Res>? get payment {
    if (_self.payment == null) {
    return null;
  }

  return $PaymentDataCopyWith<$Res>(_self.payment!, (value) {
    return _then(_self.copyWith(payment: value));
  });
}
}


/// @nodoc
mixin _$BookingMemberData {

 String get id; String get fullName; String get identityNumber; String get dateOfBirth; String get attendanceStatus; String get memberType;
/// Create a copy of BookingMemberData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingMemberDataCopyWith<BookingMemberData> get copyWith => _$BookingMemberDataCopyWithImpl<BookingMemberData>(this as BookingMemberData, _$identity);

  /// Serializes this BookingMemberData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingMemberData&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.identityNumber, identityNumber) || other.identityNumber == identityNumber)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.attendanceStatus, attendanceStatus) || other.attendanceStatus == attendanceStatus)&&(identical(other.memberType, memberType) || other.memberType == memberType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,identityNumber,dateOfBirth,attendanceStatus,memberType);

@override
String toString() {
  return 'BookingMemberData(id: $id, fullName: $fullName, identityNumber: $identityNumber, dateOfBirth: $dateOfBirth, attendanceStatus: $attendanceStatus, memberType: $memberType)';
}


}

/// @nodoc
abstract mixin class $BookingMemberDataCopyWith<$Res>  {
  factory $BookingMemberDataCopyWith(BookingMemberData value, $Res Function(BookingMemberData) _then) = _$BookingMemberDataCopyWithImpl;
@useResult
$Res call({
 String id, String fullName, String identityNumber, String dateOfBirth, String attendanceStatus, String memberType
});




}
/// @nodoc
class _$BookingMemberDataCopyWithImpl<$Res>
    implements $BookingMemberDataCopyWith<$Res> {
  _$BookingMemberDataCopyWithImpl(this._self, this._then);

  final BookingMemberData _self;
  final $Res Function(BookingMemberData) _then;

/// Create a copy of BookingMemberData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fullName = null,Object? identityNumber = null,Object? dateOfBirth = null,Object? attendanceStatus = null,Object? memberType = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,identityNumber: null == identityNumber ? _self.identityNumber : identityNumber // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String,attendanceStatus: null == attendanceStatus ? _self.attendanceStatus : attendanceStatus // ignore: cast_nullable_to_non_nullable
as String,memberType: null == memberType ? _self.memberType : memberType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingMemberData].
extension BookingMemberDataPatterns on BookingMemberData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingMemberData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingMemberData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingMemberData value)  $default,){
final _that = this;
switch (_that) {
case _BookingMemberData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingMemberData value)?  $default,){
final _that = this;
switch (_that) {
case _BookingMemberData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String fullName,  String identityNumber,  String dateOfBirth,  String attendanceStatus,  String memberType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingMemberData() when $default != null:
return $default(_that.id,_that.fullName,_that.identityNumber,_that.dateOfBirth,_that.attendanceStatus,_that.memberType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String fullName,  String identityNumber,  String dateOfBirth,  String attendanceStatus,  String memberType)  $default,) {final _that = this;
switch (_that) {
case _BookingMemberData():
return $default(_that.id,_that.fullName,_that.identityNumber,_that.dateOfBirth,_that.attendanceStatus,_that.memberType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String fullName,  String identityNumber,  String dateOfBirth,  String attendanceStatus,  String memberType)?  $default,) {final _that = this;
switch (_that) {
case _BookingMemberData() when $default != null:
return $default(_that.id,_that.fullName,_that.identityNumber,_that.dateOfBirth,_that.attendanceStatus,_that.memberType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookingMemberData implements BookingMemberData {
  const _BookingMemberData({this.id = '', this.fullName = '', this.identityNumber = '', this.dateOfBirth = '', this.attendanceStatus = 'NOT_CHECKED', this.memberType = 'ADULT'});
  factory _BookingMemberData.fromJson(Map<String, dynamic> json) => _$BookingMemberDataFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String fullName;
@override@JsonKey() final  String identityNumber;
@override@JsonKey() final  String dateOfBirth;
@override@JsonKey() final  String attendanceStatus;
@override@JsonKey() final  String memberType;

/// Create a copy of BookingMemberData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingMemberDataCopyWith<_BookingMemberData> get copyWith => __$BookingMemberDataCopyWithImpl<_BookingMemberData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingMemberDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingMemberData&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.identityNumber, identityNumber) || other.identityNumber == identityNumber)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.attendanceStatus, attendanceStatus) || other.attendanceStatus == attendanceStatus)&&(identical(other.memberType, memberType) || other.memberType == memberType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,identityNumber,dateOfBirth,attendanceStatus,memberType);

@override
String toString() {
  return 'BookingMemberData(id: $id, fullName: $fullName, identityNumber: $identityNumber, dateOfBirth: $dateOfBirth, attendanceStatus: $attendanceStatus, memberType: $memberType)';
}


}

/// @nodoc
abstract mixin class _$BookingMemberDataCopyWith<$Res> implements $BookingMemberDataCopyWith<$Res> {
  factory _$BookingMemberDataCopyWith(_BookingMemberData value, $Res Function(_BookingMemberData) _then) = __$BookingMemberDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String fullName, String identityNumber, String dateOfBirth, String attendanceStatus, String memberType
});




}
/// @nodoc
class __$BookingMemberDataCopyWithImpl<$Res>
    implements _$BookingMemberDataCopyWith<$Res> {
  __$BookingMemberDataCopyWithImpl(this._self, this._then);

  final _BookingMemberData _self;
  final $Res Function(_BookingMemberData) _then;

/// Create a copy of BookingMemberData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fullName = null,Object? identityNumber = null,Object? dateOfBirth = null,Object? attendanceStatus = null,Object? memberType = null,}) {
  return _then(_BookingMemberData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,identityNumber: null == identityNumber ? _self.identityNumber : identityNumber // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String,attendanceStatus: null == attendanceStatus ? _self.attendanceStatus : attendanceStatus // ignore: cast_nullable_to_non_nullable
as String,memberType: null == memberType ? _self.memberType : memberType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PaymentData {

 String get transactionId; String get gatewayTransactionId; double get amount; String get paymentUrl; String? get expiresAt;
/// Create a copy of PaymentData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentDataCopyWith<PaymentData> get copyWith => _$PaymentDataCopyWithImpl<PaymentData>(this as PaymentData, _$identity);

  /// Serializes this PaymentData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentData&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.gatewayTransactionId, gatewayTransactionId) || other.gatewayTransactionId == gatewayTransactionId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentUrl, paymentUrl) || other.paymentUrl == paymentUrl)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,transactionId,gatewayTransactionId,amount,paymentUrl,expiresAt);

@override
String toString() {
  return 'PaymentData(transactionId: $transactionId, gatewayTransactionId: $gatewayTransactionId, amount: $amount, paymentUrl: $paymentUrl, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class $PaymentDataCopyWith<$Res>  {
  factory $PaymentDataCopyWith(PaymentData value, $Res Function(PaymentData) _then) = _$PaymentDataCopyWithImpl;
@useResult
$Res call({
 String transactionId, String gatewayTransactionId, double amount, String paymentUrl, String? expiresAt
});




}
/// @nodoc
class _$PaymentDataCopyWithImpl<$Res>
    implements $PaymentDataCopyWith<$Res> {
  _$PaymentDataCopyWithImpl(this._self, this._then);

  final PaymentData _self;
  final $Res Function(PaymentData) _then;

/// Create a copy of PaymentData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? transactionId = null,Object? gatewayTransactionId = null,Object? amount = null,Object? paymentUrl = null,Object? expiresAt = freezed,}) {
  return _then(_self.copyWith(
transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,gatewayTransactionId: null == gatewayTransactionId ? _self.gatewayTransactionId : gatewayTransactionId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,paymentUrl: null == paymentUrl ? _self.paymentUrl : paymentUrl // ignore: cast_nullable_to_non_nullable
as String,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentData].
extension PaymentDataPatterns on PaymentData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentData value)  $default,){
final _that = this;
switch (_that) {
case _PaymentData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentData value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String transactionId,  String gatewayTransactionId,  double amount,  String paymentUrl,  String? expiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentData() when $default != null:
return $default(_that.transactionId,_that.gatewayTransactionId,_that.amount,_that.paymentUrl,_that.expiresAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String transactionId,  String gatewayTransactionId,  double amount,  String paymentUrl,  String? expiresAt)  $default,) {final _that = this;
switch (_that) {
case _PaymentData():
return $default(_that.transactionId,_that.gatewayTransactionId,_that.amount,_that.paymentUrl,_that.expiresAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String transactionId,  String gatewayTransactionId,  double amount,  String paymentUrl,  String? expiresAt)?  $default,) {final _that = this;
switch (_that) {
case _PaymentData() when $default != null:
return $default(_that.transactionId,_that.gatewayTransactionId,_that.amount,_that.paymentUrl,_that.expiresAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentData implements PaymentData {
  const _PaymentData({this.transactionId = '', this.gatewayTransactionId = '', this.amount = 0, this.paymentUrl = '', this.expiresAt});
  factory _PaymentData.fromJson(Map<String, dynamic> json) => _$PaymentDataFromJson(json);

@override@JsonKey() final  String transactionId;
@override@JsonKey() final  String gatewayTransactionId;
@override@JsonKey() final  double amount;
@override@JsonKey() final  String paymentUrl;
@override final  String? expiresAt;

/// Create a copy of PaymentData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentDataCopyWith<_PaymentData> get copyWith => __$PaymentDataCopyWithImpl<_PaymentData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentData&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.gatewayTransactionId, gatewayTransactionId) || other.gatewayTransactionId == gatewayTransactionId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentUrl, paymentUrl) || other.paymentUrl == paymentUrl)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,transactionId,gatewayTransactionId,amount,paymentUrl,expiresAt);

@override
String toString() {
  return 'PaymentData(transactionId: $transactionId, gatewayTransactionId: $gatewayTransactionId, amount: $amount, paymentUrl: $paymentUrl, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class _$PaymentDataCopyWith<$Res> implements $PaymentDataCopyWith<$Res> {
  factory _$PaymentDataCopyWith(_PaymentData value, $Res Function(_PaymentData) _then) = __$PaymentDataCopyWithImpl;
@override @useResult
$Res call({
 String transactionId, String gatewayTransactionId, double amount, String paymentUrl, String? expiresAt
});




}
/// @nodoc
class __$PaymentDataCopyWithImpl<$Res>
    implements _$PaymentDataCopyWith<$Res> {
  __$PaymentDataCopyWithImpl(this._self, this._then);

  final _PaymentData _self;
  final $Res Function(_PaymentData) _then;

/// Create a copy of PaymentData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? transactionId = null,Object? gatewayTransactionId = null,Object? amount = null,Object? paymentUrl = null,Object? expiresAt = freezed,}) {
  return _then(_PaymentData(
transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,gatewayTransactionId: null == gatewayTransactionId ? _self.gatewayTransactionId : gatewayTransactionId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,paymentUrl: null == paymentUrl ? _self.paymentUrl : paymentUrl // ignore: cast_nullable_to_non_nullable
as String,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
