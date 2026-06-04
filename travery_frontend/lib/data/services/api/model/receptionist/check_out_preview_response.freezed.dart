// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_out_preview_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CheckOutPreviewResponse _$CheckOutPreviewResponseFromJson(
  Map<String, dynamic> json,
) {
  return _CheckOutPreviewResponse.fromJson(json);
}

/// @nodoc
mixin _$CheckOutPreviewResponse {
  String get bookingId => throw _privateConstructorUsedError;
  num get roomCharges => throw _privateConstructorUsedError;
  num get addOnCharges => throw _privateConstructorUsedError;
  num get lateFees => throw _privateConstructorUsedError;
  num get totalBill => throw _privateConstructorUsedError;
  List<RecepAddOnOrderResponse> get unpaidAddOns =>
      throw _privateConstructorUsedError;

  /// Serializes this CheckOutPreviewResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckOutPreviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckOutPreviewResponseCopyWith<CheckOutPreviewResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckOutPreviewResponseCopyWith<$Res> {
  factory $CheckOutPreviewResponseCopyWith(
    CheckOutPreviewResponse value,
    $Res Function(CheckOutPreviewResponse) then,
  ) = _$CheckOutPreviewResponseCopyWithImpl<$Res, CheckOutPreviewResponse>;
  @useResult
  $Res call({
    String bookingId,
    num roomCharges,
    num addOnCharges,
    num lateFees,
    num totalBill,
    List<RecepAddOnOrderResponse> unpaidAddOns,
  });
}

/// @nodoc
class _$CheckOutPreviewResponseCopyWithImpl<
  $Res,
  $Val extends CheckOutPreviewResponse
