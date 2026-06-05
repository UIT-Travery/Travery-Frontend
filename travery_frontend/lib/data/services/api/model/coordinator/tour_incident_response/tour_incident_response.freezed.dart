// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tour_incident_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TourIncidentResponse {

 String get id; String get tourInstanceId; String get reporterId; String get reporterName; String get title; String get description; String get severity; String get status; String get createdAt; String get updatedAt;
/// Create a copy of TourIncidentResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TourIncidentResponseCopyWith<TourIncidentResponse> get copyWith => _$TourIncidentResponseCopyWithImpl<TourIncidentResponse>(this as TourIncidentResponse, _$identity);

  /// Serializes this TourIncidentResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TourIncidentResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.tourInstanceId, tourInstanceId) || other.tourInstanceId == tourInstanceId)&&(identical(other.reporterId, reporterId) || other.reporterId == reporterId)&&(identical(other.reporterName, reporterName) || other.reporterName == reporterName)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tourInstanceId,reporterId,reporterName,title,description,severity,status,createdAt,updatedAt);

@override
String toString() {
  return 'TourIncidentResponse(id: $id, tourInstanceId: $tourInstanceId, reporterId: $reporterId, reporterName: $reporterName, title: $title, description: $description, severity: $severity, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TourIncidentResponseCopyWith<$Res>  {
  factory $TourIncidentResponseCopyWith(TourIncidentResponse value, $Res Function(TourIncidentResponse) _then) = _$TourIncidentResponseCopyWithImpl;
@useResult
$Res call({
 String id, String tourInstanceId, String reporterId, String reporterName, String title, String description, String severity, String status, String createdAt, String updatedAt
});




}
/// @nodoc
class _$TourIncidentResponseCopyWithImpl<$Res>
    implements $TourIncidentResponseCopyWith<$Res> {
  _$TourIncidentResponseCopyWithImpl(this._self, this._then);

  final TourIncidentResponse _self;
  final $Res Function(TourIncidentResponse) _then;

/// Create a copy of TourIncidentResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tourInstanceId = null,Object? reporterId = null,Object? reporterName = null,Object? title = null,Object? description = null,Object? severity = null,Object? status = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tourInstanceId: null == tourInstanceId ? _self.tourInstanceId : tourInstanceId // ignore: cast_nullable_to_non_nullable
as String,reporterId: null == reporterId ? _self.reporterId : reporterId // ignore: cast_nullable_to_non_nullable
as String,reporterName: null == reporterName ? _self.reporterName : reporterName // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TourIncidentResponse].
extension TourIncidentResponsePatterns on TourIncidentResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TourIncidentResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TourIncidentResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TourIncidentResponse value)  $default,){
final _that = this;
switch (_that) {
case _TourIncidentResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TourIncidentResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TourIncidentResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String tourInstanceId,  String reporterId,  String reporterName,  String title,  String description,  String severity,  String status,  String createdAt,  String updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TourIncidentResponse() when $default != null:
return $default(_that.id,_that.tourInstanceId,_that.reporterId,_that.reporterName,_that.title,_that.description,_that.severity,_that.status,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String tourInstanceId,  String reporterId,  String reporterName,  String title,  String description,  String severity,  String status,  String createdAt,  String updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TourIncidentResponse():
return $default(_that.id,_that.tourInstanceId,_that.reporterId,_that.reporterName,_that.title,_that.description,_that.severity,_that.status,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String tourInstanceId,  String reporterId,  String reporterName,  String title,  String description,  String severity,  String status,  String createdAt,  String updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TourIncidentResponse() when $default != null:
return $default(_that.id,_that.tourInstanceId,_that.reporterId,_that.reporterName,_that.title,_that.description,_that.severity,_that.status,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TourIncidentResponse implements TourIncidentResponse {
  const _TourIncidentResponse({required this.id, required this.tourInstanceId, required this.reporterId, required this.reporterName, required this.title, required this.description, required this.severity, required this.status, this.createdAt = '', this.updatedAt = ''});
  factory _TourIncidentResponse.fromJson(Map<String, dynamic> json) => _$TourIncidentResponseFromJson(json);

@override final  String id;
@override final  String tourInstanceId;
@override final  String reporterId;
@override final  String reporterName;
@override final  String title;
@override final  String description;
@override final  String severity;
@override final  String status;
@override@JsonKey() final  String createdAt;
@override@JsonKey() final  String updatedAt;

/// Create a copy of TourIncidentResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TourIncidentResponseCopyWith<_TourIncidentResponse> get copyWith => __$TourIncidentResponseCopyWithImpl<_TourIncidentResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TourIncidentResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TourIncidentResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.tourInstanceId, tourInstanceId) || other.tourInstanceId == tourInstanceId)&&(identical(other.reporterId, reporterId) || other.reporterId == reporterId)&&(identical(other.reporterName, reporterName) || other.reporterName == reporterName)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tourInstanceId,reporterId,reporterName,title,description,severity,status,createdAt,updatedAt);

@override
String toString() {
  return 'TourIncidentResponse(id: $id, tourInstanceId: $tourInstanceId, reporterId: $reporterId, reporterName: $reporterName, title: $title, description: $description, severity: $severity, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TourIncidentResponseCopyWith<$Res> implements $TourIncidentResponseCopyWith<$Res> {
  factory _$TourIncidentResponseCopyWith(_TourIncidentResponse value, $Res Function(_TourIncidentResponse) _then) = __$TourIncidentResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, String tourInstanceId, String reporterId, String reporterName, String title, String description, String severity, String status, String createdAt, String updatedAt
});




}
/// @nodoc
class __$TourIncidentResponseCopyWithImpl<$Res>
    implements _$TourIncidentResponseCopyWith<$Res> {
  __$TourIncidentResponseCopyWithImpl(this._self, this._then);

  final _TourIncidentResponse _self;
  final $Res Function(_TourIncidentResponse) _then;

/// Create a copy of TourIncidentResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tourInstanceId = null,Object? reporterId = null,Object? reporterName = null,Object? title = null,Object? description = null,Object? severity = null,Object? status = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_TourIncidentResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tourInstanceId: null == tourInstanceId ? _self.tourInstanceId : tourInstanceId // ignore: cast_nullable_to_non_nullable
as String,reporterId: null == reporterId ? _self.reporterId : reporterId // ignore: cast_nullable_to_non_nullable
as String,reporterName: null == reporterName ? _self.reporterName : reporterName // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
