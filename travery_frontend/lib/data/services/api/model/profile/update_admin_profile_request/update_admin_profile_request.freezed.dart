// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_admin_profile_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UpdateAdminProfileRequest _$UpdateAdminProfileRequestFromJson(
  Map<String, dynamic> json,
) {
  return _UpdateAdminProfileRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateAdminProfileRequest {
  String? get fullName => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;

  /// Serializes this UpdateAdminProfileRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateAdminProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateAdminProfileRequestCopyWith<UpdateAdminProfileRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateAdminProfileRequestCopyWith<$Res> {
  factory $UpdateAdminProfileRequestCopyWith(
    UpdateAdminProfileRequest value,
    $Res Function(UpdateAdminProfileRequest) then,
  ) = _$UpdateAdminProfileRequestCopyWithImpl<$Res, UpdateAdminProfileRequest>;
  @useResult
  $Res call({String? fullName, String? phoneNumber});
}

/// @nodoc
class _$UpdateAdminProfileRequestCopyWithImpl<
  $Res,
  $Val extends UpdateAdminProfileRequest
>
    implements $UpdateAdminProfileRequestCopyWith<$Res> {
  _$UpdateAdminProfileRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateAdminProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? fullName = freezed, Object? phoneNumber = freezed}) {
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UpdateAdminProfileRequestImplCopyWith<$Res>
    implements $UpdateAdminProfileRequestCopyWith<$Res> {
  factory _$$UpdateAdminProfileRequestImplCopyWith(
    _$UpdateAdminProfileRequestImpl value,
    $Res Function(_$UpdateAdminProfileRequestImpl) then,
  ) = __$$UpdateAdminProfileRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? fullName, String? phoneNumber});
}

/// @nodoc
class __$$UpdateAdminProfileRequestImplCopyWithImpl<$Res>
    extends
        _$UpdateAdminProfileRequestCopyWithImpl<
          $Res,
          _$UpdateAdminProfileRequestImpl
        >
    implements _$$UpdateAdminProfileRequestImplCopyWith<$Res> {
  __$$UpdateAdminProfileRequestImplCopyWithImpl(
    _$UpdateAdminProfileRequestImpl _value,
    $Res Function(_$UpdateAdminProfileRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdateAdminProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? fullName = freezed, Object? phoneNumber = freezed}) {
    return _then(
      _$UpdateAdminProfileRequestImpl(
        fullName: freezed == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String?,
        phoneNumber: freezed == phoneNumber
            ? _value.phoneNumber
            : phoneNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateAdminProfileRequestImpl implements _UpdateAdminProfileRequest {
  const _$UpdateAdminProfileRequestImpl({this.fullName, this.phoneNumber});

  factory _$UpdateAdminProfileRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateAdminProfileRequestImplFromJson(json);

  @override
  final String? fullName;
  @override
  final String? phoneNumber;

  @override
  String toString() {
    return 'UpdateAdminProfileRequest(fullName: $fullName, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateAdminProfileRequestImpl &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fullName, phoneNumber);

  /// Create a copy of UpdateAdminProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateAdminProfileRequestImplCopyWith<_$UpdateAdminProfileRequestImpl>
  get copyWith =>
      __$$UpdateAdminProfileRequestImplCopyWithImpl<
        _$UpdateAdminProfileRequestImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateAdminProfileRequestImplToJson(this);
  }
}

abstract class _UpdateAdminProfileRequest implements UpdateAdminProfileRequest {
  const factory _UpdateAdminProfileRequest({
    final String? fullName,
    final String? phoneNumber,
  }) = _$UpdateAdminProfileRequestImpl;

  factory _UpdateAdminProfileRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateAdminProfileRequestImpl.fromJson;

  @override
  String? get fullName;
  @override
  String? get phoneNumber;

  /// Create a copy of UpdateAdminProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateAdminProfileRequestImplCopyWith<_$UpdateAdminProfileRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
