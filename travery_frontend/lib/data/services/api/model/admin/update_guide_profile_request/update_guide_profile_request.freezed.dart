// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_guide_profile_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateGuideProfileRequest {

 String? get fullName; String? get phoneNumber; String? get guideLicense; int? get yearsExperience; List<String>? get languages;
/// Create a copy of UpdateGuideProfileRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateGuideProfileRequestCopyWith<UpdateGuideProfileRequest> get copyWith => _$UpdateGuideProfileRequestCopyWithImpl<UpdateGuideProfileRequest>(this as UpdateGuideProfileRequest, _$identity);

  /// Serializes this UpdateGuideProfileRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateGuideProfileRequest&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.guideLicense, guideLicense) || other.guideLicense == guideLicense)&&(identical(other.yearsExperience, yearsExperience) || other.yearsExperience == yearsExperience)&&const DeepCollectionEquality().equals(other.languages, languages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,phoneNumber,guideLicense,yearsExperience,const DeepCollectionEquality().hash(languages));

@override
String toString() {
  return 'UpdateGuideProfileRequest(fullName: $fullName, phoneNumber: $phoneNumber, guideLicense: $guideLicense, yearsExperience: $yearsExperience, languages: $languages)';
}


}

/// @nodoc
abstract mixin class $UpdateGuideProfileRequestCopyWith<$Res>  {
  factory $UpdateGuideProfileRequestCopyWith(UpdateGuideProfileRequest value, $Res Function(UpdateGuideProfileRequest) _then) = _$UpdateGuideProfileRequestCopyWithImpl;
@useResult
$Res call({
 String? fullName, String? phoneNumber, String? guideLicense, int? yearsExperience, List<String>? languages
});




}
/// @nodoc
class _$UpdateGuideProfileRequestCopyWithImpl<$Res>
    implements $UpdateGuideProfileRequestCopyWith<$Res> {
  _$UpdateGuideProfileRequestCopyWithImpl(this._self, this._then);

  final UpdateGuideProfileRequest _self;
  final $Res Function(UpdateGuideProfileRequest) _then;

/// Create a copy of UpdateGuideProfileRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = freezed,Object? phoneNumber = freezed,Object? guideLicense = freezed,Object? yearsExperience = freezed,Object? languages = freezed,}) {
  return _then(_self.copyWith(
fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,guideLicense: freezed == guideLicense ? _self.guideLicense : guideLicense // ignore: cast_nullable_to_non_nullable
as String?,yearsExperience: freezed == yearsExperience ? _self.yearsExperience : yearsExperience // ignore: cast_nullable_to_non_nullable
as int?,languages: freezed == languages ? _self.languages : languages // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateGuideProfileRequest].
extension UpdateGuideProfileRequestPatterns on UpdateGuideProfileRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateGuideProfileRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateGuideProfileRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateGuideProfileRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateGuideProfileRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateGuideProfileRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateGuideProfileRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? fullName,  String? phoneNumber,  String? guideLicense,  int? yearsExperience,  List<String>? languages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateGuideProfileRequest() when $default != null:
return $default(_that.fullName,_that.phoneNumber,_that.guideLicense,_that.yearsExperience,_that.languages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? fullName,  String? phoneNumber,  String? guideLicense,  int? yearsExperience,  List<String>? languages)  $default,) {final _that = this;
switch (_that) {
case _UpdateGuideProfileRequest():
return $default(_that.fullName,_that.phoneNumber,_that.guideLicense,_that.yearsExperience,_that.languages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? fullName,  String? phoneNumber,  String? guideLicense,  int? yearsExperience,  List<String>? languages)?  $default,) {final _that = this;
switch (_that) {
case _UpdateGuideProfileRequest() when $default != null:
return $default(_that.fullName,_that.phoneNumber,_that.guideLicense,_that.yearsExperience,_that.languages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateGuideProfileRequest implements UpdateGuideProfileRequest {
  const _UpdateGuideProfileRequest({this.fullName, this.phoneNumber, this.guideLicense, this.yearsExperience, final  List<String>? languages}): _languages = languages;
  factory _UpdateGuideProfileRequest.fromJson(Map<String, dynamic> json) => _$UpdateGuideProfileRequestFromJson(json);

@override final  String? fullName;
@override final  String? phoneNumber;
@override final  String? guideLicense;
@override final  int? yearsExperience;
 final  List<String>? _languages;
@override List<String>? get languages {
  final value = _languages;
  if (value == null) return null;
  if (_languages is EqualUnmodifiableListView) return _languages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of UpdateGuideProfileRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateGuideProfileRequestCopyWith<_UpdateGuideProfileRequest> get copyWith => __$UpdateGuideProfileRequestCopyWithImpl<_UpdateGuideProfileRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateGuideProfileRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateGuideProfileRequest&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.guideLicense, guideLicense) || other.guideLicense == guideLicense)&&(identical(other.yearsExperience, yearsExperience) || other.yearsExperience == yearsExperience)&&const DeepCollectionEquality().equals(other._languages, _languages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,phoneNumber,guideLicense,yearsExperience,const DeepCollectionEquality().hash(_languages));

@override
String toString() {
  return 'UpdateGuideProfileRequest(fullName: $fullName, phoneNumber: $phoneNumber, guideLicense: $guideLicense, yearsExperience: $yearsExperience, languages: $languages)';
}


}

/// @nodoc
abstract mixin class _$UpdateGuideProfileRequestCopyWith<$Res> implements $UpdateGuideProfileRequestCopyWith<$Res> {
  factory _$UpdateGuideProfileRequestCopyWith(_UpdateGuideProfileRequest value, $Res Function(_UpdateGuideProfileRequest) _then) = __$UpdateGuideProfileRequestCopyWithImpl;
@override @useResult
$Res call({
 String? fullName, String? phoneNumber, String? guideLicense, int? yearsExperience, List<String>? languages
});




}
/// @nodoc
class __$UpdateGuideProfileRequestCopyWithImpl<$Res>
    implements _$UpdateGuideProfileRequestCopyWith<$Res> {
  __$UpdateGuideProfileRequestCopyWithImpl(this._self, this._then);

  final _UpdateGuideProfileRequest _self;
  final $Res Function(_UpdateGuideProfileRequest) _then;

/// Create a copy of UpdateGuideProfileRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = freezed,Object? phoneNumber = freezed,Object? guideLicense = freezed,Object? yearsExperience = freezed,Object? languages = freezed,}) {
  return _then(_UpdateGuideProfileRequest(
fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,guideLicense: freezed == guideLicense ? _self.guideLicense : guideLicense // ignore: cast_nullable_to_non_nullable
as String?,yearsExperience: freezed == yearsExperience ? _self.yearsExperience : yearsExperience // ignore: cast_nullable_to_non_nullable
as int?,languages: freezed == languages ? _self._languages : languages // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
