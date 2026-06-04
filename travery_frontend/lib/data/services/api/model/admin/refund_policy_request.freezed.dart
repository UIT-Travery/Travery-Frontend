// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refund_policy_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RefundPolicyRuleRequest _$RefundPolicyRuleRequestFromJson(
  Map<String, dynamic> json,
) {
  return _RefundPolicyRuleRequest.fromJson(json);
}

/// @nodoc
mixin _$RefundPolicyRuleRequest {
  double get timeBefore => throw _privateConstructorUsedError;
  String get timeUnit => throw _privateConstructorUsedError;
  double get refundPercentage => throw _privateConstructorUsedError;

  /// Serializes this RefundPolicyRuleRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RefundPolicyRuleRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RefundPolicyRuleRequestCopyWith<RefundPolicyRuleRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefundPolicyRuleRequestCopyWith<$Res> {
  factory $RefundPolicyRuleRequestCopyWith(
    RefundPolicyRuleRequest value,
    $Res Function(RefundPolicyRuleRequest) then,
  ) = _$RefundPolicyRuleRequestCopyWithImpl<$Res, RefundPolicyRuleRequest>;
  @useResult
  $Res call({double timeBefore, String timeUnit, double refundPercentage});
}

/// @nodoc
class _$RefundPolicyRuleRequestCopyWithImpl<
  $Res,
  $Val extends RefundPolicyRuleRequest
