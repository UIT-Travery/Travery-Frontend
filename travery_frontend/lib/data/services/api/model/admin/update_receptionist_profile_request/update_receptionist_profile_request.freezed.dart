// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_receptionist_profile_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UpdateReceptionistProfileRequest _$UpdateReceptionistProfileRequestFromJson(
  Map<String, dynamic> json,
) {
  return _UpdateReceptionistProfileRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateReceptionistProfileRequest {
  String? get fullName => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;

  /// One of: MORNING, EVENING, NIGHT
  String? get shiftType => throw _privateConstructorUsedError;
  String? get hotelId => throw _privateConstructorUsedError;

  /// Serializes this UpdateReceptionistProfileRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateReceptionistProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateReceptionistProfileRequestCopyWith<UpdateReceptionistProfileRequest>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateReceptionistProfileRequestCopyWith<$Res> {
  factory $UpdateReceptionistProfileRequestCopyWith(
    UpdateReceptionistProfileRequest value,
    $Res Function(UpdateReceptionistProfileRequest) then,
  ) =
      _$UpdateReceptionistProfileRequestCopyWithImpl<
        $Res,
        UpdateReceptionistProfileRequest
      >;
  @useResult
  $Res call({
    String? fullName,
    String? phoneNumber,
    String? shiftType,
    String? hotelId,
  });
}

/// @nodoc
class _$UpdateReceptionistProfileRequestCopyWithImpl<
  $Res,
  $Val extends UpdateReceptionistProfileRequest
>
    implements $UpdateReceptionistProfileRequestCopyWith<$Res> {
  _$UpdateReceptionistProfileRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateReceptionistProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = freezed,
    Object? phoneNumber = freezed,
    Object? shiftType = freezed,
    Object? hotelId = freezed,
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
            shiftType: freezed == shiftType
                ? _value.shiftType
                : shiftType // ignore: cast_nullable_to_non_nullable
                      as String?,
            hotelId: freezed == hotelId
                ? _value.hotelId
                : hotelId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UpdateReceptionistProfileRequestImplCopyWith<$Res>
    implements $UpdateReceptionistProfileRequestCopyWith<$Res> {
  factory _$$UpdateReceptionistProfileRequestImplCopyWith(
    _$UpdateReceptionistProfileRequestImpl value,
    $Res Function(_$UpdateReceptionistProfileRequestImpl) then,
  ) = __$$UpdateReceptionistProfileRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? fullName,
    String? phoneNumber,
    String? shiftType,
    String? hotelId,
  });
}

/// @nodoc
class __$$UpdateReceptionistProfileRequestImplCopyWithImpl<$Res>
    extends
        _$UpdateReceptionistProfileRequestCopyWithImpl<
          $Res,
          _$UpdateReceptionistProfileRequestImpl
        >
    implements _$$UpdateReceptionistProfileRequestImplCopyWith<$Res> {
  __$$UpdateReceptionistProfileRequestImplCopyWithImpl(
    _$UpdateReceptionistProfileRequestImpl _value,
    $Res Function(_$UpdateReceptionistProfileRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdateReceptionistProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = freezed,
    Object? phoneNumber = freezed,
    Object? shiftType = freezed,
    Object? hotelId = freezed,
  }) {
    return _then(
      _$UpdateReceptionistProfileRequestImpl(
        fullName: freezed == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String?,
        phoneNumber: freezed == phoneNumber
            ? _value.phoneNumber
            : phoneNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        shiftType: freezed == shiftType
            ? _value.shiftType
            : shiftType // ignore: cast_nullable_to_non_nullable
                  as String?,
        hotelId: freezed == hotelId
            ? _value.hotelId
            : hotelId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateReceptionistProfileRequestImpl
    implements _UpdateReceptionistProfileRequest {
  const _$UpdateReceptionistProfileRequestImpl({
    this.fullName,
    this.phoneNumber,
    this.shiftType,
    this.hotelId,
  });

  factory _$UpdateReceptionistProfileRequestImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$UpdateReceptionistProfileRequestImplFromJson(json);

  @override
  final String? fullName;
  @override
  final String? phoneNumber;

  /// One of: MORNING, EVENING, NIGHT
  @override
  final String? shiftType;
  @override
  final String? hotelId;

  @override
  String toString() {
    return 'UpdateReceptionistProfileRequest(fullName: $fullName, phoneNumber: $phoneNumber, shiftType: $shiftType, hotelId: $hotelId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateReceptionistProfileRequestImpl &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.shiftType, shiftType) ||
                other.shiftType == shiftType) &&
            (identical(other.hotelId, hotelId) || other.hotelId == hotelId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, fullName, phoneNumber, shiftType, hotelId);

  /// Create a copy of UpdateReceptionistProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateReceptionistProfileRequestImplCopyWith<
    _$UpdateReceptionistProfileRequestImpl
  >
  get copyWith =>
      __$$UpdateReceptionistProfileRequestImplCopyWithImpl<
        _$UpdateReceptionistProfileRequestImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateReceptionistProfileRequestImplToJson(this);
  }
}

abstract class _UpdateReceptionistProfileRequest
    implements UpdateReceptionistProfileRequest {
  const factory _UpdateReceptionistProfileRequest({
    final String? fullName,
    final String? phoneNumber,
    final String? shiftType,
    final String? hotelId,
  }) = _$UpdateReceptionistProfileRequestImpl;

  factory _UpdateReceptionistProfileRequest.fromJson(
    Map<String, dynamic> json,
  ) = _$UpdateReceptionistProfileRequestImpl.fromJson;

  @override
  String? get fullName;
  @override
  String? get phoneNumber;

  /// One of: MORNING, EVENING, NIGHT
  @override
  String? get shiftType;
  @override
  String? get hotelId;

  /// Create a copy of UpdateReceptionistProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateReceptionistProfileRequestImplCopyWith<
    _$UpdateReceptionistProfileRequestImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
