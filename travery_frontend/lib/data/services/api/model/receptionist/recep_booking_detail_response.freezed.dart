// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recep_booking_detail_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecepBookingDetailResponse {

 String get id; String get guestName; String get phoneNumber; String get checkInDate; String get checkOutDate; String get status; num get totalPrice; num get totalAddOnCharges; List<HotelGuestResponse>? get manifest; List<RoomAllocationResponse>? get roomAllocations; List<RecepAddOnOrderResponse>? get addOnOrders;
/// Create a copy of RecepBookingDetailResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecepBookingDetailResponseCopyWith<RecepBookingDetailResponse> get copyWith => _$RecepBookingDetailResponseCopyWithImpl<RecepBookingDetailResponse>(this as RecepBookingDetailResponse, _$identity);

  /// Serializes this RecepBookingDetailResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecepBookingDetailResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.guestName, guestName) || other.guestName == guestName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.checkInDate, checkInDate) || other.checkInDate == checkInDate)&&(identical(other.checkOutDate, checkOutDate) || other.checkOutDate == checkOutDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.totalAddOnCharges, totalAddOnCharges) || other.totalAddOnCharges == totalAddOnCharges)&&const DeepCollectionEquality().equals(other.manifest, manifest)&&const DeepCollectionEquality().equals(other.roomAllocations, roomAllocations)&&const DeepCollectionEquality().equals(other.addOnOrders, addOnOrders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,guestName,phoneNumber,checkInDate,checkOutDate,status,totalPrice,totalAddOnCharges,const DeepCollectionEquality().hash(manifest),const DeepCollectionEquality().hash(roomAllocations),const DeepCollectionEquality().hash(addOnOrders));

@override
String toString() {
  return 'RecepBookingDetailResponse(id: $id, guestName: $guestName, phoneNumber: $phoneNumber, checkInDate: $checkInDate, checkOutDate: $checkOutDate, status: $status, totalPrice: $totalPrice, totalAddOnCharges: $totalAddOnCharges, manifest: $manifest, roomAllocations: $roomAllocations, addOnOrders: $addOnOrders)';
}


}

/// @nodoc
abstract mixin class $RecepBookingDetailResponseCopyWith<$Res>  {
  factory $RecepBookingDetailResponseCopyWith(RecepBookingDetailResponse value, $Res Function(RecepBookingDetailResponse) _then) = _$RecepBookingDetailResponseCopyWithImpl;
@useResult
$Res call({
 String id, String guestName, String phoneNumber, String checkInDate, String checkOutDate, String status, num totalPrice, num totalAddOnCharges, List<HotelGuestResponse>? manifest, List<RoomAllocationResponse>? roomAllocations, List<RecepAddOnOrderResponse>? addOnOrders
});




}
/// @nodoc
class _$RecepBookingDetailResponseCopyWithImpl<$Res>
    implements $RecepBookingDetailResponseCopyWith<$Res> {
  _$RecepBookingDetailResponseCopyWithImpl(this._self, this._then);

  final RecepBookingDetailResponse _self;
  final $Res Function(RecepBookingDetailResponse) _then;

/// Create a copy of RecepBookingDetailResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? guestName = null,Object? phoneNumber = null,Object? checkInDate = null,Object? checkOutDate = null,Object? status = null,Object? totalPrice = null,Object? totalAddOnCharges = null,Object? manifest = freezed,Object? roomAllocations = freezed,Object? addOnOrders = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,guestName: null == guestName ? _self.guestName : guestName // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,checkInDate: null == checkInDate ? _self.checkInDate : checkInDate // ignore: cast_nullable_to_non_nullable
as String,checkOutDate: null == checkOutDate ? _self.checkOutDate : checkOutDate // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as num,totalAddOnCharges: null == totalAddOnCharges ? _self.totalAddOnCharges : totalAddOnCharges // ignore: cast_nullable_to_non_nullable
as num,manifest: freezed == manifest ? _self.manifest : manifest // ignore: cast_nullable_to_non_nullable
as List<HotelGuestResponse>?,roomAllocations: freezed == roomAllocations ? _self.roomAllocations : roomAllocations // ignore: cast_nullable_to_non_nullable
as List<RoomAllocationResponse>?,addOnOrders: freezed == addOnOrders ? _self.addOnOrders : addOnOrders // ignore: cast_nullable_to_non_nullable
as List<RecepAddOnOrderResponse>?,
  ));
}

}


