// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refund_policy_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RefundPolicyRuleRequest {

 double get timeBefore; String get timeUnit; double get refundPercentage;
/// Create a copy of RefundPolicyRuleRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefundPolicyRuleRequestCopyWith<RefundPolicyRuleRequest> get copyWith => _$RefundPolicyRuleRequestCopyWithImpl<RefundPolicyRuleRequest>(this as RefundPolicyRuleRequest, _$identity);

  /// Serializes this RefundPolicyRuleRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefundPolicyRuleRequest&&(identical(other.timeBefore, timeBefore) || other.timeBefore == timeBefore)&&(identical(other.timeUnit, timeUnit) || other.timeUnit == timeUnit)&&(identical(other.refundPercentage, refundPercentage) || other.refundPercentage == refundPercentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timeBefore,timeUnit,refundPercentage);

@override
String toString() {
  return 'RefundPolicyRuleRequest(timeBefore: $timeBefore, timeUnit: $timeUnit, refundPercentage: $refundPercentage)';
}


}

/// @nodoc
abstract mixin class $RefundPolicyRuleRequestCopyWith<$Res>  {
  factory $RefundPolicyRuleRequestCopyWith(RefundPolicyRuleRequest value, $Res Function(RefundPolicyRuleRequest) _then) = _$RefundPolicyRuleRequestCopyWithImpl;
@useResult
$Res call({
 double timeBefore, String timeUnit, double refundPercentage
});




}
/// @nodoc
class _$RefundPolicyRuleRequestCopyWithImpl<$Res>
    implements $RefundPolicyRuleRequestCopyWith<$Res> {
  _$RefundPolicyRuleRequestCopyWithImpl(this._self, this._then);

  final RefundPolicyRuleRequest _self;
  final $Res Function(RefundPolicyRuleRequest) _then;

/// Create a copy of RefundPolicyRuleRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timeBefore = null,Object? timeUnit = null,Object? refundPercentage = null,}) {
  return _then(_self.copyWith(
timeBefore: null == timeBefore ? _self.timeBefore : timeBefore // ignore: cast_nullable_to_non_nullable
as double,timeUnit: null == timeUnit ? _self.timeUnit : timeUnit // ignore: cast_nullable_to_non_nullable
as String,refundPercentage: null == refundPercentage ? _self.refundPercentage : refundPercentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [RefundPolicyRuleRequest].
extension RefundPolicyRuleRequestPatterns on RefundPolicyRuleRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RefundPolicyRuleRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RefundPolicyRuleRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RefundPolicyRuleRequest value)  $default,){
final _that = this;
switch (_that) {
case _RefundPolicyRuleRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RefundPolicyRuleRequest value)?  $default,){
final _that = this;
switch (_that) {
case _RefundPolicyRuleRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double timeBefore,  String timeUnit,  double refundPercentage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RefundPolicyRuleRequest() when $default != null:
return $default(_that.timeBefore,_that.timeUnit,_that.refundPercentage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double timeBefore,  String timeUnit,  double refundPercentage)  $default,) {final _that = this;
switch (_that) {
case _RefundPolicyRuleRequest():
return $default(_that.timeBefore,_that.timeUnit,_that.refundPercentage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double timeBefore,  String timeUnit,  double refundPercentage)?  $default,) {final _that = this;
switch (_that) {
case _RefundPolicyRuleRequest() when $default != null:
return $default(_that.timeBefore,_that.timeUnit,_that.refundPercentage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RefundPolicyRuleRequest implements RefundPolicyRuleRequest {
  const _RefundPolicyRuleRequest({required this.timeBefore, required this.timeUnit, required this.refundPercentage});
  factory _RefundPolicyRuleRequest.fromJson(Map<String, dynamic> json) => _$RefundPolicyRuleRequestFromJson(json);

@override final  double timeBefore;
@override final  String timeUnit;
@override final  double refundPercentage;

/// Create a copy of RefundPolicyRuleRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefundPolicyRuleRequestCopyWith<_RefundPolicyRuleRequest> get copyWith => __$RefundPolicyRuleRequestCopyWithImpl<_RefundPolicyRuleRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RefundPolicyRuleRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefundPolicyRuleRequest&&(identical(other.timeBefore, timeBefore) || other.timeBefore == timeBefore)&&(identical(other.timeUnit, timeUnit) || other.timeUnit == timeUnit)&&(identical(other.refundPercentage, refundPercentage) || other.refundPercentage == refundPercentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timeBefore,timeUnit,refundPercentage);

@override
String toString() {
  return 'RefundPolicyRuleRequest(timeBefore: $timeBefore, timeUnit: $timeUnit, refundPercentage: $refundPercentage)';
}


}

/// @nodoc
abstract mixin class _$RefundPolicyRuleRequestCopyWith<$Res> implements $RefundPolicyRuleRequestCopyWith<$Res> {
  factory _$RefundPolicyRuleRequestCopyWith(_RefundPolicyRuleRequest value, $Res Function(_RefundPolicyRuleRequest) _then) = __$RefundPolicyRuleRequestCopyWithImpl;
@override @useResult
$Res call({
 double timeBefore, String timeUnit, double refundPercentage
});




}
/// @nodoc
class __$RefundPolicyRuleRequestCopyWithImpl<$Res>
    implements _$RefundPolicyRuleRequestCopyWith<$Res> {
  __$RefundPolicyRuleRequestCopyWithImpl(this._self, this._then);

  final _RefundPolicyRuleRequest _self;
  final $Res Function(_RefundPolicyRuleRequest) _then;

/// Create a copy of RefundPolicyRuleRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timeBefore = null,Object? timeUnit = null,Object? refundPercentage = null,}) {
  return _then(_RefundPolicyRuleRequest(
timeBefore: null == timeBefore ? _self.timeBefore : timeBefore // ignore: cast_nullable_to_non_nullable
as double,timeUnit: null == timeUnit ? _self.timeUnit : timeUnit // ignore: cast_nullable_to_non_nullable
as String,refundPercentage: null == refundPercentage ? _self.refundPercentage : refundPercentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$RefundPolicyRequest {

 String get name; String get serviceType; List<RefundPolicyRuleRequest> get rules;
/// Create a copy of RefundPolicyRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefundPolicyRequestCopyWith<RefundPolicyRequest> get copyWith => _$RefundPolicyRequestCopyWithImpl<RefundPolicyRequest>(this as RefundPolicyRequest, _$identity);

  /// Serializes this RefundPolicyRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefundPolicyRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.serviceType, serviceType) || other.serviceType == serviceType)&&const DeepCollectionEquality().equals(other.rules, rules));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,serviceType,const DeepCollectionEquality().hash(rules));

@override
String toString() {
  return 'RefundPolicyRequest(name: $name, serviceType: $serviceType, rules: $rules)';
}


}

/// @nodoc
abstract mixin class $RefundPolicyRequestCopyWith<$Res>  {
  factory $RefundPolicyRequestCopyWith(RefundPolicyRequest value, $Res Function(RefundPolicyRequest) _then) = _$RefundPolicyRequestCopyWithImpl;
@useResult
$Res call({
 String name, String serviceType, List<RefundPolicyRuleRequest> rules
});




}
/// @nodoc
class _$RefundPolicyRequestCopyWithImpl<$Res>
    implements $RefundPolicyRequestCopyWith<$Res> {
  _$RefundPolicyRequestCopyWithImpl(this._self, this._then);

  final RefundPolicyRequest _self;
  final $Res Function(RefundPolicyRequest) _then;

/// Create a copy of RefundPolicyRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? serviceType = null,Object? rules = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,serviceType: null == serviceType ? _self.serviceType : serviceType // ignore: cast_nullable_to_non_nullable
as String,rules: null == rules ? _self.rules : rules // ignore: cast_nullable_to_non_nullable
as List<RefundPolicyRuleRequest>,
  ));
}

}


/// Adds pattern-matching-related methods to [RefundPolicyRequest].
extension RefundPolicyRequestPatterns on RefundPolicyRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RefundPolicyRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RefundPolicyRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RefundPolicyRequest value)  $default,){
final _that = this;
switch (_that) {
case _RefundPolicyRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RefundPolicyRequest value)?  $default,){
final _that = this;
switch (_that) {
case _RefundPolicyRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String serviceType,  List<RefundPolicyRuleRequest> rules)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RefundPolicyRequest() when $default != null:
return $default(_that.name,_that.serviceType,_that.rules);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String serviceType,  List<RefundPolicyRuleRequest> rules)  $default,) {final _that = this;
switch (_that) {
case _RefundPolicyRequest():
return $default(_that.name,_that.serviceType,_that.rules);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String serviceType,  List<RefundPolicyRuleRequest> rules)?  $default,) {final _that = this;
switch (_that) {
case _RefundPolicyRequest() when $default != null:
return $default(_that.name,_that.serviceType,_that.rules);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RefundPolicyRequest implements RefundPolicyRequest {
  const _RefundPolicyRequest({required this.name, required this.serviceType, required final  List<RefundPolicyRuleRequest> rules}): _rules = rules;
  factory _RefundPolicyRequest.fromJson(Map<String, dynamic> json) => _$RefundPolicyRequestFromJson(json);

@override final  String name;
@override final  String serviceType;
 final  List<RefundPolicyRuleRequest> _rules;
@override List<RefundPolicyRuleRequest> get rules {
  if (_rules is EqualUnmodifiableListView) return _rules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rules);
}


/// Create a copy of RefundPolicyRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefundPolicyRequestCopyWith<_RefundPolicyRequest> get copyWith => __$RefundPolicyRequestCopyWithImpl<_RefundPolicyRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RefundPolicyRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefundPolicyRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.serviceType, serviceType) || other.serviceType == serviceType)&&const DeepCollectionEquality().equals(other._rules, _rules));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,serviceType,const DeepCollectionEquality().hash(_rules));

@override
String toString() {
  return 'RefundPolicyRequest(name: $name, serviceType: $serviceType, rules: $rules)';
}


}

/// @nodoc
abstract mixin class _$RefundPolicyRequestCopyWith<$Res> implements $RefundPolicyRequestCopyWith<$Res> {
  factory _$RefundPolicyRequestCopyWith(_RefundPolicyRequest value, $Res Function(_RefundPolicyRequest) _then) = __$RefundPolicyRequestCopyWithImpl;
@override @useResult
$Res call({
 String name, String serviceType, List<RefundPolicyRuleRequest> rules
});




}
/// @nodoc
class __$RefundPolicyRequestCopyWithImpl<$Res>
    implements _$RefundPolicyRequestCopyWith<$Res> {
  __$RefundPolicyRequestCopyWithImpl(this._self, this._then);

  final _RefundPolicyRequest _self;
  final $Res Function(_RefundPolicyRequest) _then;

/// Create a copy of RefundPolicyRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? serviceType = null,Object? rules = null,}) {
  return _then(_RefundPolicyRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,serviceType: null == serviceType ? _self.serviceType : serviceType // ignore: cast_nullable_to_non_nullable
as String,rules: null == rules ? _self._rules : rules // ignore: cast_nullable_to_non_nullable
as List<RefundPolicyRuleRequest>,
  ));
}


}

// dart format on
