// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refund_policy_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RefundPolicyRuleResponse _$RefundPolicyRuleResponseFromJson(
  Map<String, dynamic> json,
) {
  return _RefundPolicyRuleResponse.fromJson(json);
}

/// @nodoc
mixin _$RefundPolicyRuleResponse {
  String? get id => throw _privateConstructorUsedError;
  double? get timeBefore => throw _privateConstructorUsedError;
  String? get timeUnit => throw _privateConstructorUsedError;
  double? get refundPercentage => throw _privateConstructorUsedError;

  /// Serializes this RefundPolicyRuleResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RefundPolicyRuleResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RefundPolicyRuleResponseCopyWith<RefundPolicyRuleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefundPolicyRuleResponseCopyWith<$Res> {
  factory $RefundPolicyRuleResponseCopyWith(
    RefundPolicyRuleResponse value,
    $Res Function(RefundPolicyRuleResponse) then,
  ) = _$RefundPolicyRuleResponseCopyWithImpl<$Res, RefundPolicyRuleResponse>;
  @useResult
  $Res call({
    String? id,
    double? timeBefore,
    String? timeUnit,
    double? refundPercentage,
  });
}

/// @nodoc
class _$RefundPolicyRuleResponseCopyWithImpl<
  $Res,
  $Val extends RefundPolicyRuleResponse
>
    implements $RefundPolicyRuleResponseCopyWith<$Res> {
  _$RefundPolicyRuleResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefundPolicyRuleResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? timeBefore = freezed,
    Object? timeUnit = freezed,
    Object? refundPercentage = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            timeBefore: freezed == timeBefore
                ? _value.timeBefore
                : timeBefore // ignore: cast_nullable_to_non_nullable
                      as double?,
            timeUnit: freezed == timeUnit
                ? _value.timeUnit
                : timeUnit // ignore: cast_nullable_to_non_nullable
                      as String?,
            refundPercentage: freezed == refundPercentage
                ? _value.refundPercentage
                : refundPercentage // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RefundPolicyRuleResponseImplCopyWith<$Res>
    implements $RefundPolicyRuleResponseCopyWith<$Res> {
  factory _$$RefundPolicyRuleResponseImplCopyWith(
    _$RefundPolicyRuleResponseImpl value,
    $Res Function(_$RefundPolicyRuleResponseImpl) then,
  ) = __$$RefundPolicyRuleResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    double? timeBefore,
    String? timeUnit,
    double? refundPercentage,
  });
}

