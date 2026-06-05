// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coach_trip_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoachTripResponse {

@JsonKey(name: 'id') String? get id;@JsonKey(name: 'departureTime') DateTime? get departureTime;@JsonKey(name: 'arrivalTime') DateTime? get arrivalTime;@JsonKey(name: 'coachType') String? get coachType;@JsonKey(name: 'totalSeats') int? get totalSeats;@JsonKey(name: 'availableSeats') int? get availableSeats;@JsonKey(name: 'basePrice') double? get basePrice;@JsonKey(name: 'originDestination') DestinationResponse? get originDestination;@JsonKey(name: 'destinationDestination') DestinationResponse? get destinationDestination;@JsonKey(name: 'status') String? get status;
/// Create a copy of CoachTripResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoachTripResponseCopyWith<CoachTripResponse> get copyWith => _$CoachTripResponseCopyWithImpl<CoachTripResponse>(this as CoachTripResponse, _$identity);

  /// Serializes this CoachTripResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoachTripResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.departureTime, departureTime) || other.departureTime == departureTime)&&(identical(other.arrivalTime, arrivalTime) || other.arrivalTime == arrivalTime)&&(identical(other.coachType, coachType) || other.coachType == coachType)&&(identical(other.totalSeats, totalSeats) || other.totalSeats == totalSeats)&&(identical(other.availableSeats, availableSeats) || other.availableSeats == availableSeats)&&(identical(other.basePrice, basePrice) || other.basePrice == basePrice)&&(identical(other.originDestination, originDestination) || other.originDestination == originDestination)&&(identical(other.destinationDestination, destinationDestination) || other.destinationDestination == destinationDestination)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,departureTime,arrivalTime,coachType,totalSeats,availableSeats,basePrice,originDestination,destinationDestination,status);

@override
String toString() {
  return 'CoachTripResponse(id: $id, departureTime: $departureTime, arrivalTime: $arrivalTime, coachType: $coachType, totalSeats: $totalSeats, availableSeats: $availableSeats, basePrice: $basePrice, originDestination: $originDestination, destinationDestination: $destinationDestination, status: $status)';
}


}

/// @nodoc
abstract mixin class $CoachTripResponseCopyWith<$Res>  {
  factory $CoachTripResponseCopyWith(CoachTripResponse value, $Res Function(CoachTripResponse) _then) = _$CoachTripResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'departureTime') DateTime? departureTime,@JsonKey(name: 'arrivalTime') DateTime? arrivalTime,@JsonKey(name: 'coachType') String? coachType,@JsonKey(name: 'totalSeats') int? totalSeats,@JsonKey(name: 'availableSeats') int? availableSeats,@JsonKey(name: 'basePrice') double? basePrice,@JsonKey(name: 'originDestination') DestinationResponse? originDestination,@JsonKey(name: 'destinationDestination') DestinationResponse? destinationDestination,@JsonKey(name: 'status') String? status
});


$DestinationResponseCopyWith<$Res>? get originDestination;$DestinationResponseCopyWith<$Res>? get destinationDestination;

}
/// @nodoc
class _$CoachTripResponseCopyWithImpl<$Res>
    implements $CoachTripResponseCopyWith<$Res> {
  _$CoachTripResponseCopyWithImpl(this._self, this._then);

  final CoachTripResponse _self;
  final $Res Function(CoachTripResponse) _then;

/// Create a copy of CoachTripResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? departureTime = freezed,Object? arrivalTime = freezed,Object? coachType = freezed,Object? totalSeats = freezed,Object? availableSeats = freezed,Object? basePrice = freezed,Object? originDestination = freezed,Object? destinationDestination = freezed,Object? status = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,departureTime: freezed == departureTime ? _self.departureTime : departureTime // ignore: cast_nullable_to_non_nullable
as DateTime?,arrivalTime: freezed == arrivalTime ? _self.arrivalTime : arrivalTime // ignore: cast_nullable_to_non_nullable
as DateTime?,coachType: freezed == coachType ? _self.coachType : coachType // ignore: cast_nullable_to_non_nullable
as String?,totalSeats: freezed == totalSeats ? _self.totalSeats : totalSeats // ignore: cast_nullable_to_non_nullable
as int?,availableSeats: freezed == availableSeats ? _self.availableSeats : availableSeats // ignore: cast_nullable_to_non_nullable
as int?,basePrice: freezed == basePrice ? _self.basePrice : basePrice // ignore: cast_nullable_to_non_nullable
as double?,originDestination: freezed == originDestination ? _self.originDestination : originDestination // ignore: cast_nullable_to_non_nullable
as DestinationResponse?,destinationDestination: freezed == destinationDestination ? _self.destinationDestination : destinationDestination // ignore: cast_nullable_to_non_nullable
as DestinationResponse?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of CoachTripResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DestinationResponseCopyWith<$Res>? get originDestination {
    if (_self.originDestination == null) {
    return null;
  }

  return $DestinationResponseCopyWith<$Res>(_self.originDestination!, (value) {
    return _then(_self.copyWith(originDestination: value));
  });
}/// Create a copy of CoachTripResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DestinationResponseCopyWith<$Res>? get destinationDestination {
    if (_self.destinationDestination == null) {
    return null;
  }

  return $DestinationResponseCopyWith<$Res>(_self.destinationDestination!, (value) {
    return _then(_self.copyWith(destinationDestination: value));
  });
}
}