>
    implements $CheckOutPreviewResponseCopyWith<$Res> {
  _$CheckOutPreviewResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckOutPreviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = null,
    Object? roomCharges = null,
    Object? addOnCharges = null,
    Object? lateFees = null,
    Object? totalBill = null,
    Object? unpaidAddOns = null,
  }) {
    return _then(
      _value.copyWith(
            bookingId: null == bookingId
                ? _value.bookingId
                : bookingId // ignore: cast_nullable_to_non_nullable
                      as String,
            roomCharges: null == roomCharges
                ? _value.roomCharges
                : roomCharges // ignore: cast_nullable_to_non_nullable
                      as num,
            addOnCharges: null == addOnCharges
                ? _value.addOnCharges
                : addOnCharges // ignore: cast_nullable_to_non_nullable
                      as num,
            lateFees: null == lateFees
                ? _value.lateFees
                : lateFees // ignore: cast_nullable_to_non_nullable
                      as num,
            totalBill: null == totalBill
                ? _value.totalBill
                : totalBill // ignore: cast_nullable_to_non_nullable
                      as num,
            unpaidAddOns: null == unpaidAddOns
                ? _value.unpaidAddOns
                : unpaidAddOns // ignore: cast_nullable_to_non_nullable
                      as List<RecepAddOnOrderResponse>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CheckOutPreviewResponseImplCopyWith<$Res>
    implements $CheckOutPreviewResponseCopyWith<$Res> {
  factory _$$CheckOutPreviewResponseImplCopyWith(
    _$CheckOutPreviewResponseImpl value,
    $Res Function(_$CheckOutPreviewResponseImpl) then,
  ) = __$$CheckOutPreviewResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String bookingId,
    num roomCharges,
    num addOnCharges,
    num lateFees,
    num totalBill,
    List<RecepAddOnOrderResponse> unpaidAddOns,
  });
}

/// @nodoc
class __$$CheckOutPreviewResponseImplCopyWithImpl<$Res>
    extends
        _$CheckOutPreviewResponseCopyWithImpl<
          $Res,
          _$CheckOutPreviewResponseImpl
        >
    implements _$$CheckOutPreviewResponseImplCopyWith<$Res> {
  __$$CheckOutPreviewResponseImplCopyWithImpl(
    _$CheckOutPreviewResponseImpl _value,
    $Res Function(_$CheckOutPreviewResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckOutPreviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = null,
    Object? roomCharges = null,
    Object? addOnCharges = null,
    Object? lateFees = null,
    Object? totalBill = null,
    Object? unpaidAddOns = null,
  }) {
    return _then(
      _$CheckOutPreviewResponseImpl(
        bookingId: null == bookingId
            ? _value.bookingId
            : bookingId // ignore: cast_nullable_to_non_nullable
                  as String,
        roomCharges: null == roomCharges
            ? _value.roomCharges
            : roomCharges // ignore: cast_nullable_to_non_nullable
                  as num,
        addOnCharges: null == addOnCharges
            ? _value.addOnCharges
            : addOnCharges // ignore: cast_nullable_to_non_nullable
                  as num,
        lateFees: null == lateFees
            ? _value.lateFees
            : lateFees // ignore: cast_nullable_to_non_nullable
                  as num,
        totalBill: null == totalBill
            ? _value.totalBill
            : totalBill // ignore: cast_nullable_to_non_nullable
                  as num,
        unpaidAddOns: null == unpaidAddOns
            ? _value._unpaidAddOns
            : unpaidAddOns // ignore: cast_nullable_to_non_nullable
                  as List<RecepAddOnOrderResponse>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckOutPreviewResponseImpl implements _CheckOutPreviewResponse {
  const _$CheckOutPreviewResponseImpl({
    required this.bookingId,
    required this.roomCharges,
    required this.addOnCharges,
    required this.lateFees,
    required this.totalBill,
    required final List<RecepAddOnOrderResponse> unpaidAddOns,
  }) : _unpaidAddOns = unpaidAddOns;

  factory _$CheckOutPreviewResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckOutPreviewResponseImplFromJson(json);

  @override
  final String bookingId;
  @override
  final num roomCharges;
  @override
  final num addOnCharges;
  @override
  final num lateFees;
  @override
  final num totalBill;
  final List<RecepAddOnOrderResponse> _unpaidAddOns;
  @override
  List<RecepAddOnOrderResponse> get unpaidAddOns {
    if (_unpaidAddOns is EqualUnmodifiableListView) return _unpaidAddOns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unpaidAddOns);
  }

  @override
  String toString() {
    return 'CheckOutPreviewResponse(bookingId: $bookingId, roomCharges: $roomCharges, addOnCharges: $addOnCharges, lateFees: $lateFees, totalBill: $totalBill, unpaidAddOns: $unpaidAddOns)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckOutPreviewResponseImpl &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.roomCharges, roomCharges) ||
                other.roomCharges == roomCharges) &&
            (identical(other.addOnCharges, addOnCharges) ||
                other.addOnCharges == addOnCharges) &&
            (identical(other.lateFees, lateFees) ||
                other.lateFees == lateFees) &&
            (identical(other.totalBill, totalBill) ||
                other.totalBill == totalBill) &&
            const DeepCollectionEquality().equals(
              other._unpaidAddOns,
              _unpaidAddOns,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    bookingId,
    roomCharges,
    addOnCharges,
    lateFees,
    totalBill,
    const DeepCollectionEquality().hash(_unpaidAddOns),
  );

  /// Create a copy of CheckOutPreviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckOutPreviewResponseImplCopyWith<_$CheckOutPreviewResponseImpl>
  get copyWith =>
      __$$CheckOutPreviewResponseImplCopyWithImpl<
        _$CheckOutPreviewResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckOutPreviewResponseImplToJson(this);
  }
}

abstract class _CheckOutPreviewResponse implements CheckOutPreviewResponse {
  const factory _CheckOutPreviewResponse({
    required final String bookingId,
    required final num roomCharges,
    required final num addOnCharges,
    required final num lateFees,
    required final num totalBill,
    required final List<RecepAddOnOrderResponse> unpaidAddOns,
  }) = _$CheckOutPreviewResponseImpl;

  factory _CheckOutPreviewResponse.fromJson(Map<String, dynamic> json) =
      _$CheckOutPreviewResponseImpl.fromJson;

  @override
  String get bookingId;
  @override
  num get roomCharges;
  @override
  num get addOnCharges;
  @override
  num get lateFees;
  @override
  num get totalBill;
  @override
  List<RecepAddOnOrderResponse> get unpaidAddOns;

  /// Create a copy of CheckOutPreviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckOutPreviewResponseImplCopyWith<_$CheckOutPreviewResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
