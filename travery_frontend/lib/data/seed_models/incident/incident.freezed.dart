// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'incident.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Incident {

 String? get id;@JsonKey(name: 'handled_by') String? get handledBy;@JsonKey(name: 'tour_booking_id') String? get tourBookingId;@JsonKey(name: 'coach_booking_id') String? get coachBookingId;@JsonKey(name: 'hotel_booking_id') String? get hotelBookingId;@JsonKey(name: 'reported_by_user_id') String? get reportedByUserId;@JsonKey(name: 'reported_by_staff_id') String? get reportedByStaffId; IncidentType get type; IncidentSeverity get severity; String? get description;@JsonKey(name: 'image_url') String? get imageUrl; String? get location; IncidentStatus get status;@JsonKey(name: 'reported_at') DateTime? get reportedAt;@JsonKey(name: 'resolved_at') DateTime? get resolvedAt;@JsonKey(name: 'resolution_notes') String? get resolutionNotes;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of Incident
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncidentCopyWith<Incident> get copyWith => _$IncidentCopyWithImpl<Incident>(this as Incident, _$identity);

  /// Serializes this Incident to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Incident&&(identical(other.id, id) || other.id == id)&&(identical(other.handledBy, handledBy) || other.handledBy == handledBy)&&(identical(other.tourBookingId, tourBookingId) || other.tourBookingId == tourBookingId)&&(identical(other.coachBookingId, coachBookingId) || other.coachBookingId == coachBookingId)&&(identical(other.hotelBookingId, hotelBookingId) || other.hotelBookingId == hotelBookingId)&&(identical(other.reportedByUserId, reportedByUserId) || other.reportedByUserId == reportedByUserId)&&(identical(other.reportedByStaffId, reportedByStaffId) || other.reportedByStaffId == reportedByStaffId)&&(identical(other.type, type) || other.type == type)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.location, location) || other.location == location)&&(identical(other.status, status) || other.status == status)&&(identical(other.reportedAt, reportedAt) || other.reportedAt == reportedAt)&&(identical(other.resolvedAt, resolvedAt) || other.resolvedAt == resolvedAt)&&(identical(other.resolutionNotes, resolutionNotes) || other.resolutionNotes == resolutionNotes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,handledBy,tourBookingId,coachBookingId,hotelBookingId,reportedByUserId,reportedByStaffId,type,severity,description,imageUrl,location,status,reportedAt,resolvedAt,resolutionNotes,createdAt,updatedAt);