/// Adds pattern-matching-related methods to [CoachTripResponse].
extension CoachTripResponsePatterns on CoachTripResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoachTripResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoachTripResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoachTripResponse value)  $default,){
final _that = this;
switch (_that) {
case _CoachTripResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoachTripResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CoachTripResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String? id, @JsonKey(name: 'departureTime')  DateTime? departureTime, @JsonKey(name: 'arrivalTime')  DateTime? arrivalTime, @JsonKey(name: 'coachType')  String? coachType, @JsonKey(name: 'totalSeats')  int? totalSeats, @JsonKey(name: 'availableSeats')  int? availableSeats, @JsonKey(name: 'basePrice')  double? basePrice, @JsonKey(name: 'originDestination')  DestinationResponse? originDestination, @JsonKey(name: 'destinationDestination')  DestinationResponse? destinationDestination, @JsonKey(name: 'status')  String? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoachTripResponse() when $default != null:
return $default(_that.id,_that.departureTime,_that.arrivalTime,_that.coachType,_that.totalSeats,_that.availableSeats,_that.basePrice,_that.originDestination,_that.destinationDestination,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String? id, @JsonKey(name: 'departureTime')  DateTime? departureTime, @JsonKey(name: 'arrivalTime')  DateTime? arrivalTime, @JsonKey(name: 'coachType')  String? coachType, @JsonKey(name: 'totalSeats')  int? totalSeats, @JsonKey(name: 'availableSeats')  int? availableSeats, @JsonKey(name: 'basePrice')  double? basePrice, @JsonKey(name: 'originDestination')  DestinationResponse? originDestination, @JsonKey(name: 'destinationDestination')  DestinationResponse? destinationDestination, @JsonKey(name: 'status')  String? status)  $default,) {final _that = this;
switch (_that) {
case _CoachTripResponse():
return $default(_that.id,_that.departureTime,_that.arrivalTime,_that.coachType,_that.totalSeats,_that.availableSeats,_that.basePrice,_that.originDestination,_that.destinationDestination,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  String? id, @JsonKey(name: 'departureTime')  DateTime? departureTime, @JsonKey(name: 'arrivalTime')  DateTime? arrivalTime, @JsonKey(name: 'coachType')  String? coachType, @JsonKey(name: 'totalSeats')  int? totalSeats, @JsonKey(name: 'availableSeats')  int? availableSeats, @JsonKey(name: 'basePrice')  double? basePrice, @JsonKey(name: 'originDestination')  DestinationResponse? originDestination, @JsonKey(name: 'destinationDestination')  DestinationResponse? destinationDestination, @JsonKey(name: 'status')  String? status)?  $default,) {final _that = this;
switch (_that) {
case _CoachTripResponse() when $default != null:
return $default(_that.id,_that.departureTime,_that.arrivalTime,_that.coachType,_that.totalSeats,_that.availableSeats,_that.basePrice,_that.originDestination,_that.destinationDestination,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CoachTripResponse implements CoachTripResponse {
  const _CoachTripResponse({@JsonKey(name: 'id') this.id, @JsonKey(name: 'departureTime') this.departureTime, @JsonKey(name: 'arrivalTime') this.arrivalTime, @JsonKey(name: 'coachType') this.coachType, @JsonKey(name: 'totalSeats') this.totalSeats, @JsonKey(name: 'availableSeats') this.availableSeats, @JsonKey(name: 'basePrice') this.basePrice, @JsonKey(name: 'originDestination') this.originDestination, @JsonKey(name: 'destinationDestination') this.destinationDestination, @JsonKey(name: 'status') this.status});
  factory _CoachTripResponse.fromJson(Map<String, dynamic> json) => _$CoachTripResponseFromJson(json);

@override@JsonKey(name: 'id') final  String? id;
@override@JsonKey(name: 'departureTime') final  DateTime? departureTime;
@override@JsonKey(name: 'arrivalTime') final  DateTime? arrivalTime;
@override@JsonKey(name: 'coachType') final  String? coachType;
@override@JsonKey(name: 'totalSeats') final  int? totalSeats;
@override@JsonKey(name: 'availableSeats') final  int? availableSeats;
@override@JsonKey(name: 'basePrice') final  double? basePrice;
@override@JsonKey(name: 'originDestination') final  DestinationResponse? originDestination;
@override@JsonKey(name: 'destinationDestination') final  DestinationResponse? destinationDestination;
@override@JsonKey(name: 'status') final  String? status;

/// Create a copy of CoachTripResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoachTripResponseCopyWith<_CoachTripResponse> get copyWith => __$CoachTripResponseCopyWithImpl<_CoachTripResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CoachTripResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoachTripResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.departureTime, departureTime) || other.departureTime == departureTime)&&(identical(other.arrivalTime, arrivalTime) || other.arrivalTime == arrivalTime)&&(identical(other.coachType, coachType) || other.coachType == coachType)&&(identical(other.totalSeats, totalSeats) || other.totalSeats == totalSeats)&&(identical(other.availableSeats, availableSeats) || other.availableSeats == availableSeats)&&(identical(other.basePrice, basePrice) || other.basePrice == basePrice)&&(identical(other.originDestination, originDestination) || other.originDestination == originDestination)&&(identical(other.destinationDestination, destinationDestination) || other.destinationDestination == destinationDestination)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,departureTime,arrivalTime,coachType,totalSeats,availableSeats,basePrice,originDestination,destinationDestination,status);

@override
String toString() {
  return 'CoachTripResponse(id: $id, departureTime: $departureTime, arrivalTime: $arrivalTime, coachType: $coachType, totalSeats: $totalSeats, availableSeats: $availableSeats, basePrice: $basePrice, originDestination: $originDestination, destinationDestination: $destinationDestination, status: $status)';
}


}

/// @nodoc
abstract mixin class _$CoachTripResponseCopyWith<$Res> implements $CoachTripResponseCopyWith<$Res> {
  factory _$CoachTripResponseCopyWith(_CoachTripResponse value, $Res Function(_CoachTripResponse) _then) = __$CoachTripResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'departureTime') DateTime? departureTime,@JsonKey(name: 'arrivalTime') DateTime? arrivalTime,@JsonKey(name: 'coachType') String? coachType,@JsonKey(name: 'totalSeats') int? totalSeats,@JsonKey(name: 'availableSeats') int? availableSeats,@JsonKey(name: 'basePrice') double? basePrice,@JsonKey(name: 'originDestination') DestinationResponse? originDestination,@JsonKey(name: 'destinationDestination') DestinationResponse? destinationDestination,@JsonKey(name: 'status') String? status
});


@override $DestinationResponseCopyWith<$Res>? get originDestination;@override $DestinationResponseCopyWith<$Res>? get destinationDestination;

}
/// @nodoc
class __$CoachTripResponseCopyWithImpl<$Res>
    implements _$CoachTripResponseCopyWith<$Res> {
  __$CoachTripResponseCopyWithImpl(this._self, this._then);

  final _CoachTripResponse _self;
  final $Res Function(_CoachTripResponse) _then;

/// Create a copy of CoachTripResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? departureTime = freezed,Object? arrivalTime = freezed,Object? coachType = freezed,Object? totalSeats = freezed,Object? availableSeats = freezed,Object? basePrice = freezed,Object? originDestination = freezed,Object? destinationDestination = freezed,Object? status = freezed,}) {
  return _then(_CoachTripResponse(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,departureTime: freezed == departureTime ? _self.departureTime : departureTime // ignore: cast_nullable_to_non_nullable
as DateTime?,arrivalTime: freezed == arrivalTime ? _self.arrivalTime : arrivalTime // ignore: cast_nullable_to_non_nullable
as DateTime?,coachType: freezed == coachType ? _self.coachType : coachType // ignore: cast_nullable_to_non_nullable
as String?,totalSeats: freezed == totalSeats ? _self.totalSeats : totalSeats // ignore: cast_nullable_to_non_nullable
as int?,availableSeats: freezed == availableSeats ? _self.availableSeats : availableSeats // ignore: cast_nullable_to_non_nullable
as int?,basePrice: freezed == basePrice ? _self.basePrice : basePrice // ignore: cast_nullable_to_non_nullable
as double?,originDestination: freezed == originDestination ? _self.originDestination : originDestination // ignore: cast_nullable_to_non_nullable
as DestinationResponse?,destinationDestination: freezed == destinationDestination ? _self.destinationDestination : destinationDestination // ignore: cast_nullable_to_non_nullable
as DestinationResponse?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of CoachTripResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DestinationResponseCopyWith<$Res>? get originDestination {
    if (_self.originDestination == null) {
    return null;
  }

  return $DestinationResponseCopyWith<$Res>(_self.originDestination!, (value) {
    return _then(_self.copyWith(originDestination: value));
  });
}/// Create a copy of CoachTripResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DestinationResponseCopyWith<$Res>? get destinationDestination {
    if (_self.destinationDestination == null) {
    return null;
  }

  return $DestinationResponseCopyWith<$Res>(_self.destinationDestination!, (value) {
    return _then(_self.copyWith(destinationDestination: value));
  });
}
}

// dart format on