/// Adds pattern-matching-related methods to [RecepBookingDetailResponse].
extension RecepBookingDetailResponsePatterns on RecepBookingDetailResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecepBookingDetailResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecepBookingDetailResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecepBookingDetailResponse value)  $default,){
final _that = this;
switch (_that) {
case _RecepBookingDetailResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecepBookingDetailResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RecepBookingDetailResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String guestName,  String phoneNumber,  String checkInDate,  String checkOutDate,  String status,  num totalPrice,  num totalAddOnCharges,  List<HotelGuestResponse>? manifest,  List<RoomAllocationResponse>? roomAllocations,  List<RecepAddOnOrderResponse>? addOnOrders)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecepBookingDetailResponse() when $default != null:
return $default(_that.id,_that.guestName,_that.phoneNumber,_that.checkInDate,_that.checkOutDate,_that.status,_that.totalPrice,_that.totalAddOnCharges,_that.manifest,_that.roomAllocations,_that.addOnOrders);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String guestName,  String phoneNumber,  String checkInDate,  String checkOutDate,  String status,  num totalPrice,  num totalAddOnCharges,  List<HotelGuestResponse>? manifest,  List<RoomAllocationResponse>? roomAllocations,  List<RecepAddOnOrderResponse>? addOnOrders)  $default,) {final _that = this;
switch (_that) {
case _RecepBookingDetailResponse():
return $default(_that.id,_that.guestName,_that.phoneNumber,_that.checkInDate,_that.checkOutDate,_that.status,_that.totalPrice,_that.totalAddOnCharges,_that.manifest,_that.roomAllocations,_that.addOnOrders);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String guestName,  String phoneNumber,  String checkInDate,  String checkOutDate,  String status,  num totalPrice,  num totalAddOnCharges,  List<HotelGuestResponse>? manifest,  List<RoomAllocationResponse>? roomAllocations,  List<RecepAddOnOrderResponse>? addOnOrders)?  $default,) {final _that = this;
switch (_that) {
case _RecepBookingDetailResponse() when $default != null:
return $default(_that.id,_that.guestName,_that.phoneNumber,_that.checkInDate,_that.checkOutDate,_that.status,_that.totalPrice,_that.totalAddOnCharges,_that.manifest,_that.roomAllocations,_that.addOnOrders);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecepBookingDetailResponse implements RecepBookingDetailResponse {
  const _RecepBookingDetailResponse({required this.id, required this.guestName, required this.phoneNumber, required this.checkInDate, required this.checkOutDate, required this.status, required this.totalPrice, required this.totalAddOnCharges, required final  List<HotelGuestResponse>? manifest, required final  List<RoomAllocationResponse>? roomAllocations, required final  List<RecepAddOnOrderResponse>? addOnOrders}): _manifest = manifest,_roomAllocations = roomAllocations,_addOnOrders = addOnOrders;
  factory _RecepBookingDetailResponse.fromJson(Map<String, dynamic> json) => _$RecepBookingDetailResponseFromJson(json);

@override final  String id;
@override final  String guestName;
@override final  String phoneNumber;
@override final  String checkInDate;
@override final  String checkOutDate;
@override final  String status;
@override final  num totalPrice;
@override final  num totalAddOnCharges;
 final  List<HotelGuestResponse>? _manifest;
@override List<HotelGuestResponse>? get manifest {
  final value = _manifest;
  if (value == null) return null;
  if (_manifest is EqualUnmodifiableListView) return _manifest;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<RoomAllocationResponse>? _roomAllocations;
@override List<RoomAllocationResponse>? get roomAllocations {
  final value = _roomAllocations;
  if (value == null) return null;
  if (_roomAllocations is EqualUnmodifiableListView) return _roomAllocations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<RecepAddOnOrderResponse>? _addOnOrders;
@override List<RecepAddOnOrderResponse>? get addOnOrders {
  final value = _addOnOrders;
  if (value == null) return null;
  if (_addOnOrders is EqualUnmodifiableListView) return _addOnOrders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of RecepBookingDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecepBookingDetailResponseCopyWith<_RecepBookingDetailResponse> get copyWith => __$RecepBookingDetailResponseCopyWithImpl<_RecepBookingDetailResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecepBookingDetailResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecepBookingDetailResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.guestName, guestName) || other.guestName == guestName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.checkInDate, checkInDate) || other.checkInDate == checkInDate)&&(identical(other.checkOutDate, checkOutDate) || other.checkOutDate == checkOutDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.totalAddOnCharges, totalAddOnCharges) || other.totalAddOnCharges == totalAddOnCharges)&&const DeepCollectionEquality().equals(other._manifest, _manifest)&&const DeepCollectionEquality().equals(other._roomAllocations, _roomAllocations)&&const DeepCollectionEquality().equals(other._addOnOrders, _addOnOrders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,guestName,phoneNumber,checkInDate,checkOutDate,status,totalPrice,totalAddOnCharges,const DeepCollectionEquality().hash(_manifest),const DeepCollectionEquality().hash(_roomAllocations),const DeepCollectionEquality().hash(_addOnOrders));

@override
String toString() {
  return 'RecepBookingDetailResponse(id: $id, guestName: $guestName, phoneNumber: $phoneNumber, checkInDate: $checkInDate, checkOutDate: $checkOutDate, status: $status, totalPrice: $totalPrice, totalAddOnCharges: $totalAddOnCharges, manifest: $manifest, roomAllocations: $roomAllocations, addOnOrders: $addOnOrders)';
}


}

/// @nodoc
abstract mixin class _$RecepBookingDetailResponseCopyWith<$Res> implements $RecepBookingDetailResponseCopyWith<$Res> {
  factory _$RecepBookingDetailResponseCopyWith(_RecepBookingDetailResponse value, $Res Function(_RecepBookingDetailResponse) _then) = __$RecepBookingDetailResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, String guestName, String phoneNumber, String checkInDate, String checkOutDate, String status, num totalPrice, num totalAddOnCharges, List<HotelGuestResponse>? manifest, List<RoomAllocationResponse>? roomAllocations, List<RecepAddOnOrderResponse>? addOnOrders
});




}
/// @nodoc
class __$RecepBookingDetailResponseCopyWithImpl<$Res>
    implements _$RecepBookingDetailResponseCopyWith<$Res> {
  __$RecepBookingDetailResponseCopyWithImpl(this._self, this._then);

  final _RecepBookingDetailResponse _self;
  final $Res Function(_RecepBookingDetailResponse) _then;

/// Create a copy of RecepBookingDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? guestName = null,Object? phoneNumber = null,Object? checkInDate = null,Object? checkOutDate = null,Object? status = null,Object? totalPrice = null,Object? totalAddOnCharges = null,Object? manifest = freezed,Object? roomAllocations = freezed,Object? addOnOrders = freezed,}) {
  return _then(_RecepBookingDetailResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,guestName: null == guestName ? _self.guestName : guestName // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,checkInDate: null == checkInDate ? _self.checkInDate : checkInDate // ignore: cast_nullable_to_non_nullable
as String,checkOutDate: null == checkOutDate ? _self.checkOutDate : checkOutDate // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as num,totalAddOnCharges: null == totalAddOnCharges ? _self.totalAddOnCharges : totalAddOnCharges // ignore: cast_nullable_to_non_nullable
as num,manifest: freezed == manifest ? _self._manifest : manifest // ignore: cast_nullable_to_non_nullable
as List<HotelGuestResponse>?,roomAllocations: freezed == roomAllocations ? _self._roomAllocations : roomAllocations // ignore: cast_nullable_to_non_nullable
as List<RoomAllocationResponse>?,addOnOrders: freezed == addOnOrders ? _self._addOnOrders : addOnOrders // ignore: cast_nullable_to_non_nullable
as List<RecepAddOnOrderResponse>?,
  ));
}


}