/// @nodoc
class __$$RefundPolicyRuleResponseImplCopyWithImpl<$Res>
    extends
        _$RefundPolicyRuleResponseCopyWithImpl<
          $Res,
          _$RefundPolicyRuleResponseImpl
        >
    implements _$$RefundPolicyRuleResponseImplCopyWith<$Res> {
  __$$RefundPolicyRuleResponseImplCopyWithImpl(
    _$RefundPolicyRuleResponseImpl _value,
    $Res Function(_$RefundPolicyRuleResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RefundPolicyRuleResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? timeBefore = freezed,
    Object? timeUnit = freezed,
    Object? refundPercentage = freezed,
  }) {
    return _then(
      _$RefundPolicyRuleResponseImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        timeBefore: freezed == timeBefore
            ? _value.timeBefore
            : timeBefore // ignore: cast_nullable_to_non_nullable
                  as double?,
        timeUnit: freezed == timeUnit
            ? _value.timeUnit
            : timeUnit // ignore: cast_nullable_to_non_nullable
                  as String?,
        refundPercentage: freezed == refundPercentage
            ? _value.refundPercentage
            : refundPercentage // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RefundPolicyRuleResponseImpl implements _RefundPolicyRuleResponse {
  const _$RefundPolicyRuleResponseImpl({
    this.id,
    this.timeBefore,
    this.timeUnit,
    this.refundPercentage,
  });

  factory _$RefundPolicyRuleResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefundPolicyRuleResponseImplFromJson(json);

  @override
  final String? id;
  @override
  final double? timeBefore;
  @override
  final String? timeUnit;
  @override
  final double? refundPercentage;

  @override
  String toString() {
    return 'RefundPolicyRuleResponse(id: $id, timeBefore: $timeBefore, timeUnit: $timeUnit, refundPercentage: $refundPercentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefundPolicyRuleResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
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
      Object.hash(runtimeType, id, timeBefore, timeUnit, refundPercentage);

  /// Create a copy of RefundPolicyRuleResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefundPolicyRuleResponseImplCopyWith<_$RefundPolicyRuleResponseImpl>
  get copyWith =>
      __$$RefundPolicyRuleResponseImplCopyWithImpl<
        _$RefundPolicyRuleResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RefundPolicyRuleResponseImplToJson(this);
  }
}

abstract class _RefundPolicyRuleResponse implements RefundPolicyRuleResponse {
  const factory _RefundPolicyRuleResponse({
    final String? id,
    final double? timeBefore,
    final String? timeUnit,
    final double? refundPercentage,
  }) = _$RefundPolicyRuleResponseImpl;

  factory _RefundPolicyRuleResponse.fromJson(Map<String, dynamic> json) =
      _$RefundPolicyRuleResponseImpl.fromJson;

  @override
  String? get id;
  @override
  double? get timeBefore;
  @override
  String? get timeUnit;
  @override
  double? get refundPercentage;

  /// Create a copy of RefundPolicyRuleResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefundPolicyRuleResponseImplCopyWith<_$RefundPolicyRuleResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

RefundPolicyResponse _$RefundPolicyResponseFromJson(Map<String, dynamic> json) {
  return _RefundPolicyResponse.fromJson(json);
}

/// @nodoc
mixin _$RefundPolicyResponse {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get serviceType => throw _privateConstructorUsedError;
  List<RefundPolicyRuleResponse> get rules =>
      throw _privateConstructorUsedError;

  /// Serializes this RefundPolicyResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RefundPolicyResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RefundPolicyResponseCopyWith<RefundPolicyResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefundPolicyResponseCopyWith<$Res> {
  factory $RefundPolicyResponseCopyWith(
    RefundPolicyResponse value,
    $Res Function(RefundPolicyResponse) then,
  ) = _$RefundPolicyResponseCopyWithImpl<$Res, RefundPolicyResponse>;
  @useResult
  $Res call({
    String? id,
    String? name,
    String? serviceType,
    List<RefundPolicyRuleResponse> rules,
  });
}

/// @nodoc
class _$RefundPolicyResponseCopyWithImpl<
  $Res,
  $Val extends RefundPolicyResponse
>
    implements $RefundPolicyResponseCopyWith<$Res> {
  _$RefundPolicyResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefundPolicyResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? serviceType = freezed,
    Object? rules = null,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            serviceType: freezed == serviceType
                ? _value.serviceType
                : serviceType // ignore: cast_nullable_to_non_nullable
                      as String?,
            rules: null == rules
                ? _value.rules
                : rules // ignore: cast_nullable_to_non_nullable
                      as List<RefundPolicyRuleResponse>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RefundPolicyResponseImplCopyWith<$Res>
    implements $RefundPolicyResponseCopyWith<$Res> {
  factory _$$RefundPolicyResponseImplCopyWith(
    _$RefundPolicyResponseImpl value,
    $Res Function(_$RefundPolicyResponseImpl) then,
  ) = __$$RefundPolicyResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    String? name,
    String? serviceType,
    List<RefundPolicyRuleResponse> rules,
  });
}

/// @nodoc
class __$$RefundPolicyResponseImplCopyWithImpl<$Res>
    extends _$RefundPolicyResponseCopyWithImpl<$Res, _$RefundPolicyResponseImpl>
    implements _$$RefundPolicyResponseImplCopyWith<$Res> {
  __$$RefundPolicyResponseImplCopyWithImpl(
    _$RefundPolicyResponseImpl _value,
    $Res Function(_$RefundPolicyResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RefundPolicyResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? serviceType = freezed,
    Object? rules = null,
  }) {
    return _then(
      _$RefundPolicyResponseImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        serviceType: freezed == serviceType
            ? _value.serviceType
            : serviceType // ignore: cast_nullable_to_non_nullable
                  as String?,
        rules: null == rules
            ? _value._rules
            : rules // ignore: cast_nullable_to_non_nullable
                  as List<RefundPolicyRuleResponse>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RefundPolicyResponseImpl implements _RefundPolicyResponse {
  const _$RefundPolicyResponseImpl({
    this.id,
    this.name,
    this.serviceType,
    final List<RefundPolicyRuleResponse> rules = const [],
  }) : _rules = rules;

  factory _$RefundPolicyResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefundPolicyResponseImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? serviceType;
  final List<RefundPolicyRuleResponse> _rules;
  @override
  @JsonKey()
  List<RefundPolicyRuleResponse> get rules {
    if (_rules is EqualUnmodifiableListView) return _rules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rules);
  }

  @override
  String toString() {
    return 'RefundPolicyResponse(id: $id, name: $name, serviceType: $serviceType, rules: $rules)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefundPolicyResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType) &&
            const DeepCollectionEquality().equals(other._rules, _rules));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    serviceType,
    const DeepCollectionEquality().hash(_rules),
  );

  /// Create a copy of RefundPolicyResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefundPolicyResponseImplCopyWith<_$RefundPolicyResponseImpl>
  get copyWith =>
      __$$RefundPolicyResponseImplCopyWithImpl<_$RefundPolicyResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RefundPolicyResponseImplToJson(this);
  }
}

abstract class _RefundPolicyResponse implements RefundPolicyResponse {
  const factory _RefundPolicyResponse({
    final String? id,
    final String? name,
    final String? serviceType,
    final List<RefundPolicyRuleResponse> rules,
  }) = _$RefundPolicyResponseImpl;

  factory _RefundPolicyResponse.fromJson(Map<String, dynamic> json) =
      _$RefundPolicyResponseImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get serviceType;
  @override
  List<RefundPolicyRuleResponse> get rules;

  /// Create a copy of RefundPolicyResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefundPolicyResponseImplCopyWith<_$RefundPolicyResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