@override
String toString() {
  return 'Incident(id: $id, handledBy: $handledBy, tourBookingId: $tourBookingId, coachBookingId: $coachBookingId, hotelBookingId: $hotelBookingId, reportedByUserId: $reportedByUserId, reportedByStaffId: $reportedByStaffId, type: $type, severity: $severity, description: $description, imageUrl: $imageUrl, location: $location, status: $status, reportedAt: $reportedAt, resolvedAt: $resolvedAt, resolutionNotes: $resolutionNotes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $IncidentCopyWith<$Res>  {
  factory $IncidentCopyWith(Incident value, $Res Function(Incident) _then) = _$IncidentCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'handled_by') String? handledBy,@JsonKey(name: 'tour_booking_id') String? tourBookingId,@JsonKey(name: 'coach_booking_id') String? coachBookingId,@JsonKey(name: 'hotel_booking_id') String? hotelBookingId,@JsonKey(name: 'reported_by_user_id') String? reportedByUserId,@JsonKey(name: 'reported_by_staff_id') String? reportedByStaffId, IncidentType type, IncidentSeverity severity, String? description,@JsonKey(name: 'image_url') String? imageUrl, String? location, IncidentStatus status,@JsonKey(name: 'reported_at') DateTime? reportedAt,@JsonKey(name: 'resolved_at') DateTime? resolvedAt,@JsonKey(name: 'resolution_notes') String? resolutionNotes,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$IncidentCopyWithImpl<$Res>
    implements $IncidentCopyWith<$Res> {
  _$IncidentCopyWithImpl(this._self, this._then);

  final Incident _self;
  final $Res Function(Incident) _then;

/// Create a copy of Incident
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? handledBy = freezed,Object? tourBookingId = freezed,Object? coachBookingId = freezed,Object? hotelBookingId = freezed,Object? reportedByUserId = freezed,Object? reportedByStaffId = freezed,Object? type = null,Object? severity = null,Object? description = freezed,Object? imageUrl = freezed,Object? location = freezed,Object? status = null,Object? reportedAt = freezed,Object? resolvedAt = freezed,Object? resolutionNotes = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,handledBy: freezed == handledBy ? _self.handledBy : handledBy // ignore: cast_nullable_to_non_nullable
as String?,tourBookingId: freezed == tourBookingId ? _self.tourBookingId : tourBookingId // ignore: cast_nullable_to_non_nullable
as String?,coachBookingId: freezed == coachBookingId ? _self.coachBookingId : coachBookingId // ignore: cast_nullable_to_non_nullable
as String?,hotelBookingId: freezed == hotelBookingId ? _self.hotelBookingId : hotelBookingId // ignore: cast_nullable_to_non_nullable
as String?,reportedByUserId: freezed == reportedByUserId ? _self.reportedByUserId : reportedByUserId // ignore: cast_nullable_to_non_nullable
as String?,reportedByStaffId: freezed == reportedByStaffId ? _self.reportedByStaffId : reportedByStaffId // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as IncidentType,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as IncidentSeverity,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as IncidentStatus,reportedAt: freezed == reportedAt ? _self.reportedAt : reportedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,resolvedAt: freezed == resolvedAt ? _self.resolvedAt : resolvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,resolutionNotes: freezed == resolutionNotes ? _self.resolutionNotes : resolutionNotes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Incident].
extension IncidentPatterns on Incident {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Incident value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Incident() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Incident value)  $default,){
final _that = this;
switch (_that) {
case _Incident():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Incident value)?  $default,){
final _that = this;
switch (_that) {
case _Incident() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'handled_by')  String? handledBy, @JsonKey(name: 'tour_booking_id')  String? tourBookingId, @JsonKey(name: 'coach_booking_id')  String? coachBookingId, @JsonKey(name: 'hotel_booking_id')  String? hotelBookingId, @JsonKey(name: 'reported_by_user_id')  String? reportedByUserId, @JsonKey(name: 'reported_by_staff_id')  String? reportedByStaffId,  IncidentType type,  IncidentSeverity severity,  String? description, @JsonKey(name: 'image_url')  String? imageUrl,  String? location,  IncidentStatus status, @JsonKey(name: 'reported_at')  DateTime? reportedAt, @JsonKey(name: 'resolved_at')  DateTime? resolvedAt, @JsonKey(name: 'resolution_notes')  String? resolutionNotes, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Incident() when $default != null:
return $default(_that.id,_that.handledBy,_that.tourBookingId,_that.coachBookingId,_that.hotelBookingId,_that.reportedByUserId,_that.reportedByStaffId,_that.type,_that.severity,_that.description,_that.imageUrl,_that.location,_that.status,_that.reportedAt,_that.resolvedAt,_that.resolutionNotes,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'handled_by')  String? handledBy, @JsonKey(name: 'tour_booking_id')  String? tourBookingId, @JsonKey(name: 'coach_booking_id')  String? coachBookingId, @JsonKey(name: 'hotel_booking_id')  String? hotelBookingId, @JsonKey(name: 'reported_by_user_id')  String? reportedByUserId, @JsonKey(name: 'reported_by_staff_id')  String? reportedByStaffId,  IncidentType type,  IncidentSeverity severity,  String? description, @JsonKey(name: 'image_url')  String? imageUrl,  String? location,  IncidentStatus status, @JsonKey(name: 'reported_at')  DateTime? reportedAt, @JsonKey(name: 'resolved_at')  DateTime? resolvedAt, @JsonKey(name: 'resolution_notes')  String? resolutionNotes, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Incident():
return $default(_that.id,_that.handledBy,_that.tourBookingId,_that.coachBookingId,_that.hotelBookingId,_that.reportedByUserId,_that.reportedByStaffId,_that.type,_that.severity,_that.description,_that.imageUrl,_that.location,_that.status,_that.reportedAt,_that.resolvedAt,_that.resolutionNotes,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'handled_by')  String? handledBy, @JsonKey(name: 'tour_booking_id')  String? tourBookingId, @JsonKey(name: 'coach_booking_id')  String? coachBookingId, @JsonKey(name: 'hotel_booking_id')  String? hotelBookingId, @JsonKey(name: 'reported_by_user_id')  String? reportedByUserId, @JsonKey(name: 'reported_by_staff_id')  String? reportedByStaffId,  IncidentType type,  IncidentSeverity severity,  String? description, @JsonKey(name: 'image_url')  String? imageUrl,  String? location,  IncidentStatus status, @JsonKey(name: 'reported_at')  DateTime? reportedAt, @JsonKey(name: 'resolved_at')  DateTime? resolvedAt, @JsonKey(name: 'resolution_notes')  String? resolutionNotes, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Incident() when $default != null:
return $default(_that.id,_that.handledBy,_that.tourBookingId,_that.coachBookingId,_that.hotelBookingId,_that.reportedByUserId,_that.reportedByStaffId,_that.type,_that.severity,_that.description,_that.imageUrl,_that.location,_that.status,_that.reportedAt,_that.resolvedAt,_that.resolutionNotes,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Incident implements Incident {
  const _Incident({this.id, @JsonKey(name: 'handled_by') this.handledBy, @JsonKey(name: 'tour_booking_id') this.tourBookingId, @JsonKey(name: 'coach_booking_id') this.coachBookingId, @JsonKey(name: 'hotel_booking_id') this.hotelBookingId, @JsonKey(name: 'reported_by_user_id') this.reportedByUserId, @JsonKey(name: 'reported_by_staff_id') this.reportedByStaffId, required this.type, required this.severity, this.description, @JsonKey(name: 'image_url') this.imageUrl, this.location, required this.status, @JsonKey(name: 'reported_at') this.reportedAt, @JsonKey(name: 'resolved_at') this.resolvedAt, @JsonKey(name: 'resolution_notes') this.resolutionNotes, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _Incident.fromJson(Map<String, dynamic> json) => _$IncidentFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'handled_by') final  String? handledBy;
@override@JsonKey(name: 'tour_booking_id') final  String? tourBookingId;
@override@JsonKey(name: 'coach_booking_id') final  String? coachBookingId;
@override@JsonKey(name: 'hotel_booking_id') final  String? hotelBookingId;
@override@JsonKey(name: 'reported_by_user_id') final  String? reportedByUserId;
@override@JsonKey(name: 'reported_by_staff_id') final  String? reportedByStaffId;
@override final  IncidentType type;
@override final  IncidentSeverity severity;
@override final  String? description;
@override@JsonKey(name: 'image_url') final  String? imageUrl;
@override final  String? location;
@override final  IncidentStatus status;
@override@JsonKey(name: 'reported_at') final  DateTime? reportedAt;
@override@JsonKey(name: 'resolved_at') final  DateTime? resolvedAt;
@override@JsonKey(name: 'resolution_notes') final  String? resolutionNotes;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of Incident
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IncidentCopyWith<_Incident> get copyWith => __$IncidentCopyWithImpl<_Incident>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IncidentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Incident&&(identical(other.id, id) || other.id == id)&&(identical(other.handledBy, handledBy) || other.handledBy == handledBy)&&(identical(other.tourBookingId, tourBookingId) || other.tourBookingId == tourBookingId)&&(identical(other.coachBookingId, coachBookingId) || other.coachBookingId == coachBookingId)&&(identical(other.hotelBookingId, hotelBookingId) || other.hotelBookingId == hotelBookingId)&&(identical(other.reportedByUserId, reportedByUserId) || other.reportedByUserId == reportedByUserId)&&(identical(other.reportedByStaffId, reportedByStaffId) || other.reportedByStaffId == reportedByStaffId)&&(identical(other.type, type) || other.type == type)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.location, location) || other.location == location)&&(identical(other.status, status) || other.status == status)&&(identical(other.reportedAt, reportedAt) || other.reportedAt == reportedAt)&&(identical(other.resolvedAt, resolvedAt) || other.resolvedAt == resolvedAt)&&(identical(other.resolutionNotes, resolutionNotes) || other.resolutionNotes == resolutionNotes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,handledBy,tourBookingId,coachBookingId,hotelBookingId,reportedByUserId,reportedByStaffId,type,severity,description,imageUrl,location,status,reportedAt,resolvedAt,resolutionNotes,createdAt,updatedAt);

@override
String toString() {
  return 'Incident(id: $id, handledBy: $handledBy, tourBookingId: $tourBookingId, coachBookingId: $coachBookingId, hotelBookingId: $hotelBookingId, reportedByUserId: $reportedByUserId, reportedByStaffId: $reportedByStaffId, type: $type, severity: $severity, description: $description, imageUrl: $imageUrl, location: $location, status: $status, reportedAt: $reportedAt, resolvedAt: $resolvedAt, resolutionNotes: $resolutionNotes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$IncidentCopyWith<$Res> implements $IncidentCopyWith<$Res> {
  factory _$IncidentCopyWith(_Incident value, $Res Function(_Incident) _then) = __$IncidentCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'handled_by') String? handledBy,@JsonKey(name: 'tour_booking_id') String? tourBookingId,@JsonKey(name: 'coach_booking_id') String? coachBookingId,@JsonKey(name: 'hotel_booking_id') String? hotelBookingId,@JsonKey(name: 'reported_by_user_id') String? reportedByUserId,@JsonKey(name: 'reported_by_staff_id') String? reportedByStaffId, IncidentType type, IncidentSeverity severity, String? description,@JsonKey(name: 'image_url') String? imageUrl, String? location, IncidentStatus status,@JsonKey(name: 'reported_at') DateTime? reportedAt,@JsonKey(name: 'resolved_at') DateTime? resolvedAt,@JsonKey(name: 'resolution_notes') String? resolutionNotes,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$IncidentCopyWithImpl<$Res>
    implements _$IncidentCopyWith<$Res> {
  __$IncidentCopyWithImpl(this._self, this._then);

  final _Incident _self;
  final $Res Function(_Incident) _then;

/// Create a copy of Incident
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? handledBy = freezed,Object? tourBookingId = freezed,Object? coachBookingId = freezed,Object? hotelBookingId = freezed,Object? reportedByUserId = freezed,Object? reportedByStaffId = freezed,Object? type = null,Object? severity = null,Object? description = freezed,Object? imageUrl = freezed,Object? location = freezed,Object? status = null,Object? reportedAt = freezed,Object? resolvedAt = freezed,Object? resolutionNotes = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Incident(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,handledBy: freezed == handledBy ? _self.handledBy : handledBy // ignore: cast_nullable_to_non_nullable
as String?,tourBookingId: freezed == tourBookingId ? _self.tourBookingId : tourBookingId // ignore: cast_nullable_to_non_nullable
as String?,coachBookingId: freezed == coachBookingId ? _self.coachBookingId : coachBookingId // ignore: cast_nullable_to_non_nullable
as String?,hotelBookingId: freezed == hotelBookingId ? _self.hotelBookingId : hotelBookingId // ignore: cast_nullable_to_non_nullable
as String?,reportedByUserId: freezed == reportedByUserId ? _self.reportedByUserId : reportedByUserId // ignore: cast_nullable_to_non_nullable
as String?,reportedByStaffId: freezed == reportedByStaffId ? _self.reportedByStaffId : reportedByStaffId // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as IncidentType,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as IncidentSeverity,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as IncidentStatus,reportedAt: freezed == reportedAt ? _self.reportedAt : reportedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,resolvedAt: freezed == resolvedAt ? _self.resolvedAt : resolvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,resolutionNotes: freezed == resolutionNotes ? _self.resolutionNotes : resolutionNotes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
