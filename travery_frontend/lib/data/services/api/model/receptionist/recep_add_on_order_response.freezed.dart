// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recep_add_on_order_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecepAddOnOrderResponse {

 String get id; String get serviceName; String get category; int get quantity; int get unitPrice; int get totalPrice; String get scheduledTime; String get status;
/// Create a copy of RecepAddOnOrderResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecepAddOnOrderResponseCopyWith<RecepAddOnOrderResponse> get copyWith => _$RecepAddOnOrderResponseCopyWithImpl<RecepAddOnOrderResponse>(this as RecepAddOnOrderResponse, _$identity);

  /// Serializes this RecepAddOnOrderResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecepAddOnOrderResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.serviceName, serviceName) || other.serviceName == serviceName)&&(identical(other.category, category) || other.category == category)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.scheduledTime, scheduledTime) || other.scheduledTime == scheduledTime)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,serviceName,category,quantity,unitPrice,totalPrice,scheduledTime,status);

@override
String toString() {
  return 'RecepAddOnOrderResponse(id: $id, serviceName: $serviceName, category: $category, quantity: $quantity, unitPrice: $unitPrice, totalPrice: $totalPrice, scheduledTime: $scheduledTime, status: $status)';
}


}

/// @nodoc
abstract mixin class $RecepAddOnOrderResponseCopyWith<$Res>  {
  factory $RecepAddOnOrderResponseCopyWith(RecepAddOnOrderResponse value, $Res Function(RecepAddOnOrderResponse) _then) = _$RecepAddOnOrderResponseCopyWithImpl;
@useResult
$Res call({
 String id, String serviceName, String category, int quantity, int unitPrice, int totalPrice, String scheduledTime, String status
});




}
/// @nodoc
class _$RecepAddOnOrderResponseCopyWithImpl<$Res>
    implements $RecepAddOnOrderResponseCopyWith<$Res> {
  _$RecepAddOnOrderResponseCopyWithImpl(this._self, this._then);

  final RecepAddOnOrderResponse _self;
  final $Res Function(RecepAddOnOrderResponse) _then;

/// Create a copy of RecepAddOnOrderResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? serviceName = null,Object? category = null,Object? quantity = null,Object? unitPrice = null,Object? totalPrice = null,Object? scheduledTime = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,serviceName: null == serviceName ? _self.serviceName : serviceName // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as int,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as int,scheduledTime: null == scheduledTime ? _self.scheduledTime : scheduledTime // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RecepAddOnOrderResponse].
extension RecepAddOnOrderResponsePatterns on RecepAddOnOrderResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecepAddOnOrderResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecepAddOnOrderResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecepAddOnOrderResponse value)  $default,){
final _that = this;
switch (_that) {
case _RecepAddOnOrderResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecepAddOnOrderResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RecepAddOnOrderResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String serviceName,  String category,  int quantity,  int unitPrice,  int totalPrice,  String scheduledTime,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecepAddOnOrderResponse() when $default != null:
return $default(_that.id,_that.serviceName,_that.category,_that.quantity,_that.unitPrice,_that.totalPrice,_that.scheduledTime,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String serviceName,  String category,  int quantity,  int unitPrice,  int totalPrice,  String scheduledTime,  String status)  $default,) {final _that = this;
switch (_that) {
case _RecepAddOnOrderResponse():
return $default(_that.id,_that.serviceName,_that.category,_that.quantity,_that.unitPrice,_that.totalPrice,_that.scheduledTime,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String serviceName,  String category,  int quantity,  int unitPrice,  int totalPrice,  String scheduledTime,  String status)?  $default,) {final _that = this;
switch (_that) {
case _RecepAddOnOrderResponse() when $default != null:
return $default(_that.id,_that.serviceName,_that.category,_that.quantity,_that.unitPrice,_that.totalPrice,_that.scheduledTime,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecepAddOnOrderResponse implements RecepAddOnOrderResponse {
  const _RecepAddOnOrderResponse({required this.id, required this.serviceName, required this.category, required this.quantity, required this.unitPrice, required this.totalPrice, required this.scheduledTime, required this.status});
  factory _RecepAddOnOrderResponse.fromJson(Map<String, dynamic> json) => _$RecepAddOnOrderResponseFromJson(json);

@override final  String id;
@override final  String serviceName;
@override final  String category;
@override final  int quantity;
@override final  int unitPrice;
@override final  int totalPrice;
@override final  String scheduledTime;
@override final  String status;

/// Create a copy of RecepAddOnOrderResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecepAddOnOrderResponseCopyWith<_RecepAddOnOrderResponse> get copyWith => __$RecepAddOnOrderResponseCopyWithImpl<_RecepAddOnOrderResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecepAddOnOrderResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecepAddOnOrderResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.serviceName, serviceName) || other.serviceName == serviceName)&&(identical(other.category, category) || other.category == category)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.scheduledTime, scheduledTime) || other.scheduledTime == scheduledTime)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,serviceName,category,quantity,unitPrice,totalPrice,scheduledTime,status);

@override
String toString() {
  return 'RecepAddOnOrderResponse(id: $id, serviceName: $serviceName, category: $category, quantity: $quantity, unitPrice: $unitPrice, totalPrice: $totalPrice, scheduledTime: $scheduledTime, status: $status)';
}


}

/// @nodoc
abstract mixin class _$RecepAddOnOrderResponseCopyWith<$Res> implements $RecepAddOnOrderResponseCopyWith<$Res> {
  factory _$RecepAddOnOrderResponseCopyWith(_RecepAddOnOrderResponse value, $Res Function(_RecepAddOnOrderResponse) _then) = __$RecepAddOnOrderResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, String serviceName, String category, int quantity, int unitPrice, int totalPrice, String scheduledTime, String status
});




}
/// @nodoc
class __$RecepAddOnOrderResponseCopyWithImpl<$Res>
    implements _$RecepAddOnOrderResponseCopyWith<$Res> {
  __$RecepAddOnOrderResponseCopyWithImpl(this._self, this._then);

  final _RecepAddOnOrderResponse _self;
  final $Res Function(_RecepAddOnOrderResponse) _then;

/// Create a copy of RecepAddOnOrderResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? serviceName = null,Object? category = null,Object? quantity = null,Object? unitPrice = null,Object? totalPrice = null,Object? scheduledTime = null,Object? status = null,}) {
  return _then(_RecepAddOnOrderResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,serviceName: null == serviceName ? _self.serviceName : serviceName // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as int,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as int,scheduledTime: null == scheduledTime ? _self.scheduledTime : scheduledTime // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
