// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tour_instance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TourInstance {

 String? get id;@JsonKey(name: 'startDate') DateTime get startDate;@JsonKey(name: 'endDate') DateTime get endDate;@JsonKey(name: 'status') TourInstanceStatus get status;@JsonKey(name: 'availableSlots') int get availableSlots;/// RELATIONS
 List<TourBooking>? get bookings;
/// Create a copy of TourInstance
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TourInstanceCopyWith<TourInstance> get copyWith => _$TourInstanceCopyWithImpl<TourInstance>(this as TourInstance, _$identity);

  /// Serializes this TourInstance to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TourInstance&&(identical(other.id, id) || other.id == id)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.availableSlots, availableSlots) || other.availableSlots == availableSlots)&&const DeepCollectionEquality().equals(other.bookings, bookings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,startDate,endDate,status,availableSlots,const DeepCollectionEquality().hash(bookings));

@override
String toString() {
  return 'TourInstance(id: $id, startDate: $startDate, endDate: $endDate, status: $status, availableSlots: $availableSlots, bookings: $bookings)';
}


}

/// @nodoc
abstract mixin class $TourInstanceCopyWith<$Res>  {
  factory $TourInstanceCopyWith(TourInstance value, $Res Function(TourInstance) _then) = _$TourInstanceCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'startDate') DateTime startDate,@JsonKey(name: 'endDate') DateTime endDate,@JsonKey(name: 'status') TourInstanceStatus status,@JsonKey(name: 'availableSlots') int availableSlots, List<TourBooking>? bookings
});




}
/// @nodoc
class _$TourInstanceCopyWithImpl<$Res>
    implements $TourInstanceCopyWith<$Res> {
  _$TourInstanceCopyWithImpl(this._self, this._then);

  final TourInstance _self;
  final $Res Function(TourInstance) _then;

/// Create a copy of TourInstance
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? startDate = null,Object? endDate = null,Object? status = null,Object? availableSlots = null,Object? bookings = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TourInstanceStatus,availableSlots: null == availableSlots ? _self.availableSlots : availableSlots // ignore: cast_nullable_to_non_nullable
as int,bookings: freezed == bookings ? _self.bookings : bookings // ignore: cast_nullable_to_non_nullable
as List<TourBooking>?,
  ));
}

}


/// Adds pattern-matching-related methods to [TourInstance].
extension TourInstancePatterns on TourInstance {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TourInstance value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TourInstance() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TourInstance value)  $default,){
final _that = this;
switch (_that) {
case _TourInstance():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TourInstance value)?  $default,){
final _that = this;
switch (_that) {
case _TourInstance() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'startDate')  DateTime startDate, @JsonKey(name: 'endDate')  DateTime endDate, @JsonKey(name: 'status')  TourInstanceStatus status, @JsonKey(name: 'availableSlots')  int availableSlots,  List<TourBooking>? bookings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TourInstance() when $default != null:
return $default(_that.id,_that.startDate,_that.endDate,_that.status,_that.availableSlots,_that.bookings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'startDate')  DateTime startDate, @JsonKey(name: 'endDate')  DateTime endDate, @JsonKey(name: 'status')  TourInstanceStatus status, @JsonKey(name: 'availableSlots')  int availableSlots,  List<TourBooking>? bookings)  $default,) {final _that = this;
switch (_that) {
case _TourInstance():
return $default(_that.id,_that.startDate,_that.endDate,_that.status,_that.availableSlots,_that.bookings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'startDate')  DateTime startDate, @JsonKey(name: 'endDate')  DateTime endDate, @JsonKey(name: 'status')  TourInstanceStatus status, @JsonKey(name: 'availableSlots')  int availableSlots,  List<TourBooking>? bookings)?  $default,) {final _that = this;
switch (_that) {
case _TourInstance() when $default != null:
return $default(_that.id,_that.startDate,_that.endDate,_that.status,_that.availableSlots,_that.bookings);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TourInstance implements TourInstance {
  const _TourInstance({this.id, @JsonKey(name: 'startDate') required this.startDate, @JsonKey(name: 'endDate') required this.endDate, @JsonKey(name: 'status') required this.status, @JsonKey(name: 'availableSlots') this.availableSlots = 0, final  List<TourBooking>? bookings}): _bookings = bookings;
  factory _TourInstance.fromJson(Map<String, dynamic> json) => _$TourInstanceFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'startDate') final  DateTime startDate;
@override@JsonKey(name: 'endDate') final  DateTime endDate;
@override@JsonKey(name: 'status') final  TourInstanceStatus status;
@override@JsonKey(name: 'availableSlots') final  int availableSlots;
/// RELATIONS
 final  List<TourBooking>? _bookings;
/// RELATIONS
@override List<TourBooking>? get bookings {
  final value = _bookings;
  if (value == null) return null;
  if (_bookings is EqualUnmodifiableListView) return _bookings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of TourInstance
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TourInstanceCopyWith<_TourInstance> get copyWith => __$TourInstanceCopyWithImpl<_TourInstance>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TourInstanceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TourInstance&&(identical(other.id, id) || other.id == id)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.availableSlots, availableSlots) || other.availableSlots == availableSlots)&&const DeepCollectionEquality().equals(other._bookings, _bookings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,startDate,endDate,status,availableSlots,const DeepCollectionEquality().hash(_bookings));

@override
String toString() {
  return 'TourInstance(id: $id, startDate: $startDate, endDate: $endDate, status: $status, availableSlots: $availableSlots, bookings: $bookings)';
}


}

/// @nodoc
abstract mixin class _$TourInstanceCopyWith<$Res> implements $TourInstanceCopyWith<$Res> {
  factory _$TourInstanceCopyWith(_TourInstance value, $Res Function(_TourInstance) _then) = __$TourInstanceCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'startDate') DateTime startDate,@JsonKey(name: 'endDate') DateTime endDate,@JsonKey(name: 'status') TourInstanceStatus status,@JsonKey(name: 'availableSlots') int availableSlots, List<TourBooking>? bookings
});




}
/// @nodoc
class __$TourInstanceCopyWithImpl<$Res>
    implements _$TourInstanceCopyWith<$Res> {
  __$TourInstanceCopyWithImpl(this._self, this._then);

  final _TourInstance _self;
  final $Res Function(_TourInstance) _then;

/// Create a copy of TourInstance
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? startDate = null,Object? endDate = null,Object? status = null,Object? availableSlots = null,Object? bookings = freezed,}) {
  return _then(_TourInstance(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TourInstanceStatus,availableSlots: null == availableSlots ? _self.availableSlots : availableSlots // ignore: cast_nullable_to_non_nullable
as int,bookings: freezed == bookings ? _self._bookings : bookings // ignore: cast_nullable_to_non_nullable
as List<TourBooking>?,
  ));
}


}

// dart format on
