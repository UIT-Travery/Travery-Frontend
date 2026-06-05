// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'destination_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DestinationResponse {

 String? get id; String? get code; String? get name; String? get region; String? get imageUrl; String? get description;
/// Create a copy of DestinationResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DestinationResponseCopyWith<DestinationResponse> get copyWith => _$DestinationResponseCopyWithImpl<DestinationResponse>(this as DestinationResponse, _$identity);

  /// Serializes this DestinationResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DestinationResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.region, region) || other.region == region)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,name,region,imageUrl,description);

@override
String toString() {
  return 'DestinationResponse(id: $id, code: $code, name: $name, region: $region, imageUrl: $imageUrl, description: $description)';
}


}

/// @nodoc
abstract mixin class $DestinationResponseCopyWith<$Res>  {
  factory $DestinationResponseCopyWith(DestinationResponse value, $Res Function(DestinationResponse) _then) = _$DestinationResponseCopyWithImpl;
@useResult
$Res call({
 String? id, String? code, String? name, String? region, String? imageUrl, String? description
});




}
/// @nodoc
class _$DestinationResponseCopyWithImpl<$Res>
    implements $DestinationResponseCopyWith<$Res> {
  _$DestinationResponseCopyWithImpl(this._self, this._then);

  final DestinationResponse _self;
  final $Res Function(DestinationResponse) _then;

/// Create a copy of DestinationResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? code = freezed,Object? name = freezed,Object? region = freezed,Object? imageUrl = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DestinationResponse].
extension DestinationResponsePatterns on DestinationResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DestinationResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DestinationResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DestinationResponse value)  $default,){
final _that = this;
switch (_that) {
case _DestinationResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DestinationResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DestinationResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? code,  String? name,  String? region,  String? imageUrl,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DestinationResponse() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.region,_that.imageUrl,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? code,  String? name,  String? region,  String? imageUrl,  String? description)  $default,) {final _that = this;
switch (_that) {
case _DestinationResponse():
return $default(_that.id,_that.code,_that.name,_that.region,_that.imageUrl,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? code,  String? name,  String? region,  String? imageUrl,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _DestinationResponse() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.region,_that.imageUrl,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DestinationResponse implements DestinationResponse {
  const _DestinationResponse({this.id, this.code, this.name, this.region, this.imageUrl, this.description});
  factory _DestinationResponse.fromJson(Map<String, dynamic> json) => _$DestinationResponseFromJson(json);

@override final  String? id;
@override final  String? code;
@override final  String? name;
@override final  String? region;
@override final  String? imageUrl;
@override final  String? description;

/// Create a copy of DestinationResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DestinationResponseCopyWith<_DestinationResponse> get copyWith => __$DestinationResponseCopyWithImpl<_DestinationResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DestinationResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DestinationResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.region, region) || other.region == region)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,name,region,imageUrl,description);

@override
String toString() {
  return 'DestinationResponse(id: $id, code: $code, name: $name, region: $region, imageUrl: $imageUrl, description: $description)';
}


}

/// @nodoc
abstract mixin class _$DestinationResponseCopyWith<$Res> implements $DestinationResponseCopyWith<$Res> {
  factory _$DestinationResponseCopyWith(_DestinationResponse value, $Res Function(_DestinationResponse) _then) = __$DestinationResponseCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? code, String? name, String? region, String? imageUrl, String? description
});




}
/// @nodoc
class __$DestinationResponseCopyWithImpl<$Res>
    implements _$DestinationResponseCopyWith<$Res> {
  __$DestinationResponseCopyWithImpl(this._self, this._then);

  final _DestinationResponse _self;
  final $Res Function(_DestinationResponse) _then;

/// Create a copy of DestinationResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? code = freezed,Object? name = freezed,Object? region = freezed,Object? imageUrl = freezed,Object? description = freezed,}) {
  return _then(_DestinationResponse(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
