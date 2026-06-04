// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refund_policy_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RefundPolicyRuleResponse {

 String? get id; double? get timeBefore; String? get timeUnit; double? get refundPercentage;
/// Create a copy of RefundPolicyRuleResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefundPolicyRuleResponseCopyWith<RefundPolicyRuleResponse> get copyWith => _$RefundPolicyRuleResponseCopyWithImpl<RefundPolicyRuleResponse>(this as RefundPolicyRuleResponse, _$identity);

  /// Serializes this RefundPolicyRuleResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefundPolicyRuleResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.timeBefore, timeBefore) || other.timeBefore == timeBefore)&&(identical(other.timeUnit, timeUnit) || other.timeUnit == timeUnit)&&(identical(other.refundPercentage, refundPercentage) || other.refundPercentage == refundPercentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,timeBefore,timeUnit,refundPercentage);

@override
String toString() {
  return 'RefundPolicyRuleResponse(id: $id, timeBefore: $timeBefore, timeUnit: $timeUnit, refundPercentage: $refundPercentage)';
}


}

/// @nodoc
abstract mixin class $RefundPolicyRuleResponseCopyWith<$Res>  {
  factory $RefundPolicyRuleResponseCopyWith(RefundPolicyRuleResponse value, $Res Function(RefundPolicyRuleResponse) _then) = _$RefundPolicyRuleResponseCopyWithImpl;
@useResult
$Res call({
 String? id, double? timeBefore, String? timeUnit, double? refundPercentage
});




}
/// @nodoc
class _$RefundPolicyRuleResponseCopyWithImpl<$Res>
    implements $RefundPolicyRuleResponseCopyWith<$Res> {
  _$RefundPolicyRuleResponseCopyWithImpl(this._self, this._then);

  final RefundPolicyRuleResponse _self;
  final $Res Function(RefundPolicyRuleResponse) _then;

/// Create a copy of RefundPolicyRuleResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? timeBefore = freezed,Object? timeUnit = freezed,Object? refundPercentage = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,timeBefore: freezed == timeBefore ? _self.timeBefore : timeBefore // ignore: cast_nullable_to_non_nullable
as double?,timeUnit: freezed == timeUnit ? _self.timeUnit : timeUnit // ignore: cast_nullable_to_non_nullable
as String?,refundPercentage: freezed == refundPercentage ? _self.refundPercentage : refundPercentage // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [RefundPolicyRuleResponse].
extension RefundPolicyRuleResponsePatterns on RefundPolicyRuleResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RefundPolicyRuleResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RefundPolicyRuleResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RefundPolicyRuleResponse value)  $default,){
final _that = this;
switch (_that) {
case _RefundPolicyRuleResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RefundPolicyRuleResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RefundPolicyRuleResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  double? timeBefore,  String? timeUnit,  double? refundPercentage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RefundPolicyRuleResponse() when $default != null:
return $default(_that.id,_that.timeBefore,_that.timeUnit,_that.refundPercentage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  double? timeBefore,  String? timeUnit,  double? refundPercentage)  $default,) {final _that = this;
switch (_that) {
case _RefundPolicyRuleResponse():
return $default(_that.id,_that.timeBefore,_that.timeUnit,_that.refundPercentage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  double? timeBefore,  String? timeUnit,  double? refundPercentage)?  $default,) {final _that = this;
switch (_that) {
case _RefundPolicyRuleResponse() when $default != null:
return $default(_that.id,_that.timeBefore,_that.timeUnit,_that.refundPercentage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RefundPolicyRuleResponse implements RefundPolicyRuleResponse {
  const _RefundPolicyRuleResponse({this.id, this.timeBefore, this.timeUnit, this.refundPercentage});
  factory _RefundPolicyRuleResponse.fromJson(Map<String, dynamic> json) => _$RefundPolicyRuleResponseFromJson(json);

@override final  String? id;
@override final  double? timeBefore;
@override final  String? timeUnit;
@override final  double? refundPercentage;

/// Create a copy of RefundPolicyRuleResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefundPolicyRuleResponseCopyWith<_RefundPolicyRuleResponse> get copyWith => __$RefundPolicyRuleResponseCopyWithImpl<_RefundPolicyRuleResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RefundPolicyRuleResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefundPolicyRuleResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.timeBefore, timeBefore) || other.timeBefore == timeBefore)&&(identical(other.timeUnit, timeUnit) || other.timeUnit == timeUnit)&&(identical(other.refundPercentage, refundPercentage) || other.refundPercentage == refundPercentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,timeBefore,timeUnit,refundPercentage);

@override
String toString() {
  return 'RefundPolicyRuleResponse(id: $id, timeBefore: $timeBefore, timeUnit: $timeUnit, refundPercentage: $refundPercentage)';
}


}

/// @nodoc
abstract mixin class _$RefundPolicyRuleResponseCopyWith<$Res> implements $RefundPolicyRuleResponseCopyWith<$Res> {
  factory _$RefundPolicyRuleResponseCopyWith(_RefundPolicyRuleResponse value, $Res Function(_RefundPolicyRuleResponse) _then) = __$RefundPolicyRuleResponseCopyWithImpl;
@override @useResult
$Res call({
 String? id, double? timeBefore, String? timeUnit, double? refundPercentage
});




}
/// @nodoc
class __$RefundPolicyRuleResponseCopyWithImpl<$Res>
    implements _$RefundPolicyRuleResponseCopyWith<$Res> {
  __$RefundPolicyRuleResponseCopyWithImpl(this._self, this._then);

  final _RefundPolicyRuleResponse _self;
  final $Res Function(_RefundPolicyRuleResponse) _then;

/// Create a copy of RefundPolicyRuleResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? timeBefore = freezed,Object? timeUnit = freezed,Object? refundPercentage = freezed,}) {
  return _then(_RefundPolicyRuleResponse(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,timeBefore: freezed == timeBefore ? _self.timeBefore : timeBefore // ignore: cast_nullable_to_non_nullable
as double?,timeUnit: freezed == timeUnit ? _self.timeUnit : timeUnit // ignore: cast_nullable_to_non_nullable
as String?,refundPercentage: freezed == refundPercentage ? _self.refundPercentage : refundPercentage // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$RefundPolicyResponse {

 String? get id; String? get name; String? get serviceType; List<RefundPolicyRuleResponse> get rules;
/// Create a copy of RefundPolicyResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefundPolicyResponseCopyWith<RefundPolicyResponse> get copyWith => _$RefundPolicyResponseCopyWithImpl<RefundPolicyResponse>(this as RefundPolicyResponse, _$identity);

  /// Serializes this RefundPolicyResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefundPolicyResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.serviceType, serviceType) || other.serviceType == serviceType)&&const DeepCollectionEquality().equals(other.rules, rules));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,serviceType,const DeepCollectionEquality().hash(rules));

@override
String toString() {
  return 'RefundPolicyResponse(id: $id, name: $name, serviceType: $serviceType, rules: $rules)';
}


}

/// @nodoc
abstract mixin class $RefundPolicyResponseCopyWith<$Res>  {
  factory $RefundPolicyResponseCopyWith(RefundPolicyResponse value, $Res Function(RefundPolicyResponse) _then) = _$RefundPolicyResponseCopyWithImpl;
@useResult
$Res call({
 String? id, String? name, String? serviceType, List<RefundPolicyRuleResponse> rules
});




}
/// @nodoc
class _$RefundPolicyResponseCopyWithImpl<$Res>
    implements $RefundPolicyResponseCopyWith<$Res> {
  _$RefundPolicyResponseCopyWithImpl(this._self, this._then);

  final RefundPolicyResponse _self;
  final $Res Function(RefundPolicyResponse) _then;

/// Create a copy of RefundPolicyResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? serviceType = freezed,Object? rules = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,serviceType: freezed == serviceType ? _self.serviceType : serviceType // ignore: cast_nullable_to_non_nullable
as String?,rules: null == rules ? _self.rules : rules // ignore: cast_nullable_to_non_nullable
as List<RefundPolicyRuleResponse>,
  ));
}

}


/// Adds pattern-matching-related methods to [RefundPolicyResponse].
extension RefundPolicyResponsePatterns on RefundPolicyResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RefundPolicyResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RefundPolicyResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RefundPolicyResponse value)  $default,){
final _that = this;
switch (_that) {
case _RefundPolicyResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RefundPolicyResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RefundPolicyResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? name,  String? serviceType,  List<RefundPolicyRuleResponse> rules)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RefundPolicyResponse() when $default != null:
return $default(_that.id,_that.name,_that.serviceType,_that.rules);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? name,  String? serviceType,  List<RefundPolicyRuleResponse> rules)  $default,) {final _that = this;
switch (_that) {
case _RefundPolicyResponse():
return $default(_that.id,_that.name,_that.serviceType,_that.rules);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? name,  String? serviceType,  List<RefundPolicyRuleResponse> rules)?  $default,) {final _that = this;
switch (_that) {
case _RefundPolicyResponse() when $default != null:
return $default(_that.id,_that.name,_that.serviceType,_that.rules);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RefundPolicyResponse implements RefundPolicyResponse {
  const _RefundPolicyResponse({this.id, this.name, this.serviceType, final  List<RefundPolicyRuleResponse> rules = const []}): _rules = rules;
  factory _RefundPolicyResponse.fromJson(Map<String, dynamic> json) => _$RefundPolicyResponseFromJson(json);

@override final  String? id;
@override final  String? name;
@override final  String? serviceType;
 final  List<RefundPolicyRuleResponse> _rules;
@override@JsonKey() List<RefundPolicyRuleResponse> get rules {
  if (_rules is EqualUnmodifiableListView) return _rules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rules);
}


/// Create a copy of RefundPolicyResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefundPolicyResponseCopyWith<_RefundPolicyResponse> get copyWith => __$RefundPolicyResponseCopyWithImpl<_RefundPolicyResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RefundPolicyResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefundPolicyResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.serviceType, serviceType) || other.serviceType == serviceType)&&const DeepCollectionEquality().equals(other._rules, _rules));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,serviceType,const DeepCollectionEquality().hash(_rules));

@override
String toString() {
  return 'RefundPolicyResponse(id: $id, name: $name, serviceType: $serviceType, rules: $rules)';
}


}

/// @nodoc
abstract mixin class _$RefundPolicyResponseCopyWith<$Res> implements $RefundPolicyResponseCopyWith<$Res> {
  factory _$RefundPolicyResponseCopyWith(_RefundPolicyResponse value, $Res Function(_RefundPolicyResponse) _then) = __$RefundPolicyResponseCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? name, String? serviceType, List<RefundPolicyRuleResponse> rules
});




}
/// @nodoc
class __$RefundPolicyResponseCopyWithImpl<$Res>
    implements _$RefundPolicyResponseCopyWith<$Res> {
  __$RefundPolicyResponseCopyWithImpl(this._self, this._then);

  final _RefundPolicyResponse _self;
  final $Res Function(_RefundPolicyResponse) _then;

/// Create a copy of RefundPolicyResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? serviceType = freezed,Object? rules = null,}) {
  return _then(_RefundPolicyResponse(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,serviceType: freezed == serviceType ? _self.serviceType : serviceType // ignore: cast_nullable_to_non_nullable
as String?,rules: null == rules ? _self._rules : rules // ignore: cast_nullable_to_non_nullable
as List<RefundPolicyRuleResponse>,
  ));
}


}

// dart format on
