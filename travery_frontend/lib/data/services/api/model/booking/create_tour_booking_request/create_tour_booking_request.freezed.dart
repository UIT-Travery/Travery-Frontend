// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_tour_booking_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateTourBookingRequest {

 List<BookingMemberRequest> get members; String get specialRequests;
/// Create a copy of CreateTourBookingRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTourBookingRequestCopyWith<CreateTourBookingRequest> get copyWith => _$CreateTourBookingRequestCopyWithImpl<CreateTourBookingRequest>(this as CreateTourBookingRequest, _$identity);

  /// Serializes this CreateTourBookingRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTourBookingRequest&&const DeepCollectionEquality().equals(other.members, members)&&(identical(other.specialRequests, specialRequests) || other.specialRequests == specialRequests));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(members),specialRequests);

@override
String toString() {
  return 'CreateTourBookingRequest(members: $members, specialRequests: $specialRequests)';
}


}

/// @nodoc
abstract mixin class $CreateTourBookingRequestCopyWith<$Res>  {
  factory $CreateTourBookingRequestCopyWith(CreateTourBookingRequest value, $Res Function(CreateTourBookingRequest) _then) = _$CreateTourBookingRequestCopyWithImpl;
@useResult
$Res call({
 List<BookingMemberRequest> members, String specialRequests
});




}
/// @nodoc
class _$CreateTourBookingRequestCopyWithImpl<$Res>
    implements $CreateTourBookingRequestCopyWith<$Res> {
  _$CreateTourBookingRequestCopyWithImpl(this._self, this._then);

  final CreateTourBookingRequest _self;
  final $Res Function(CreateTourBookingRequest) _then;

/// Create a copy of CreateTourBookingRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? members = null,Object? specialRequests = null,}) {
  return _then(_self.copyWith(
members: null == members ? _self.members : members // ignore: cast_nullable_to_non_nullable
as List<BookingMemberRequest>,specialRequests: null == specialRequests ? _self.specialRequests : specialRequests // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateTourBookingRequest].
extension CreateTourBookingRequestPatterns on CreateTourBookingRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateTourBookingRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateTourBookingRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateTourBookingRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateTourBookingRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateTourBookingRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateTourBookingRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<BookingMemberRequest> members,  String specialRequests)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateTourBookingRequest() when $default != null:
return $default(_that.members,_that.specialRequests);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<BookingMemberRequest> members,  String specialRequests)  $default,) {final _that = this;
switch (_that) {
case _CreateTourBookingRequest():
return $default(_that.members,_that.specialRequests);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<BookingMemberRequest> members,  String specialRequests)?  $default,) {final _that = this;
switch (_that) {
case _CreateTourBookingRequest() when $default != null:
return $default(_that.members,_that.specialRequests);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateTourBookingRequest implements CreateTourBookingRequest {
  const _CreateTourBookingRequest({required final  List<BookingMemberRequest> members, this.specialRequests = ''}): _members = members;
  factory _CreateTourBookingRequest.fromJson(Map<String, dynamic> json) => _$CreateTourBookingRequestFromJson(json);

 final  List<BookingMemberRequest> _members;
@override List<BookingMemberRequest> get members {
  if (_members is EqualUnmodifiableListView) return _members;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_members);
}

@override@JsonKey() final  String specialRequests;

/// Create a copy of CreateTourBookingRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTourBookingRequestCopyWith<_CreateTourBookingRequest> get copyWith => __$CreateTourBookingRequestCopyWithImpl<_CreateTourBookingRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateTourBookingRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTourBookingRequest&&const DeepCollectionEquality().equals(other._members, _members)&&(identical(other.specialRequests, specialRequests) || other.specialRequests == specialRequests));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_members),specialRequests);

@override
String toString() {
  return 'CreateTourBookingRequest(members: $members, specialRequests: $specialRequests)';
}


}

/// @nodoc
abstract mixin class _$CreateTourBookingRequestCopyWith<$Res> implements $CreateTourBookingRequestCopyWith<$Res> {
  factory _$CreateTourBookingRequestCopyWith(_CreateTourBookingRequest value, $Res Function(_CreateTourBookingRequest) _then) = __$CreateTourBookingRequestCopyWithImpl;
@override @useResult
$Res call({
 List<BookingMemberRequest> members, String specialRequests
});




}
/// @nodoc
class __$CreateTourBookingRequestCopyWithImpl<$Res>
    implements _$CreateTourBookingRequestCopyWith<$Res> {
  __$CreateTourBookingRequestCopyWithImpl(this._self, this._then);

  final _CreateTourBookingRequest _self;
  final $Res Function(_CreateTourBookingRequest) _then;

/// Create a copy of CreateTourBookingRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? members = null,Object? specialRequests = null,}) {
  return _then(_CreateTourBookingRequest(
members: null == members ? _self._members : members // ignore: cast_nullable_to_non_nullable
as List<BookingMemberRequest>,specialRequests: null == specialRequests ? _self.specialRequests : specialRequests // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$BookingMemberRequest {

 String get fullName; String get identityNumber; String get dateOfBirth; String get memberType;
/// Create a copy of BookingMemberRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingMemberRequestCopyWith<BookingMemberRequest> get copyWith => _$BookingMemberRequestCopyWithImpl<BookingMemberRequest>(this as BookingMemberRequest, _$identity);

  /// Serializes this BookingMemberRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingMemberRequest&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.identityNumber, identityNumber) || other.identityNumber == identityNumber)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.memberType, memberType) || other.memberType == memberType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,identityNumber,dateOfBirth,memberType);

@override
String toString() {
  return 'BookingMemberRequest(fullName: $fullName, identityNumber: $identityNumber, dateOfBirth: $dateOfBirth, memberType: $memberType)';
}


}

/// @nodoc
abstract mixin class $BookingMemberRequestCopyWith<$Res>  {
  factory $BookingMemberRequestCopyWith(BookingMemberRequest value, $Res Function(BookingMemberRequest) _then) = _$BookingMemberRequestCopyWithImpl;
@useResult
$Res call({
 String fullName, String identityNumber, String dateOfBirth, String memberType
});




}
/// @nodoc
class _$BookingMemberRequestCopyWithImpl<$Res>
    implements $BookingMemberRequestCopyWith<$Res> {
  _$BookingMemberRequestCopyWithImpl(this._self, this._then);

  final BookingMemberRequest _self;
  final $Res Function(BookingMemberRequest) _then;

/// Create a copy of BookingMemberRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = null,Object? identityNumber = null,Object? dateOfBirth = null,Object? memberType = null,}) {
  return _then(_self.copyWith(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,identityNumber: null == identityNumber ? _self.identityNumber : identityNumber // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String,memberType: null == memberType ? _self.memberType : memberType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingMemberRequest].
extension BookingMemberRequestPatterns on BookingMemberRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingMemberRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingMemberRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingMemberRequest value)  $default,){
final _that = this;
switch (_that) {
case _BookingMemberRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingMemberRequest value)?  $default,){
final _that = this;
switch (_that) {
case _BookingMemberRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fullName,  String identityNumber,  String dateOfBirth,  String memberType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingMemberRequest() when $default != null:
return $default(_that.fullName,_that.identityNumber,_that.dateOfBirth,_that.memberType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fullName,  String identityNumber,  String dateOfBirth,  String memberType)  $default,) {final _that = this;
switch (_that) {
case _BookingMemberRequest():
return $default(_that.fullName,_that.identityNumber,_that.dateOfBirth,_that.memberType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fullName,  String identityNumber,  String dateOfBirth,  String memberType)?  $default,) {final _that = this;
switch (_that) {
case _BookingMemberRequest() when $default != null:
return $default(_that.fullName,_that.identityNumber,_that.dateOfBirth,_that.memberType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookingMemberRequest implements BookingMemberRequest {
  const _BookingMemberRequest({required this.fullName, this.identityNumber = '', this.dateOfBirth = '', this.memberType = 'ADULT'});
  factory _BookingMemberRequest.fromJson(Map<String, dynamic> json) => _$BookingMemberRequestFromJson(json);

@override final  String fullName;
@override@JsonKey() final  String identityNumber;
@override@JsonKey() final  String dateOfBirth;
@override@JsonKey() final  String memberType;

/// Create a copy of BookingMemberRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingMemberRequestCopyWith<_BookingMemberRequest> get copyWith => __$BookingMemberRequestCopyWithImpl<_BookingMemberRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingMemberRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingMemberRequest&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.identityNumber, identityNumber) || other.identityNumber == identityNumber)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.memberType, memberType) || other.memberType == memberType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,identityNumber,dateOfBirth,memberType);

@override
String toString() {
  return 'BookingMemberRequest(fullName: $fullName, identityNumber: $identityNumber, dateOfBirth: $dateOfBirth, memberType: $memberType)';
}


}

/// @nodoc
abstract mixin class _$BookingMemberRequestCopyWith<$Res> implements $BookingMemberRequestCopyWith<$Res> {
  factory _$BookingMemberRequestCopyWith(_BookingMemberRequest value, $Res Function(_BookingMemberRequest) _then) = __$BookingMemberRequestCopyWithImpl;
@override @useResult
$Res call({
 String fullName, String identityNumber, String dateOfBirth, String memberType
});




}
/// @nodoc
class __$BookingMemberRequestCopyWithImpl<$Res>
    implements _$BookingMemberRequestCopyWith<$Res> {
  __$BookingMemberRequestCopyWithImpl(this._self, this._then);

  final _BookingMemberRequest _self;
  final $Res Function(_BookingMemberRequest) _then;

/// Create a copy of BookingMemberRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = null,Object? identityNumber = null,Object? dateOfBirth = null,Object? memberType = null,}) {
  return _then(_BookingMemberRequest(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,identityNumber: null == identityNumber ? _self.identityNumber : identityNumber // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String,memberType: null == memberType ? _self.memberType : memberType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
