// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recep_booking_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RecepBookingListResponse _$RecepBookingListResponseFromJson(
  Map<String, dynamic> json,
) {
  return _RecepBookingListResponse.fromJson(json);
}

/// @nodoc
mixin _$RecepBookingListResponse {
  String get id => throw _privateConstructorUsedError;
  String get guestName => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get checkInDate => throw _privateConstructorUsedError;
  String get checkOutDate => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this RecepBookingListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecepBookingListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecepBookingListResponseCopyWith<RecepBookingListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecepBookingListResponseCopyWith<$Res> {
  factory $RecepBookingListResponseCopyWith(
    RecepBookingListResponse value,
    $Res Function(RecepBookingListResponse) then,
  ) = _$RecepBookingListResponseCopyWithImpl<$Res, RecepBookingListResponse>;
  @useResult
  $Res call({
    String id,
    String guestName,
    String phoneNumber,
    String checkInDate,
    String checkOutDate,
    String status,
  });
}

/// @nodoc
class _$RecepBookingListResponseCopyWithImpl<
  $Res,
  $Val extends RecepBookingListResponse
>
    implements $RecepBookingListResponseCopyWith<$Res> {
  _$RecepBookingListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecepBookingListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? guestName = null,
    Object? phoneNumber = null,
    Object? checkInDate = null,
    Object? checkOutDate = null,
    Object? status = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            guestName: null == guestName
                ? _value.guestName
                : guestName // ignore: cast_nullable_to_non_nullable
                      as String,
            phoneNumber: null == phoneNumber
                ? _value.phoneNumber
                : phoneNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            checkInDate: null == checkInDate
                ? _value.checkInDate
                : checkInDate // ignore: cast_nullable_to_non_nullable
                      as String,
            checkOutDate: null == checkOutDate
                ? _value.checkOutDate
                : checkOutDate // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RecepBookingListResponseImplCopyWith<$Res>
    implements $RecepBookingListResponseCopyWith<$Res> {
  factory _$$RecepBookingListResponseImplCopyWith(
    _$RecepBookingListResponseImpl value,
    $Res Function(_$RecepBookingListResponseImpl) then,
  ) = __$$RecepBookingListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String guestName,
    String phoneNumber,
    String checkInDate,
    String checkOutDate,
    String status,
  });
}

/// @nodoc
class __$$RecepBookingListResponseImplCopyWithImpl<$Res>
    extends
        _$RecepBookingListResponseCopyWithImpl<
          $Res,
          _$RecepBookingListResponseImpl
        >
    implements _$$RecepBookingListResponseImplCopyWith<$Res> {
  __$$RecepBookingListResponseImplCopyWithImpl(
    _$RecepBookingListResponseImpl _value,
    $Res Function(_$RecepBookingListResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecepBookingListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? guestName = null,
    Object? phoneNumber = null,
    Object? checkInDate = null,
    Object? checkOutDate = null,
    Object? status = null,
  }) {
    return _then(
      _$RecepBookingListResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        guestName: null == guestName
            ? _value.guestName
            : guestName // ignore: cast_nullable_to_non_nullable
                  as String,
        phoneNumber: null == phoneNumber
            ? _value.phoneNumber
            : phoneNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        checkInDate: null == checkInDate
            ? _value.checkInDate
            : checkInDate // ignore: cast_nullable_to_non_nullable
                  as String,
        checkOutDate: null == checkOutDate
            ? _value.checkOutDate
            : checkOutDate // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RecepBookingListResponseImpl implements _RecepBookingListResponse {
  const _$RecepBookingListResponseImpl({
    required this.id,
    required this.guestName,
    required this.phoneNumber,
    required this.checkInDate,
    required this.checkOutDate,
    required this.status,
  });

  factory _$RecepBookingListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecepBookingListResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String guestName;
  @override
  final String phoneNumber;
  @override
  final String checkInDate;
  @override
  final String checkOutDate;
  @override
  final String status;

  @override
  String toString() {
    return 'RecepBookingListResponse(id: $id, guestName: $guestName, phoneNumber: $phoneNumber, checkInDate: $checkInDate, checkOutDate: $checkOutDate, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecepBookingListResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.guestName, guestName) ||
                other.guestName == guestName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.checkInDate, checkInDate) ||
                other.checkInDate == checkInDate) &&
            (identical(other.checkOutDate, checkOutDate) ||
                other.checkOutDate == checkOutDate) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    guestName,
    phoneNumber,
    checkInDate,
    checkOutDate,
    status,
  );

  /// Create a copy of RecepBookingListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecepBookingListResponseImplCopyWith<_$RecepBookingListResponseImpl>
  get copyWith =>
      __$$RecepBookingListResponseImplCopyWithImpl<
        _$RecepBookingListResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecepBookingListResponseImplToJson(this);
  }
}

abstract class _RecepBookingListResponse implements RecepBookingListResponse {
  const factory _RecepBookingListResponse({
    required final String id,
    required final String guestName,
    required final String phoneNumber,
    required final String checkInDate,
    required final String checkOutDate,
    required final String status,
  }) = _$RecepBookingListResponseImpl;

  factory _RecepBookingListResponse.fromJson(Map<String, dynamic> json) =
      _$RecepBookingListResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get guestName;
  @override
  String get phoneNumber;
  @override
  String get checkInDate;
  @override
  String get checkOutDate;
  @override
  String get status;

  /// Create a copy of RecepBookingListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecepBookingListResponseImplCopyWith<_$RecepBookingListResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
