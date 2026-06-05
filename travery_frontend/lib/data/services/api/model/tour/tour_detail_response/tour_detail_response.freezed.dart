// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tour_detail_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TourDetailResponse {

 String get id; String get name; String get description; double get pricePerAdult; double get pricePerChild; double get averageRating; int get ratingCount; String get startLocation; int get durationDays; List<TourItineraryResponse> get itineraryList; List<ImageResponse> get images; DestinationResponse? get destination; RefundPolicyResponse? get refundPolicy;
/// Create a copy of TourDetailResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TourDetailResponseCopyWith<TourDetailResponse> get copyWith => _$TourDetailResponseCopyWithImpl<TourDetailResponse>(this as TourDetailResponse, _$identity);

  /// Serializes this TourDetailResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TourDetailResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.pricePerAdult, pricePerAdult) || other.pricePerAdult == pricePerAdult)&&(identical(other.pricePerChild, pricePerChild) || other.pricePerChild == pricePerChild)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.ratingCount, ratingCount) || other.ratingCount == ratingCount)&&(identical(other.startLocation, startLocation) || other.startLocation == startLocation)&&(identical(other.durationDays, durationDays) || other.durationDays == durationDays)&&const DeepCollectionEquality().equals(other.itineraryList, itineraryList)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.refundPolicy, refundPolicy) || other.refundPolicy == refundPolicy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,pricePerAdult,pricePerChild,averageRating,ratingCount,startLocation,durationDays,const DeepCollectionEquality().hash(itineraryList),const DeepCollectionEquality().hash(images),destination,refundPolicy);

@override
String toString() {
  return 'TourDetailResponse(id: $id, name: $name, description: $description, pricePerAdult: $pricePerAdult, pricePerChild: $pricePerChild, averageRating: $averageRating, ratingCount: $ratingCount, startLocation: $startLocation, durationDays: $durationDays, itineraryList: $itineraryList, images: $images, destination: $destination, refundPolicy: $refundPolicy)';
}


}

/// @nodoc
abstract mixin class $TourDetailResponseCopyWith<$Res>  {
  factory $TourDetailResponseCopyWith(TourDetailResponse value, $Res Function(TourDetailResponse) _then) = _$TourDetailResponseCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, double pricePerAdult, double pricePerChild, double averageRating, int ratingCount, String startLocation, int durationDays, List<TourItineraryResponse> itineraryList, List<ImageResponse> images, DestinationResponse? destination, RefundPolicyResponse? refundPolicy
});


$DestinationResponseCopyWith<$Res>? get destination;$RefundPolicyResponseCopyWith<$Res>? get refundPolicy;

}
/// @nodoc
class _$TourDetailResponseCopyWithImpl<$Res>
    implements $TourDetailResponseCopyWith<$Res> {
  _$TourDetailResponseCopyWithImpl(this._self, this._then);

  final TourDetailResponse _self;
  final $Res Function(TourDetailResponse) _then;

/// Create a copy of TourDetailResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? pricePerAdult = null,Object? pricePerChild = null,Object? averageRating = null,Object? ratingCount = null,Object? startLocation = null,Object? durationDays = null,Object? itineraryList = null,Object? images = null,Object? destination = freezed,Object? refundPolicy = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,pricePerAdult: null == pricePerAdult ? _self.pricePerAdult : pricePerAdult // ignore: cast_nullable_to_non_nullable
as double,pricePerChild: null == pricePerChild ? _self.pricePerChild : pricePerChild // ignore: cast_nullable_to_non_nullable
as double,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double,ratingCount: null == ratingCount ? _self.ratingCount : ratingCount // ignore: cast_nullable_to_non_nullable
as int,startLocation: null == startLocation ? _self.startLocation : startLocation // ignore: cast_nullable_to_non_nullable
as String,durationDays: null == durationDays ? _self.durationDays : durationDays // ignore: cast_nullable_to_non_nullable
as int,itineraryList: null == itineraryList ? _self.itineraryList : itineraryList // ignore: cast_nullable_to_non_nullable
as List<TourItineraryResponse>,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<ImageResponse>,destination: freezed == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as DestinationResponse?,refundPolicy: freezed == refundPolicy ? _self.refundPolicy : refundPolicy // ignore: cast_nullable_to_non_nullable
as RefundPolicyResponse?,
  ));
}
/// Create a copy of TourDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DestinationResponseCopyWith<$Res>? get destination {
    if (_self.destination == null) {
    return null;
  }

  return $DestinationResponseCopyWith<$Res>(_self.destination!, (value) {
    return _then(_self.copyWith(destination: value));
  });
}/// Create a copy of TourDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RefundPolicyResponseCopyWith<$Res>? get refundPolicy {
    if (_self.refundPolicy == null) {
    return null;
  }

  return $RefundPolicyResponseCopyWith<$Res>(_self.refundPolicy!, (value) {
    return _then(_self.copyWith(refundPolicy: value));
  });
}
}


