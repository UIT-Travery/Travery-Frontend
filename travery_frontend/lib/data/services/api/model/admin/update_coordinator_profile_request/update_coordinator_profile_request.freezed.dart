// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_coordinator_profile_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UpdateCoordinatorProfileRequest _$UpdateCoordinatorProfileRequestFromJson(
  Map<String, dynamic> json,
) {
  return _UpdateCoordinatorProfileRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateCoordinatorProfileRequest {
  String? get fullName => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;

  /// One of: TOUR, HOTEL, COACH
  String? get department => throw _privateConstructorUsedError;

  /// Serializes this UpdateCoordinatorProfileRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateCoordinatorProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateCoordinatorProfileRequestCopyWith<UpdateCoordinatorProfileRequest>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateCoordinatorProfileRequestCopyWith<$Res> {
  factory $UpdateCoordinatorProfileRequestCopyWith(
    UpdateCoordinatorProfileRequest value,
    $Res Function(UpdateCoordinatorProfileRequest) then,
  ) =
      _$UpdateCoordinatorProfileRequestCopyWithImpl<
        $Res,
        UpdateCoordinatorProfileRequest
      >;
  @useResult
  $Res call({String? fullName, String? phoneNumber, String? department});
}

/// @nodoc
class _$UpdateCoordinatorProfileRequestCopyWithImpl<
  $Res,
  $Val extends UpdateCoordinatorProfileRequest
>
    implements $UpdateCoordinatorProfileRequestCopyWith<$Res> {
  _$UpdateCoordinatorProfileRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateCoordinatorProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = freezed,
    Object? phoneNumber = freezed,
    Object? department = freezed,
  }) {
    return _then(
      _value.copyWith(
            fullName: freezed == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String?,
            phoneNumber: freezed == phoneNumber
                ? _value.phoneNumber
                : phoneNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            department: freezed == department
                ? _value.department
                : department // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UpdateCoordinatorProfileRequestImplCopyWith<$Res>
    implements $UpdateCoordinatorProfileRequestCopyWith<$Res> {
  factory _$$UpdateCoordinatorProfileRequestImplCopyWith(
    _$UpdateCoordinatorProfileRequestImpl value,
    $Res Function(_$UpdateCoordinatorProfileRequestImpl) then,
  ) = __$$UpdateCoordinatorProfileRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? fullName, String? phoneNumber, String? department});
}

/// @nodoc
class __$$UpdateCoordinatorProfileRequestImplCopyWithImpl<$Res>
    extends
        _$UpdateCoordinatorProfileRequestCopyWithImpl<
          $Res,
          _$UpdateCoordinatorProfileRequestImpl
        >
    implements _$$UpdateCoordinatorProfileRequestImplCopyWith<$Res> {
  __$$UpdateCoordinatorProfileRequestImplCopyWithImpl(
    _$UpdateCoordinatorProfileRequestImpl _value,
    $Res Function(_$UpdateCoordinatorProfileRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdateCoordinatorProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = freezed,
    Object? phoneNumber = freezed,
    Object? department = freezed,
  }) {
    return _then(
      _$UpdateCoordinatorProfileRequestImpl(
        fullName: freezed == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String?,
        phoneNumber: freezed == phoneNumber
            ? _value.phoneNumber
            : phoneNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        department: freezed == department
            ? _value.department
            : department // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateCoordinatorProfileRequestImpl
    implements _UpdateCoordinatorProfileRequest {
  const _$UpdateCoordinatorProfileRequestImpl({
    this.fullName,
    this.phoneNumber,
    this.department,
  });

  factory _$UpdateCoordinatorProfileRequestImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$UpdateCoordinatorProfileRequestImplFromJson(json);

  @override
  final String? fullName;
  @override
  final String? phoneNumber;

  /// One of: TOUR, HOTEL, COACH
  @override
  final String? department;

  @override
  String toString() {
    return 'UpdateCoordinatorProfileRequest(fullName: $fullName, phoneNumber: $phoneNumber, department: $department)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateCoordinatorProfileRequestImpl &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.department, department) ||
                other.department == department));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, fullName, phoneNumber, department);

  /// Create a copy of UpdateCoordinatorProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateCoordinatorProfileRequestImplCopyWith<
    _$UpdateCoordinatorProfileRequestImpl
  >
  get copyWith =>
      __$$UpdateCoordinatorProfileRequestImplCopyWithImpl<
        _$UpdateCoordinatorProfileRequestImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateCoordinatorProfileRequestImplToJson(this);
  }
}

abstract class _UpdateCoordinatorProfileRequest
    implements UpdateCoordinatorProfileRequest {
  const factory _UpdateCoordinatorProfileRequest({
    final String? fullName,
    final String? phoneNumber,
    final String? department,
  }) = _$UpdateCoordinatorProfileRequestImpl;

  factory _UpdateCoordinatorProfileRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateCoordinatorProfileRequestImpl.fromJson;

  @override
  String? get fullName;
  @override
  String? get phoneNumber;

  /// One of: TOUR, HOTEL, COACH
  @override
  String? get department;

  /// Create a copy of UpdateCoordinatorProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateCoordinatorProfileRequestImplCopyWith<
    _$UpdateCoordinatorProfileRequestImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
