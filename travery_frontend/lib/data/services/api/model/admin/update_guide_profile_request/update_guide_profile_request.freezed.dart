// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_guide_profile_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UpdateGuideProfileRequest _$UpdateGuideProfileRequestFromJson(
  Map<String, dynamic> json,
) {
  return _UpdateGuideProfileRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateGuideProfileRequest {
  String? get fullName => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get guideLicense => throw _privateConstructorUsedError;
  int? get yearsExperience => throw _privateConstructorUsedError;
  List<String>? get languages => throw _privateConstructorUsedError;

  /// Serializes this UpdateGuideProfileRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateGuideProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateGuideProfileRequestCopyWith<UpdateGuideProfileRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateGuideProfileRequestCopyWith<$Res> {
  factory $UpdateGuideProfileRequestCopyWith(
    UpdateGuideProfileRequest value,
    $Res Function(UpdateGuideProfileRequest) then,
  ) = _$UpdateGuideProfileRequestCopyWithImpl<$Res, UpdateGuideProfileRequest>;
  @useResult
  $Res call({
    String? fullName,
    String? phoneNumber,
    String? guideLicense,
    int? yearsExperience,
    List<String>? languages,
  });
}

/// @nodoc
class _$UpdateGuideProfileRequestCopyWithImpl<
  $Res,
  $Val extends UpdateGuideProfileRequest
>
    implements $UpdateGuideProfileRequestCopyWith<$Res> {
  _$UpdateGuideProfileRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateGuideProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = freezed,
    Object? phoneNumber = freezed,
    Object? guideLicense = freezed,
    Object? yearsExperience = freezed,
    Object? languages = freezed,
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
            guideLicense: freezed == guideLicense
                ? _value.guideLicense
                : guideLicense // ignore: cast_nullable_to_non_nullable
                      as String?,
            yearsExperience: freezed == yearsExperience
                ? _value.yearsExperience
                : yearsExperience // ignore: cast_nullable_to_non_nullable
                      as int?,
            languages: freezed == languages
                ? _value.languages
                : languages // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UpdateGuideProfileRequestImplCopyWith<$Res>
    implements $UpdateGuideProfileRequestCopyWith<$Res> {
  factory _$$UpdateGuideProfileRequestImplCopyWith(
    _$UpdateGuideProfileRequestImpl value,
    $Res Function(_$UpdateGuideProfileRequestImpl) then,
  ) = __$$UpdateGuideProfileRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? fullName,
    String? phoneNumber,
    String? guideLicense,
    int? yearsExperience,
    List<String>? languages,
  });
}

/// @nodoc
class __$$UpdateGuideProfileRequestImplCopyWithImpl<$Res>
    extends
        _$UpdateGuideProfileRequestCopyWithImpl<
          $Res,
          _$UpdateGuideProfileRequestImpl
        >
    implements _$$UpdateGuideProfileRequestImplCopyWith<$Res> {
  __$$UpdateGuideProfileRequestImplCopyWithImpl(
    _$UpdateGuideProfileRequestImpl _value,
    $Res Function(_$UpdateGuideProfileRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdateGuideProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = freezed,
    Object? phoneNumber = freezed,
    Object? guideLicense = freezed,
    Object? yearsExperience = freezed,
    Object? languages = freezed,
  }) {
    return _then(
      _$UpdateGuideProfileRequestImpl(
        fullName: freezed == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String?,
        phoneNumber: freezed == phoneNumber
            ? _value.phoneNumber
            : phoneNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        guideLicense: freezed == guideLicense
            ? _value.guideLicense
            : guideLicense // ignore: cast_nullable_to_non_nullable
                  as String?,
        yearsExperience: freezed == yearsExperience
            ? _value.yearsExperience
            : yearsExperience // ignore: cast_nullable_to_non_nullable
                  as int?,
        languages: freezed == languages
            ? _value._languages
            : languages // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateGuideProfileRequestImpl implements _UpdateGuideProfileRequest {
  const _$UpdateGuideProfileRequestImpl({
    this.fullName,
    this.phoneNumber,
    this.guideLicense,
    this.yearsExperience,
    final List<String>? languages,
  }) : _languages = languages;

  factory _$UpdateGuideProfileRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateGuideProfileRequestImplFromJson(json);

  @override
  final String? fullName;
  @override
  final String? phoneNumber;
  @override
  final String? guideLicense;
  @override
  final int? yearsExperience;
  final List<String>? _languages;
  @override
  List<String>? get languages {
    final value = _languages;
    if (value == null) return null;
    if (_languages is EqualUnmodifiableListView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UpdateGuideProfileRequest(fullName: $fullName, phoneNumber: $phoneNumber, guideLicense: $guideLicense, yearsExperience: $yearsExperience, languages: $languages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateGuideProfileRequestImpl &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.guideLicense, guideLicense) ||
                other.guideLicense == guideLicense) &&
            (identical(other.yearsExperience, yearsExperience) ||
                other.yearsExperience == yearsExperience) &&
            const DeepCollectionEquality().equals(
              other._languages,
              _languages,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    fullName,
    phoneNumber,
    guideLicense,
    yearsExperience,
    const DeepCollectionEquality().hash(_languages),
  );

  /// Create a copy of UpdateGuideProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateGuideProfileRequestImplCopyWith<_$UpdateGuideProfileRequestImpl>
  get copyWith =>
      __$$UpdateGuideProfileRequestImplCopyWithImpl<
        _$UpdateGuideProfileRequestImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateGuideProfileRequestImplToJson(this);
  }
}

abstract class _UpdateGuideProfileRequest implements UpdateGuideProfileRequest {
  const factory _UpdateGuideProfileRequest({
    final String? fullName,
    final String? phoneNumber,
    final String? guideLicense,
    final int? yearsExperience,
    final List<String>? languages,
  }) = _$UpdateGuideProfileRequestImpl;

  factory _UpdateGuideProfileRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateGuideProfileRequestImpl.fromJson;

  @override
  String? get fullName;
  @override
  String? get phoneNumber;
  @override
  String? get guideLicense;
  @override
  int? get yearsExperience;
  @override
  List<String>? get languages;

  /// Create a copy of UpdateGuideProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateGuideProfileRequestImplCopyWith<_$UpdateGuideProfileRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
