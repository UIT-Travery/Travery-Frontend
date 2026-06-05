// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_in_queue_item_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CheckInQueueItemResponse _$CheckInQueueItemResponseFromJson(
  Map<String, dynamic> json,
) {
  return _CheckInQueueItemResponse.fromJson(json);
}

/// @nodoc
mixin _$CheckInQueueItemResponse {
  String get bookingId => throw _privateConstructorUsedError;
  String get touristName => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  int get memberCount => throw _privateConstructorUsedError;
  int get totalRooms => throw _privateConstructorUsedError;
  Map<String, int> get roomTypeBreakdown => throw _privateConstructorUsedError;

  /// Serializes this CheckInQueueItemResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckInQueueItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckInQueueItemResponseCopyWith<CheckInQueueItemResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckInQueueItemResponseCopyWith<$Res> {
  factory $CheckInQueueItemResponseCopyWith(
    CheckInQueueItemResponse value,
    $Res Function(CheckInQueueItemResponse) then,
  ) = _$CheckInQueueItemResponseCopyWithImpl<$Res, CheckInQueueItemResponse>;
  @useResult
  $Res call({
    String bookingId,
    String touristName,
    String phoneNumber,
    int memberCount,
    int totalRooms,
    Map<String, int> roomTypeBreakdown,
  });
}

/// @nodoc
class _$CheckInQueueItemResponseCopyWithImpl<
  $Res,
  $Val extends CheckInQueueItemResponse