>
    implements $RefundPolicyRuleRequestCopyWith<$Res> {
  _$RefundPolicyRuleRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefundPolicyRuleRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeBefore = null,
    Object? timeUnit = null,
    Object? refundPercentage = null,
  }) {
    return _then(
      _value.copyWith(
            timeBefore: null == timeBefore
                ? _value.timeBefore
                : timeBefore // ignore: cast_nullable_to_non_nullable
                      as double,
            timeUnit: null == timeUnit
                ? _value.timeUnit
                : timeUnit // ignore: cast_nullable_to_non_nullable
                      as String,
            refundPercentage: null == refundPercentage
                ? _value.refundPercentage
                : refundPercentage // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RefundPolicyRuleRequestImplCopyWith<$Res>
    implements $RefundPolicyRuleRequestCopyWith<$Res> {
  factory _$$RefundPolicyRuleRequestImplCopyWith(
    _$RefundPolicyRuleRequestImpl value,
    $Res Function(_$RefundPolicyRuleRequestImpl) then,
  ) = __$$RefundPolicyRuleRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double timeBefore, String timeUnit, double refundPercentage});
}

/// @nodoc
class __$$RefundPolicyRuleRequestImplCopyWithImpl<$Res>
    extends
        _$RefundPolicyRuleRequestCopyWithImpl<
          $Res,
          _$RefundPolicyRuleRequestImpl
        >
    implements _$$RefundPolicyRuleRequestImplCopyWith<$Res> {
  __$$RefundPolicyRuleRequestImplCopyWithImpl(
    _$RefundPolicyRuleRequestImpl _value,
    $Res Function(_$RefundPolicyRuleRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RefundPolicyRuleRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeBefore = null,
    Object? timeUnit = null,
    Object? refundPercentage = null,
  }) {
    return _then(
      _$RefundPolicyRuleRequestImpl(
        timeBefore: null == timeBefore
            ? _value.timeBefore
            : timeBefore // ignore: cast_nullable_to_non_nullable
                  as double,
        timeUnit: null == timeUnit
            ? _value.timeUnit
            : timeUnit // ignore: cast_nullable_to_non_nullable
                  as String,
        refundPercentage: null == refundPercentage
            ? _value.refundPercentage
            : refundPercentage // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RefundPolicyRuleRequestImpl implements _RefundPolicyRuleRequest {
  const _$RefundPolicyRuleRequestImpl({
    required this.timeBefore,
    required this.timeUnit,
    required this.refundPercentage,
  });

  factory _$RefundPolicyRuleRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefundPolicyRuleRequestImplFromJson(json);

  @override
  final double timeBefore;
  @override
  final String timeUnit;
  @override
  final double refundPercentage;

  @override
  String toString() {
    return 'RefundPolicyRuleRequest(timeBefore: $timeBefore, timeUnit: $timeUnit, refundPercentage: $refundPercentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefundPolicyRuleRequestImpl &&
            (identical(other.timeBefore, timeBefore) ||
                other.timeBefore == timeBefore) &&
            (identical(other.timeUnit, timeUnit) ||
                other.timeUnit == timeUnit) &&
            (identical(other.refundPercentage, refundPercentage) ||
                other.refundPercentage == refundPercentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, timeBefore, timeUnit, refundPercentage);

  /// Create a copy of RefundPolicyRuleRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefundPolicyRuleRequestImplCopyWith<_$RefundPolicyRuleRequestImpl>
  get copyWith =>
      __$$RefundPolicyRuleRequestImplCopyWithImpl<
        _$RefundPolicyRuleRequestImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RefundPolicyRuleRequestImplToJson(this);
  }
}

abstract class _RefundPolicyRuleRequest implements RefundPolicyRuleRequest {
  const factory _RefundPolicyRuleRequest({
    required final double timeBefore,
    required final String timeUnit,
    required final double refundPercentage,
  }) = _$RefundPolicyRuleRequestImpl;

  factory _RefundPolicyRuleRequest.fromJson(Map<String, dynamic> json) =
      _$RefundPolicyRuleRequestImpl.fromJson;

  @override
  double get timeBefore;
  @override
  String get timeUnit;
  @override
  double get refundPercentage;

  /// Create a copy of RefundPolicyRuleRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefundPolicyRuleRequestImplCopyWith<_$RefundPolicyRuleRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

RefundPolicyRequest _$RefundPolicyRequestFromJson(Map<String, dynamic> json) {
  return _RefundPolicyRequest.fromJson(json);
}

/// @nodoc
mixin _$RefundPolicyRequest {
  String get name => throw _privateConstructorUsedError;
  String get serviceType => throw _privateConstructorUsedError;
  List<RefundPolicyRuleRequest> get rules => throw _privateConstructorUsedError;

  /// Serializes this RefundPolicyRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RefundPolicyRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RefundPolicyRequestCopyWith<RefundPolicyRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefundPolicyRequestCopyWith<$Res> {
  factory $RefundPolicyRequestCopyWith(
    RefundPolicyRequest value,
    $Res Function(RefundPolicyRequest) then,
  ) = _$RefundPolicyRequestCopyWithImpl<$Res, RefundPolicyRequest>;
  @useResult
  $Res call({
    String name,
    String serviceType,
    List<RefundPolicyRuleRequest> rules,
  });
}

/// @nodoc
class _$RefundPolicyRequestCopyWithImpl<$Res, $Val extends RefundPolicyRequest>
    implements $RefundPolicyRequestCopyWith<$Res> {
  _$RefundPolicyRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefundPolicyRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? serviceType = null,
    Object? rules = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            serviceType: null == serviceType
                ? _value.serviceType
                : serviceType // ignore: cast_nullable_to_non_nullable
                      as String,
            rules: null == rules
                ? _value.rules
                : rules // ignore: cast_nullable_to_non_nullable
                      as List<RefundPolicyRuleRequest>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RefundPolicyRequestImplCopyWith<$Res>
    implements $RefundPolicyRequestCopyWith<$Res> {
  factory _$$RefundPolicyRequestImplCopyWith(
    _$RefundPolicyRequestImpl value,
    $Res Function(_$RefundPolicyRequestImpl) then,
  ) = __$$RefundPolicyRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    String serviceType,
    List<RefundPolicyRuleRequest> rules,
  });
}

/// @nodoc
class __$$RefundPolicyRequestImplCopyWithImpl<$Res>
    extends _$RefundPolicyRequestCopyWithImpl<$Res, _$RefundPolicyRequestImpl>
    implements _$$RefundPolicyRequestImplCopyWith<$Res> {
  __$$RefundPolicyRequestImplCopyWithImpl(
    _$RefundPolicyRequestImpl _value,
    $Res Function(_$RefundPolicyRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RefundPolicyRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? serviceType = null,
    Object? rules = null,
  }) {
    return _then(
      _$RefundPolicyRequestImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        serviceType: null == serviceType
            ? _value.serviceType
            : serviceType // ignore: cast_nullable_to_non_nullable
                  as String,
        rules: null == rules
            ? _value._rules
            : rules // ignore: cast_nullable_to_non_nullable
                  as List<RefundPolicyRuleRequest>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RefundPolicyRequestImpl implements _RefundPolicyRequest {
  const _$RefundPolicyRequestImpl({
    required this.name,
    required this.serviceType,
    required final List<RefundPolicyRuleRequest> rules,
  }) : _rules = rules;

  factory _$RefundPolicyRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefundPolicyRequestImplFromJson(json);

  @override
  final String name;
  @override
  final String serviceType;
  final List<RefundPolicyRuleRequest> _rules;
  @override
  List<RefundPolicyRuleRequest> get rules {
    if (_rules is EqualUnmodifiableListView) return _rules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rules);
  }

  @override
  String toString() {
    return 'RefundPolicyRequest(name: $name, serviceType: $serviceType, rules: $rules)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefundPolicyRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType) &&
            const DeepCollectionEquality().equals(other._rules, _rules));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    serviceType,
    const DeepCollectionEquality().hash(_rules),
  );

  /// Create a copy of RefundPolicyRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefundPolicyRequestImplCopyWith<_$RefundPolicyRequestImpl> get copyWith =>
      __$$RefundPolicyRequestImplCopyWithImpl<_$RefundPolicyRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RefundPolicyRequestImplToJson(this);
  }
}

abstract class _RefundPolicyRequest implements RefundPolicyRequest {
  const factory _RefundPolicyRequest({
    required final String name,
    required final String serviceType,
    required final List<RefundPolicyRuleRequest> rules,
  }) = _$RefundPolicyRequestImpl;

  factory _RefundPolicyRequest.fromJson(Map<String, dynamic> json) =
      _$RefundPolicyRequestImpl.fromJson;

  @override
  String get name;
  @override
  String get serviceType;
  @override
  List<RefundPolicyRuleRequest> get rules;

  /// Create a copy of RefundPolicyRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefundPolicyRequestImplCopyWith<_$RefundPolicyRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
