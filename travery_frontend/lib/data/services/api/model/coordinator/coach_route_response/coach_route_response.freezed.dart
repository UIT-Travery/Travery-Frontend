// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coach_route_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CoachRouteResponse _$CoachRouteResponseFromJson(Map<String, dynamic> json) {
  return _CoachRouteResponse.fromJson(json);
}

/// @nodoc
mixin _$CoachRouteResponse {
  String get id => throw _privateConstructorUsedError;
  String get originDestinationId => throw _privateConstructorUsedError;
  String get originDestinationName => throw _privateConstructorUsedError;
  String get destinationDestinationId => throw _privateConstructorUsedError;
  String get destinationDestinationName => throw _privateConstructorUsedError;
  double get distanceKm => throw _privateConstructorUsedError;
  double get estimatedHours => throw _privateConstructorUsedError;
  double get basePrice => throw _privateConstructorUsedError;
  String? get refundPolicyId => throw _privateConstructorUsedError;
  String? get refundPolicyName => throw _privateConstructorUsedError;
  double get averageRating => throw _privateConstructorUsedError;
  int get reviewCount => throw _privateConstructorUsedError;

  /// Serializes this CoachRouteResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CoachRouteResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoachRouteResponseCopyWith<CoachRouteResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoachRouteResponseCopyWith<$Res> {
  factory $CoachRouteResponseCopyWith(
    CoachRouteResponse value,
    $Res Function(CoachRouteResponse) then,
  ) = _$CoachRouteResponseCopyWithImpl<$Res, CoachRouteResponse>;
  @useResult
  $Res call({
    String id,
    String originDestinationId,
    String originDestinationName,
    String destinationDestinationId,
    String destinationDestinationName,
    double distanceKm,
    double estimatedHours,
    double basePrice,
    String? refundPolicyId,
    String? refundPolicyName,
    double averageRating,
    int reviewCount,
  });
}

/// @nodoc
class _$CoachRouteResponseCopyWithImpl<$Res, $Val extends CoachRouteResponse>
    implements $CoachRouteResponseCopyWith<$Res> {
  _$CoachRouteResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoachRouteResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? originDestinationId = null,
    Object? originDestinationName = null,
    Object? destinationDestinationId = null,
    Object? destinationDestinationName = null,
    Object? distanceKm = null,
    Object? estimatedHours = null,
    Object? basePrice = null,
    Object? refundPolicyId = freezed,
    Object? refundPolicyName = freezed,
    Object? averageRating = null,
    Object? reviewCount = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            originDestinationId: null == originDestinationId
                ? _value.originDestinationId
                : originDestinationId // ignore: cast_nullable_to_non_nullable
                      as String,
            originDestinationName: null == originDestinationName
                ? _value.originDestinationName
                : originDestinationName // ignore: cast_nullable_to_non_nullable
                      as String,
            destinationDestinationId: null == destinationDestinationId
                ? _value.destinationDestinationId
                : destinationDestinationId // ignore: cast_nullable_to_non_nullable
                      as String,
            destinationDestinationName: null == destinationDestinationName
                ? _value.destinationDestinationName
                : destinationDestinationName // ignore: cast_nullable_to_non_nullable
                      as String,
            distanceKm: null == distanceKm
                ? _value.distanceKm
                : distanceKm // ignore: cast_nullable_to_non_nullable
                      as double,
            estimatedHours: null == estimatedHours
                ? _value.estimatedHours
                : estimatedHours // ignore: cast_nullable_to_non_nullable
                      as double,
            basePrice: null == basePrice
                ? _value.basePrice
                : basePrice // ignore: cast_nullable_to_non_nullable
                      as double,
            refundPolicyId: freezed == refundPolicyId
                ? _value.refundPolicyId
                : refundPolicyId // ignore: cast_nullable_to_non_nullable
                      as String?,
            refundPolicyName: freezed == refundPolicyName
                ? _value.refundPolicyName
                : refundPolicyName // ignore: cast_nullable_to_non_nullable
                      as String?,
            averageRating: null == averageRating
                ? _value.averageRating
                : averageRating // ignore: cast_nullable_to_non_nullable
                      as double,
            reviewCount: null == reviewCount
                ? _value.reviewCount
                : reviewCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CoachRouteResponseImplCopyWith<$Res>
    implements $CoachRouteResponseCopyWith<$Res> {
  factory _$$CoachRouteResponseImplCopyWith(
    _$CoachRouteResponseImpl value,
    $Res Function(_$CoachRouteResponseImpl) then,
  ) = __$$CoachRouteResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String originDestinationId,
    String originDestinationName,
    String destinationDestinationId,
    String destinationDestinationName,
    double distanceKm,
    double estimatedHours,
    double basePrice,
    String? refundPolicyId,
    String? refundPolicyName,
    double averageRating,
    int reviewCount,
  });
}