/// @nodoc
mixin _$HotelGuestResponse {

 String get id; String get fullName; String get identityNumber; String get dateOfBirth; String get memberType;
/// Create a copy of HotelGuestResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HotelGuestResponseCopyWith<HotelGuestResponse> get copyWith => _$HotelGuestResponseCopyWithImpl<HotelGuestResponse>(this as HotelGuestResponse, _$identity);

  /// Serializes this HotelGuestResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HotelGuestResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.identityNumber, identityNumber) || other.identityNumber == identityNumber)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.memberType, memberType) || other.memberType == memberType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,identityNumber,dateOfBirth,memberType);

@override
String toString() {
  return 'HotelGuestResponse(id: $id, fullName: $fullName, identityNumber: $identityNumber, dateOfBirth: $dateOfBirth, memberType: $memberType)';
}


}

/// @nodoc
abstract mixin class $HotelGuestResponseCopyWith<$Res>  {
  factory $HotelGuestResponseCopyWith(HotelGuestResponse value, $Res Function(HotelGuestResponse) _then) = _$HotelGuestResponseCopyWithImpl;
@useResult
$Res call({
 String id, String fullName, String identityNumber, String dateOfBirth, String memberType
});




}
/// @nodoc
class _$HotelGuestResponseCopyWithImpl<$Res>
    implements $HotelGuestResponseCopyWith<$Res> {
  _$HotelGuestResponseCopyWithImpl(this._self, this._then);

  final HotelGuestResponse _self;
  final $Res Function(HotelGuestResponse) _then;

/// Create a copy of HotelGuestResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fullName = null,Object? identityNumber = null,Object? dateOfBirth = null,Object? memberType = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,identityNumber: null == identityNumber ? _self.identityNumber : identityNumber // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String,memberType: null == memberType ? _self.memberType : memberType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HotelGuestResponse].
extension HotelGuestResponsePatterns on HotelGuestResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HotelGuestResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HotelGuestResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HotelGuestResponse value)  $default,){
final _that = this;
switch (_that) {
case _HotelGuestResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HotelGuestResponse value)?  $default,){
final _that = this;
switch (_that) {
case _HotelGuestResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String fullName,  String identityNumber,  String dateOfBirth,  String memberType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HotelGuestResponse() when $default != null:
return $default(_that.id,_that.fullName,_that.identityNumber,_that.dateOfBirth,_that.memberType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String fullName,  String identityNumber,  String dateOfBirth,  String memberType)  $default,) {final _that = this;
switch (_that) {
case _HotelGuestResponse():
return $default(_that.id,_that.fullName,_that.identityNumber,_that.dateOfBirth,_that.memberType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String fullName,  String identityNumber,  String dateOfBirth,  String memberType)?  $default,) {final _that = this;
switch (_that) {
case _HotelGuestResponse() when $default != null:
return $default(_that.id,_that.fullName,_that.identityNumber,_that.dateOfBirth,_that.memberType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HotelGuestResponse implements HotelGuestResponse {
  const _HotelGuestResponse({required this.id, required this.fullName, required this.identityNumber, required this.dateOfBirth, required this.memberType});
  factory _HotelGuestResponse.fromJson(Map<String, dynamic> json) => _$HotelGuestResponseFromJson(json);

@override final  String id;
@override final  String fullName;
@override final  String identityNumber;
@override final  String dateOfBirth;
@override final  String memberType;

/// Create a copy of HotelGuestResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HotelGuestResponseCopyWith<_HotelGuestResponse> get copyWith => __$HotelGuestResponseCopyWithImpl<_HotelGuestResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HotelGuestResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HotelGuestResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.identityNumber, identityNumber) || other.identityNumber == identityNumber)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.memberType, memberType) || other.memberType == memberType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,identityNumber,dateOfBirth,memberType);

@override
String toString() {
  return 'HotelGuestResponse(id: $id, fullName: $fullName, identityNumber: $identityNumber, dateOfBirth: $dateOfBirth, memberType: $memberType)';
}


}

/// @nodoc
abstract mixin class _$HotelGuestResponseCopyWith<$Res> implements $HotelGuestResponseCopyWith<$Res> {
  factory _$HotelGuestResponseCopyWith(_HotelGuestResponse value, $Res Function(_HotelGuestResponse) _then) = __$HotelGuestResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, String fullName, String identityNumber, String dateOfBirth, String memberType
});




}
/// @nodoc
class __$HotelGuestResponseCopyWithImpl<$Res>
    implements _$HotelGuestResponseCopyWith<$Res> {
  __$HotelGuestResponseCopyWithImpl(this._self, this._then);

  final _HotelGuestResponse _self;
  final $Res Function(_HotelGuestResponse) _then;

/// Create a copy of HotelGuestResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fullName = null,Object? identityNumber = null,Object? dateOfBirth = null,Object? memberType = null,}) {
  return _then(_HotelGuestResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,identityNumber: null == identityNumber ? _self.identityNumber : identityNumber // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String,memberType: null == memberType ? _self.memberType : memberType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RoomAllocationResponse {

 String get roomTypeId; String get roomTypeName; int get quantity; List<String> get assignedRoomNumbers;
/// Create a copy of RoomAllocationResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoomAllocationResponseCopyWith<RoomAllocationResponse> get copyWith => _$RoomAllocationResponseCopyWithImpl<RoomAllocationResponse>(this as RoomAllocationResponse, _$identity);

  /// Serializes this RoomAllocationResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoomAllocationResponse&&(identical(other.roomTypeId, roomTypeId) || other.roomTypeId == roomTypeId)&&(identical(other.roomTypeName, roomTypeName) || other.roomTypeName == roomTypeName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&const DeepCollectionEquality().equals(other.assignedRoomNumbers, assignedRoomNumbers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,roomTypeId,roomTypeName,quantity,const DeepCollectionEquality().hash(assignedRoomNumbers));

@override
String toString() {
  return 'RoomAllocationResponse(roomTypeId: $roomTypeId, roomTypeName: $roomTypeName, quantity: $quantity, assignedRoomNumbers: $assignedRoomNumbers)';
}


}

/// @nodoc
abstract mixin class $RoomAllocationResponseCopyWith<$Res>  {
  factory $RoomAllocationResponseCopyWith(RoomAllocationResponse value, $Res Function(RoomAllocationResponse) _then) = _$RoomAllocationResponseCopyWithImpl;
@useResult
$Res call({
 String roomTypeId, String roomTypeName, int quantity, List<String> assignedRoomNumbers
});




}
/// @nodoc
class _$RoomAllocationResponseCopyWithImpl<$Res>
    implements $RoomAllocationResponseCopyWith<$Res> {
  _$RoomAllocationResponseCopyWithImpl(this._self, this._then);

  final RoomAllocationResponse _self;
  final $Res Function(RoomAllocationResponse) _then;

/// Create a copy of RoomAllocationResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? roomTypeId = null,Object? roomTypeName = null,Object? quantity = null,Object? assignedRoomNumbers = null,}) {
  return _then(_self.copyWith(
roomTypeId: null == roomTypeId ? _self.roomTypeId : roomTypeId // ignore: cast_nullable_to_non_nullable
as String,roomTypeName: null == roomTypeName ? _self.roomTypeName : roomTypeName // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,assignedRoomNumbers: null == assignedRoomNumbers ? _self.assignedRoomNumbers : assignedRoomNumbers // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [RoomAllocationResponse].
extension RoomAllocationResponsePatterns on RoomAllocationResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoomAllocationResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoomAllocationResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoomAllocationResponse value)  $default,){
final _that = this;
switch (_that) {
case _RoomAllocationResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoomAllocationResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RoomAllocationResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String roomTypeId,  String roomTypeName,  int quantity,  List<String> assignedRoomNumbers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoomAllocationResponse() when $default != null:
return $default(_that.roomTypeId,_that.roomTypeName,_that.quantity,_that.assignedRoomNumbers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String roomTypeId,  String roomTypeName,  int quantity,  List<String> assignedRoomNumbers)  $default,) {final _that = this;
switch (_that) {
case _RoomAllocationResponse():
return $default(_that.roomTypeId,_that.roomTypeName,_that.quantity,_that.assignedRoomNumbers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String roomTypeId,  String roomTypeName,  int quantity,  List<String> assignedRoomNumbers)?  $default,) {final _that = this;
switch (_that) {
case _RoomAllocationResponse() when $default != null:
return $default(_that.roomTypeId,_that.roomTypeName,_that.quantity,_that.assignedRoomNumbers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoomAllocationResponse implements RoomAllocationResponse {
  const _RoomAllocationResponse({required this.roomTypeId, required this.roomTypeName, required this.quantity, required final  List<String> assignedRoomNumbers}): _assignedRoomNumbers = assignedRoomNumbers;
  factory _RoomAllocationResponse.fromJson(Map<String, dynamic> json) => _$RoomAllocationResponseFromJson(json);

@override final  String roomTypeId;
@override final  String roomTypeName;
@override final  int quantity;
 final  List<String> _assignedRoomNumbers;
@override List<String> get assignedRoomNumbers {
  if (_assignedRoomNumbers is EqualUnmodifiableListView) return _assignedRoomNumbers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_assignedRoomNumbers);
}


/// Create a copy of RoomAllocationResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoomAllocationResponseCopyWith<_RoomAllocationResponse> get copyWith => __$RoomAllocationResponseCopyWithImpl<_RoomAllocationResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoomAllocationResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoomAllocationResponse&&(identical(other.roomTypeId, roomTypeId) || other.roomTypeId == roomTypeId)&&(identical(other.roomTypeName, roomTypeName) || other.roomTypeName == roomTypeName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&const DeepCollectionEquality().equals(other._assignedRoomNumbers, _assignedRoomNumbers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,roomTypeId,roomTypeName,quantity,const DeepCollectionEquality().hash(_assignedRoomNumbers));

@override
String toString() {
  return 'RoomAllocationResponse(roomTypeId: $roomTypeId, roomTypeName: $roomTypeName, quantity: $quantity, assignedRoomNumbers: $assignedRoomNumbers)';
}


}

/// @nodoc
abstract mixin class _$RoomAllocationResponseCopyWith<$Res> implements $RoomAllocationResponseCopyWith<$Res> {
  factory _$RoomAllocationResponseCopyWith(_RoomAllocationResponse value, $Res Function(_RoomAllocationResponse) _then) = __$RoomAllocationResponseCopyWithImpl;
@override @useResult
$Res call({
 String roomTypeId, String roomTypeName, int quantity, List<String> assignedRoomNumbers
});




}
/// @nodoc
class __$RoomAllocationResponseCopyWithImpl<$Res>
    implements _$RoomAllocationResponseCopyWith<$Res> {
  __$RoomAllocationResponseCopyWithImpl(this._self, this._then);

  final _RoomAllocationResponse _self;
  final $Res Function(_RoomAllocationResponse) _then;

/// Create a copy of RoomAllocationResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? roomTypeId = null,Object? roomTypeName = null,Object? quantity = null,Object? assignedRoomNumbers = null,}) {
  return _then(_RoomAllocationResponse(
roomTypeId: null == roomTypeId ? _self.roomTypeId : roomTypeId // ignore: cast_nullable_to_non_nullable
as String,roomTypeName: null == roomTypeName ? _self.roomTypeName : roomTypeName // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,assignedRoomNumbers: null == assignedRoomNumbers ? _self._assignedRoomNumbers : assignedRoomNumbers // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