/// Adds pattern-matching-related methods to [TourDetailResponse].
extension TourDetailResponsePatterns on TourDetailResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TourDetailResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TourDetailResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TourDetailResponse value)  $default,){
final _that = this;
switch (_that) {
case _TourDetailResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TourDetailResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TourDetailResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  double pricePerAdult,  double pricePerChild,  double averageRating,  int ratingCount,  String startLocation,  int durationDays,  List<TourItineraryResponse> itineraryList,  List<ImageResponse> images,  DestinationResponse? destination,  RefundPolicyResponse? refundPolicy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TourDetailResponse() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.pricePerAdult,_that.pricePerChild,_that.averageRating,_that.ratingCount,_that.startLocation,_that.durationDays,_that.itineraryList,_that.images,_that.destination,_that.refundPolicy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  double pricePerAdult,  double pricePerChild,  double averageRating,  int ratingCount,  String startLocation,  int durationDays,  List<TourItineraryResponse> itineraryList,  List<ImageResponse> images,  DestinationResponse? destination,  RefundPolicyResponse? refundPolicy)  $default,) {final _that = this;
switch (_that) {
case _TourDetailResponse():
return $default(_that.id,_that.name,_that.description,_that.pricePerAdult,_that.pricePerChild,_that.averageRating,_that.ratingCount,_that.startLocation,_that.durationDays,_that.itineraryList,_that.images,_that.destination,_that.refundPolicy);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  double pricePerAdult,  double pricePerChild,  double averageRating,  int ratingCount,  String startLocation,  int durationDays,  List<TourItineraryResponse> itineraryList,  List<ImageResponse> images,  DestinationResponse? destination,  RefundPolicyResponse? refundPolicy)?  $default,) {final _that = this;
switch (_that) {
case _TourDetailResponse() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.pricePerAdult,_that.pricePerChild,_that.averageRating,_that.ratingCount,_that.startLocation,_that.durationDays,_that.itineraryList,_that.images,_that.destination,_that.refundPolicy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TourDetailResponse implements TourDetailResponse {
  const _TourDetailResponse({required this.id, required this.name, this.description = '', required this.pricePerAdult, required this.pricePerChild, this.averageRating = 0.0, this.ratingCount = 0, this.startLocation = '', this.durationDays = 0, final  List<TourItineraryResponse> itineraryList = const [], final  List<ImageResponse> images = const [], this.destination, this.refundPolicy}): _itineraryList = itineraryList,_images = images;
  factory _TourDetailResponse.fromJson(Map<String, dynamic> json) => _$TourDetailResponseFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey() final  String description;
@override final  double pricePerAdult;
@override final  double pricePerChild;
@override@JsonKey() final  double averageRating;
@override@JsonKey() final  int ratingCount;
@override@JsonKey() final  String startLocation;
@override@JsonKey() final  int durationDays;
 final  List<TourItineraryResponse> _itineraryList;
@override@JsonKey() List<TourItineraryResponse> get itineraryList {
  if (_itineraryList is EqualUnmodifiableListView) return _itineraryList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_itineraryList);
}

 final  List<ImageResponse> _images;
@override@JsonKey() List<ImageResponse> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

@override final  DestinationResponse? destination;
@override final  RefundPolicyResponse? refundPolicy;

/// Create a copy of TourDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TourDetailResponseCopyWith<_TourDetailResponse> get copyWith => __$TourDetailResponseCopyWithImpl<_TourDetailResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TourDetailResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TourDetailResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.pricePerAdult, pricePerAdult) || other.pricePerAdult == pricePerAdult)&&(identical(other.pricePerChild, pricePerChild) || other.pricePerChild == pricePerChild)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.ratingCount, ratingCount) || other.ratingCount == ratingCount)&&(identical(other.startLocation, startLocation) || other.startLocation == startLocation)&&(identical(other.durationDays, durationDays) || other.durationDays == durationDays)&&const DeepCollectionEquality().equals(other._itineraryList, _itineraryList)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.refundPolicy, refundPolicy) || other.refundPolicy == refundPolicy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,pricePerAdult,pricePerChild,averageRating,ratingCount,startLocation,durationDays,const DeepCollectionEquality().hash(_itineraryList),const DeepCollectionEquality().hash(_images),destination,refundPolicy);

@override
String toString() {
  return 'TourDetailResponse(id: $id, name: $name, description: $description, pricePerAdult: $pricePerAdult, pricePerChild: $pricePerChild, averageRating: $averageRating, ratingCount: $ratingCount, startLocation: $startLocation, durationDays: $durationDays, itineraryList: $itineraryList, images: $images, destination: $destination, refundPolicy: $refundPolicy)';
}


}

/// @nodoc
abstract mixin class _$TourDetailResponseCopyWith<$Res> implements $TourDetailResponseCopyWith<$Res> {
  factory _$TourDetailResponseCopyWith(_TourDetailResponse value, $Res Function(_TourDetailResponse) _then) = __$TourDetailResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, double pricePerAdult, double pricePerChild, double averageRating, int ratingCount, String startLocation, int durationDays, List<TourItineraryResponse> itineraryList, List<ImageResponse> images, DestinationResponse? destination, RefundPolicyResponse? refundPolicy
});