/// @nodoc
class __$$CoachRouteResponseImplCopyWithImpl<$Res>
    extends _$CoachRouteResponseCopyWithImpl<$Res, _$CoachRouteResponseImpl>
    implements _$$CoachRouteResponseImplCopyWith<$Res> {
  __$$CoachRouteResponseImplCopyWithImpl(
    _$CoachRouteResponseImpl _value,
    $Res Function(_$CoachRouteResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CoachRouteResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? originDestinationId = null,
    Object? originDestinationName = null,
    Object? destinationDestinationId = null,
    Object? destinationDestinationName = null,
    Object? distanceKm = null,
    Object? estimatedHours = null,
    Object? basePrice = null,
    Object? refundPolicyId = freezed,
    Object? refundPolicyName = freezed,
    Object? averageRating = null,
    Object? reviewCount = null,
  }) {
    return _then(
      _$CoachRouteResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        originDestinationId: null == originDestinationId
            ? _value.originDestinationId
            : originDestinationId // ignore: cast_nullable_to_non_nullable
                  as String,
        originDestinationName: null == originDestinationName
            ? _value.originDestinationName
            : originDestinationName // ignore: cast_nullable_to_non_nullable
                  as String,
        destinationDestinationId: null == destinationDestinationId
            ? _value.destinationDestinationId
            : destinationDestinationId // ignore: cast_nullable_to_non_nullable
                  as String,
        destinationDestinationName: null == destinationDestinationName
            ? _value.destinationDestinationName
            : destinationDestinationName // ignore: cast_nullable_to_non_nullable
                  as String,
        distanceKm: null == distanceKm
            ? _value.distanceKm
            : distanceKm // ignore: cast_nullable_to_non_nullable
                  as double,
        estimatedHours: null == estimatedHours
            ? _value.estimatedHours
            : estimatedHours // ignore: cast_nullable_to_non_nullable
                  as double,
        basePrice: null == basePrice
            ? _value.basePrice
            : basePrice // ignore: cast_nullable_to_non_nullable
                  as double,
        refundPolicyId: freezed == refundPolicyId
            ? _value.refundPolicyId
            : refundPolicyId // ignore: cast_nullable_to_non_nullable
                  as String?,
        refundPolicyName: freezed == refundPolicyName
            ? _value.refundPolicyName
            : refundPolicyName // ignore: cast_nullable_to_non_nullable
                  as String?,
        averageRating: null == averageRating
            ? _value.averageRating
            : averageRating // ignore: cast_nullable_to_non_nullable
                  as double,
        reviewCount: null == reviewCount
            ? _value.reviewCount
            : reviewCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CoachRouteResponseImpl implements _CoachRouteResponse {
  const _$CoachRouteResponseImpl({
    required this.id,
    required this.originDestinationId,
    required this.originDestinationName,
    required this.destinationDestinationId,
    required this.destinationDestinationName,
    required this.distanceKm,
    required this.estimatedHours,
    required this.basePrice,
    this.refundPolicyId,
    this.refundPolicyName,
    required this.averageRating,
    required this.reviewCount,
  });

  factory _$CoachRouteResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoachRouteResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String originDestinationId;
  @override
  final String originDestinationName;
  @override
  final String destinationDestinationId;
  @override
  final String destinationDestinationName;
  @override
  final double distanceKm;
  @override
  final double estimatedHours;
  @override
  final double basePrice;
  @override
  final String? refundPolicyId;
  @override
  final String? refundPolicyName;
  @override
  final double averageRating;
  @override
  final int reviewCount;

  @override
  String toString() {
    return 'CoachRouteResponse(id: $id, originDestinationId: $originDestinationId, originDestinationName: $originDestinationName, destinationDestinationId: $destinationDestinationId, destinationDestinationName: $destinationDestinationName, distanceKm: $distanceKm, estimatedHours: $estimatedHours, basePrice: $basePrice, refundPolicyId: $refundPolicyId, refundPolicyName: $refundPolicyName, averageRating: $averageRating, reviewCount: $reviewCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoachRouteResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.originDestinationId, originDestinationId) ||
                other.originDestinationId == originDestinationId) &&
            (identical(other.originDestinationName, originDestinationName) ||
                other.originDestinationName == originDestinationName) &&
            (identical(
                  other.destinationDestinationId,
                  destinationDestinationId,
                ) ||
                other.destinationDestinationId == destinationDestinationId) &&
            (identical(
                  other.destinationDestinationName,
                  destinationDestinationName,
                ) ||
                other.destinationDestinationName ==
                    destinationDestinationName) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(other.estimatedHours, estimatedHours) ||
                other.estimatedHours == estimatedHours) &&
            (identical(other.basePrice, basePrice) ||
                other.basePrice == basePrice) &&
            (identical(other.refundPolicyId, refundPolicyId) ||
                other.refundPolicyId == refundPolicyId) &&
            (identical(other.refundPolicyName, refundPolicyName) ||
                other.refundPolicyName == refundPolicyName) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    originDestinationId,
    originDestinationName,
    destinationDestinationId,
    destinationDestinationName,
    distanceKm,
    estimatedHours,
    basePrice,
    refundPolicyId,
    refundPolicyName,
    averageRating,
    reviewCount,
  );

  /// Create a copy of CoachRouteResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoachRouteResponseImplCopyWith<_$CoachRouteResponseImpl> get copyWith =>
      __$$CoachRouteResponseImplCopyWithImpl<_$CoachRouteResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CoachRouteResponseImplToJson(this);
  }
}

abstract class _CoachRouteResponse implements CoachRouteResponse {
  const factory _CoachRouteResponse({
    required final String id,
    required final String originDestinationId,
    required final String originDestinationName,
    required final String destinationDestinationId,
    required final String destinationDestinationName,
    required final double distanceKm,
    required final double estimatedHours,
    required final double basePrice,
    final String? refundPolicyId,
    final String? refundPolicyName,
    required final double averageRating,
    required final int reviewCount,
  }) = _$CoachRouteResponseImpl;

  factory _CoachRouteResponse.fromJson(Map<String, dynamic> json) =
      _$CoachRouteResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get originDestinationId;
  @override
  String get originDestinationName;
  @override
  String get destinationDestinationId;
  @override
  String get destinationDestinationName;
  @override
  double get distanceKm;
  @override
  double get estimatedHours;
  @override
  double get basePrice;
  @override
  String? get refundPolicyId;
  @override
  String? get refundPolicyName;
  @override
  double get averageRating;
  @override
  int get reviewCount;

  /// Create a copy of CoachRouteResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoachRouteResponseImplCopyWith<_$CoachRouteResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