>
    implements $CheckInQueueItemResponseCopyWith<$Res> {
  _$CheckInQueueItemResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckInQueueItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = null,
    Object? touristName = null,
    Object? phoneNumber = null,
    Object? memberCount = null,
    Object? totalRooms = null,
    Object? roomTypeBreakdown = null,
  }) {
    return _then(
      _value.copyWith(
            bookingId: null == bookingId
                ? _value.bookingId
                : bookingId // ignore: cast_nullable_to_non_nullable
                      as String,
            touristName: null == touristName
                ? _value.touristName
                : touristName // ignore: cast_nullable_to_non_nullable
                      as String,
            phoneNumber: null == phoneNumber
                ? _value.phoneNumber
                : phoneNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            memberCount: null == memberCount
                ? _value.memberCount
                : memberCount // ignore: cast_nullable_to_non_nullable
                      as int,
            totalRooms: null == totalRooms
                ? _value.totalRooms
                : totalRooms // ignore: cast_nullable_to_non_nullable
                      as int,
            roomTypeBreakdown: null == roomTypeBreakdown
                ? _value.roomTypeBreakdown
                : roomTypeBreakdown // ignore: cast_nullable_to_non_nullable
                      as Map<String, int>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CheckInQueueItemResponseImplCopyWith<$Res>
    implements $CheckInQueueItemResponseCopyWith<$Res> {
  factory _$$CheckInQueueItemResponseImplCopyWith(
    _$CheckInQueueItemResponseImpl value,
    $Res Function(_$CheckInQueueItemResponseImpl) then,
  ) = __$$CheckInQueueItemResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String bookingId,
    String touristName,
    String phoneNumber,
    int memberCount,
    int totalRooms,
    Map<String, int> roomTypeBreakdown,
  });
}

/// @nodoc
class __$$CheckInQueueItemResponseImplCopyWithImpl<$Res>
    extends
        _$CheckInQueueItemResponseCopyWithImpl<
          $Res,
          _$CheckInQueueItemResponseImpl
        >
    implements _$$CheckInQueueItemResponseImplCopyWith<$Res> {
  __$$CheckInQueueItemResponseImplCopyWithImpl(
    _$CheckInQueueItemResponseImpl _value,
    $Res Function(_$CheckInQueueItemResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckInQueueItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = null,
    Object? touristName = null,
    Object? phoneNumber = null,
    Object? memberCount = null,
    Object? totalRooms = null,
    Object? roomTypeBreakdown = null,
  }) {
    return _then(
      _$CheckInQueueItemResponseImpl(
        bookingId: null == bookingId
            ? _value.bookingId
            : bookingId // ignore: cast_nullable_to_non_nullable
                  as String,
        touristName: null == touristName
            ? _value.touristName
            : touristName // ignore: cast_nullable_to_non_nullable
                  as String,
        phoneNumber: null == phoneNumber
            ? _value.phoneNumber
            : phoneNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        memberCount: null == memberCount
            ? _value.memberCount
            : memberCount // ignore: cast_nullable_to_non_nullable
                  as int,
        totalRooms: null == totalRooms
            ? _value.totalRooms
            : totalRooms // ignore: cast_nullable_to_non_nullable
                  as int,
        roomTypeBreakdown: null == roomTypeBreakdown
            ? _value._roomTypeBreakdown
            : roomTypeBreakdown // ignore: cast_nullable_to_non_nullable
                  as Map<String, int>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckInQueueItemResponseImpl implements _CheckInQueueItemResponse {
  _$CheckInQueueItemResponseImpl({
    this.bookingId = '',
    this.touristName = '',
    this.phoneNumber = '',
    this.memberCount = 0,
    this.totalRooms = 0,
    final Map<String, int> roomTypeBreakdown = const {},
  }) : _roomTypeBreakdown = roomTypeBreakdown;

  factory _$CheckInQueueItemResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckInQueueItemResponseImplFromJson(json);

  @override
  @JsonKey()
  final String bookingId;
  @override
  @JsonKey()
  final String touristName;
  @override
  @JsonKey()
  final String phoneNumber;
  @override
  @JsonKey()
  final int memberCount;
  @override
  @JsonKey()
  final int totalRooms;
  final Map<String, int> _roomTypeBreakdown;
  @override
  @JsonKey()
  Map<String, int> get roomTypeBreakdown {
    if (_roomTypeBreakdown is EqualUnmodifiableMapView)
      return _roomTypeBreakdown;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_roomTypeBreakdown);
  }

  @override
  String toString() {
    return 'CheckInQueueItemResponse(bookingId: $bookingId, touristName: $touristName, phoneNumber: $phoneNumber, memberCount: $memberCount, totalRooms: $totalRooms, roomTypeBreakdown: $roomTypeBreakdown)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckInQueueItemResponseImpl &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.touristName, touristName) ||
                other.touristName == touristName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.memberCount, memberCount) ||
                other.memberCount == memberCount) &&
            (identical(other.totalRooms, totalRooms) ||
                other.totalRooms == totalRooms) &&
            const DeepCollectionEquality().equals(
              other._roomTypeBreakdown,
              _roomTypeBreakdown,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    bookingId,
    touristName,
    phoneNumber,
    memberCount,
    totalRooms,
    const DeepCollectionEquality().hash(_roomTypeBreakdown),
  );

  /// Create a copy of CheckInQueueItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckInQueueItemResponseImplCopyWith<_$CheckInQueueItemResponseImpl>
  get copyWith =>
      __$$CheckInQueueItemResponseImplCopyWithImpl<
        _$CheckInQueueItemResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckInQueueItemResponseImplToJson(this);
  }
}

abstract class _CheckInQueueItemResponse implements CheckInQueueItemResponse {
  factory _CheckInQueueItemResponse({
    final String bookingId,
    final String touristName,
    final String phoneNumber,
    final int memberCount,
    final int totalRooms,
    final Map<String, int> roomTypeBreakdown,
  }) = _$CheckInQueueItemResponseImpl;

  factory _CheckInQueueItemResponse.fromJson(Map<String, dynamic> json) =
      _$CheckInQueueItemResponseImpl.fromJson;

  @override
  String get bookingId;
  @override
  String get touristName;
  @override
  String get phoneNumber;
  @override
  int get memberCount;
  @override
  int get totalRooms;
  @override
  Map<String, int> get roomTypeBreakdown;

  /// Create a copy of CheckInQueueItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckInQueueItemResponseImplCopyWith<_$CheckInQueueItemResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