@override $DestinationResponseCopyWith<$Res>? get destination;@override $RefundPolicyResponseCopyWith<$Res>? get refundPolicy;

}
/// @nodoc
class __$TourDetailResponseCopyWithImpl<$Res>
    implements _$TourDetailResponseCopyWith<$Res> {
  __$TourDetailResponseCopyWithImpl(this._self, this._then);

  final _TourDetailResponse _self;
  final $Res Function(_TourDetailResponse) _then;

/// Create a copy of TourDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? pricePerAdult = null,Object? pricePerChild = null,Object? averageRating = null,Object? ratingCount = null,Object? startLocation = null,Object? durationDays = null,Object? itineraryList = null,Object? images = null,Object? destination = freezed,Object? refundPolicy = freezed,}) {
  return _then(_TourDetailResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,pricePerAdult: null == pricePerAdult ? _self.pricePerAdult : pricePerAdult // ignore: cast_nullable_to_non_nullable
as double,pricePerChild: null == pricePerChild ? _self.pricePerChild : pricePerChild // ignore: cast_nullable_to_non_nullable
as double,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double,ratingCount: null == ratingCount ? _self.ratingCount : ratingCount // ignore: cast_nullable_to_non_nullable
as int,startLocation: null == startLocation ? _self.startLocation : startLocation // ignore: cast_nullable_to_non_nullable
as String,durationDays: null == durationDays ? _self.durationDays : durationDays // ignore: cast_nullable_to_non_nullable
as int,itineraryList: null == itineraryList ? _self._itineraryList : itineraryList // ignore: cast_nullable_to_non_nullable
as List<TourItineraryResponse>,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<ImageResponse>,destination: freezed == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as DestinationResponse?,refundPolicy: freezed == refundPolicy ? _self.refundPolicy : refundPolicy // ignore: cast_nullable_to_non_nullable
as RefundPolicyResponse?,
  ));
}

/// Create a copy of TourDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DestinationResponseCopyWith<$Res>? get destination {
    if (_self.destination == null) {
    return null;
  }

  return $DestinationResponseCopyWith<$Res>(_self.destination!, (value) {
    return _then(_self.copyWith(destination: value));
  });
}/// Create a copy of TourDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RefundPolicyResponseCopyWith<$Res>? get refundPolicy {
    if (_self.refundPolicy == null) {
    return null;
  }

  return $RefundPolicyResponseCopyWith<$Res>(_self.refundPolicy!, (value) {
    return _then(_self.copyWith(refundPolicy: value));
  });
}
}

// dart format on
