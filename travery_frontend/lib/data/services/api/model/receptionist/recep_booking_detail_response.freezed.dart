// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recep_booking_detail_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RecepBookingDetailResponse _$RecepBookingDetailResponseFromJson(
  Map<String, dynamic> json,
) {
  return _RecepBookingDetailResponse.fromJson(json);
}

/// @nodoc
mixin _$RecepBookingDetailResponse {
  String get id => throw _privateConstructorUsedError;
  String get guestName => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get checkInDate => throw _privateConstructorUsedError;
  String get checkOutDate => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  num get totalPrice => throw _privateConstructorUsedError;
  num get totalAddOnCharges => throw _privateConstructorUsedError;
  List<HotelGuestResponse>? get manifest => throw _privateConstructorUsedError;
  List<RoomAllocationResponse>? get roomAllocations =>
      throw _privateConstructorUsedError;
  List<RecepAddOnOrderResponse>? get addOnOrders =>
      throw _privateConstructorUsedError;

  /// Serializes this RecepBookingDetailResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecepBookingDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecepBookingDetailResponseCopyWith<RecepBookingDetailResponse>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecepBookingDetailResponseCopyWith<$Res> {
  factory $RecepBookingDetailResponseCopyWith(
    RecepBookingDetailResponse value,
    $Res Function(RecepBookingDetailResponse) then,
  ) =
      _$RecepBookingDetailResponseCopyWithImpl<
        $Res,
        RecepBookingDetailResponse
      >;
  @useResult
  $Res call({
    String id,
    String guestName,
    String phoneNumber,
    String checkInDate,
    String checkOutDate,
    String status,
    num totalPrice,
    num totalAddOnCharges,
    List<HotelGuestResponse>? manifest,
    List<RoomAllocationResponse>? roomAllocations,
    List<RecepAddOnOrderResponse>? addOnOrders,
  });
}

/// @nodoc
class _$RecepBookingDetailResponseCopyWithImpl<
  $Res,
  $Val extends RecepBookingDetailResponse
>
    implements $RecepBookingDetailResponseCopyWith<$Res> {
  _$RecepBookingDetailResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecepBookingDetailResponse
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
    Object? totalPrice = null,
    Object? totalAddOnCharges = null,
    Object? manifest = freezed,
    Object? roomAllocations = freezed,
    Object? addOnOrders = freezed,
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
            totalPrice: null == totalPrice
                ? _value.totalPrice
                : totalPrice // ignore: cast_nullable_to_non_nullable
                      as num,
            totalAddOnCharges: null == totalAddOnCharges
                ? _value.totalAddOnCharges
                : totalAddOnCharges // ignore: cast_nullable_to_non_nullable
                      as num,
            manifest: freezed == manifest
                ? _value.manifest
                : manifest // ignore: cast_nullable_to_non_nullable
                      as List<HotelGuestResponse>?,
            roomAllocations: freezed == roomAllocations
                ? _value.roomAllocations
                : roomAllocations // ignore: cast_nullable_to_non_nullable
                      as List<RoomAllocationResponse>?,
            addOnOrders: freezed == addOnOrders
                ? _value.addOnOrders
                : addOnOrders // ignore: cast_nullable_to_non_nullable
                      as List<RecepAddOnOrderResponse>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RecepBookingDetailResponseImplCopyWith<$Res>
    implements $RecepBookingDetailResponseCopyWith<$Res> {
  factory _$$RecepBookingDetailResponseImplCopyWith(
    _$RecepBookingDetailResponseImpl value,
    $Res Function(_$RecepBookingDetailResponseImpl) then,
  ) = __$$RecepBookingDetailResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String guestName,
    String phoneNumber,
    String checkInDate,
    String checkOutDate,
    String status,
    num totalPrice,
    num totalAddOnCharges,
    List<HotelGuestResponse>? manifest,
    List<RoomAllocationResponse>? roomAllocations,
    List<RecepAddOnOrderResponse>? addOnOrders,
  });
}

/// @nodoc
class __$$RecepBookingDetailResponseImplCopyWithImpl<$Res>
    extends
        _$RecepBookingDetailResponseCopyWithImpl<
          $Res,
          _$RecepBookingDetailResponseImpl
        >
    implements _$$RecepBookingDetailResponseImplCopyWith<$Res> {
  __$$RecepBookingDetailResponseImplCopyWithImpl(
    _$RecepBookingDetailResponseImpl _value,
    $Res Function(_$RecepBookingDetailResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecepBookingDetailResponse
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
    Object? totalPrice = null,
    Object? totalAddOnCharges = null,
    Object? manifest = freezed,
    Object? roomAllocations = freezed,
    Object? addOnOrders = freezed,
  }) {
    return _then(
      _$RecepBookingDetailResponseImpl(
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
        totalPrice: null == totalPrice
            ? _value.totalPrice
            : totalPrice // ignore: cast_nullable_to_non_nullable
                  as num,
        totalAddOnCharges: null == totalAddOnCharges
            ? _value.totalAddOnCharges
            : totalAddOnCharges // ignore: cast_nullable_to_non_nullable
                  as num,
        manifest: freezed == manifest
            ? _value._manifest
            : manifest // ignore: cast_nullable_to_non_nullable
                  as List<HotelGuestResponse>?,
        roomAllocations: freezed == roomAllocations
            ? _value._roomAllocations
            : roomAllocations // ignore: cast_nullable_to_non_nullable
                  as List<RoomAllocationResponse>?,
        addOnOrders: freezed == addOnOrders
            ? _value._addOnOrders
            : addOnOrders // ignore: cast_nullable_to_non_nullable
                  as List<RecepAddOnOrderResponse>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RecepBookingDetailResponseImpl implements _RecepBookingDetailResponse {
  const _$RecepBookingDetailResponseImpl({
    required this.id,
    required this.guestName,
    required this.phoneNumber,
    required this.checkInDate,
    required this.checkOutDate,
    required this.status,
    required this.totalPrice,
    required this.totalAddOnCharges,
    required final List<HotelGuestResponse>? manifest,
    required final List<RoomAllocationResponse>? roomAllocations,
    required final List<RecepAddOnOrderResponse>? addOnOrders,
  }) : _manifest = manifest,
       _roomAllocations = roomAllocations,
       _addOnOrders = addOnOrders;

  factory _$RecepBookingDetailResponseImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$RecepBookingDetailResponseImplFromJson(json);

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
  final num totalPrice;
  @override
  final num totalAddOnCharges;
  final List<HotelGuestResponse>? _manifest;
  @override
  List<HotelGuestResponse>? get manifest {
    final value = _manifest;
    if (value == null) return null;
    if (_manifest is EqualUnmodifiableListView) return _manifest;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<RoomAllocationResponse>? _roomAllocations;
  @override
  List<RoomAllocationResponse>? get roomAllocations {
    final value = _roomAllocations;
    if (value == null) return null;
    if (_roomAllocations is EqualUnmodifiableListView) return _roomAllocations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<RecepAddOnOrderResponse>? _addOnOrders;
  @override
  List<RecepAddOnOrderResponse>? get addOnOrders {
    final value = _addOnOrders;
    if (value == null) return null;
    if (_addOnOrders is EqualUnmodifiableListView) return _addOnOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RecepBookingDetailResponse(id: $id, guestName: $guestName, phoneNumber: $phoneNumber, checkInDate: $checkInDate, checkOutDate: $checkOutDate, status: $status, totalPrice: $totalPrice, totalAddOnCharges: $totalAddOnCharges, manifest: $manifest, roomAllocations: $roomAllocations, addOnOrders: $addOnOrders)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecepBookingDetailResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.guestName, guestName) ||
                other.guestName == guestName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.checkInDate, checkInDate) ||
                other.checkInDate == checkInDate) &&
            (identical(other.checkOutDate, checkOutDate) ||
                other.checkOutDate == checkOutDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.totalAddOnCharges, totalAddOnCharges) ||
                other.totalAddOnCharges == totalAddOnCharges) &&
            const DeepCollectionEquality().equals(other._manifest, _manifest) &&
            const DeepCollectionEquality().equals(
              other._roomAllocations,
              _roomAllocations,
            ) &&
            const DeepCollectionEquality().equals(
              other._addOnOrders,
              _addOnOrders,
            ));
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
    totalPrice,
    totalAddOnCharges,
    const DeepCollectionEquality().hash(_manifest),
    const DeepCollectionEquality().hash(_roomAllocations),
    const DeepCollectionEquality().hash(_addOnOrders),
  );

  /// Create a copy of RecepBookingDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecepBookingDetailResponseImplCopyWith<_$RecepBookingDetailResponseImpl>
  get copyWith =>
      __$$RecepBookingDetailResponseImplCopyWithImpl<
        _$RecepBookingDetailResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecepBookingDetailResponseImplToJson(this);
  }
}

abstract class _RecepBookingDetailResponse
    implements RecepBookingDetailResponse {
  const factory _RecepBookingDetailResponse({
    required final String id,
    required final String guestName,
    required final String phoneNumber,
    required final String checkInDate,
    required final String checkOutDate,
    required final String status,
    required final num totalPrice,
    required final num totalAddOnCharges,
    required final List<HotelGuestResponse>? manifest,
    required final List<RoomAllocationResponse>? roomAllocations,
    required final List<RecepAddOnOrderResponse>? addOnOrders,
  }) = _$RecepBookingDetailResponseImpl;

  factory _RecepBookingDetailResponse.fromJson(Map<String, dynamic> json) =
      _$RecepBookingDetailResponseImpl.fromJson;

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
  @override
  num get totalPrice;
  @override
  num get totalAddOnCharges;
  @override
  List<HotelGuestResponse>? get manifest;
  @override
  List<RoomAllocationResponse>? get roomAllocations;
  @override
  List<RecepAddOnOrderResponse>? get addOnOrders;

  /// Create a copy of RecepBookingDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecepBookingDetailResponseImplCopyWith<_$RecepBookingDetailResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

HotelGuestResponse _$HotelGuestResponseFromJson(Map<String, dynamic> json) {
  return _HotelGuestResponse.fromJson(json);
}

/// @nodoc
mixin _$HotelGuestResponse {
  String get id => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get identityNumber => throw _privateConstructorUsedError;
  String get dateOfBirth => throw _privateConstructorUsedError;
  String get memberType => throw _privateConstructorUsedError;

  /// Serializes this HotelGuestResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HotelGuestResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HotelGuestResponseCopyWith<HotelGuestResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HotelGuestResponseCopyWith<$Res> {
  factory $HotelGuestResponseCopyWith(
    HotelGuestResponse value,
    $Res Function(HotelGuestResponse) then,
  ) = _$HotelGuestResponseCopyWithImpl<$Res, HotelGuestResponse>;
  @useResult
  $Res call({
    String id,
    String fullName,
    String identityNumber,
    String dateOfBirth,
    String memberType,
  });
}

/// @nodoc
class _$HotelGuestResponseCopyWithImpl<$Res, $Val extends HotelGuestResponse>
    implements $HotelGuestResponseCopyWith<$Res> {
  _$HotelGuestResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HotelGuestResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? identityNumber = null,
    Object? dateOfBirth = null,
    Object? memberType = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            fullName: null == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String,
            identityNumber: null == identityNumber
                ? _value.identityNumber
                : identityNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            dateOfBirth: null == dateOfBirth
                ? _value.dateOfBirth
                : dateOfBirth // ignore: cast_nullable_to_non_nullable
                      as String,
            memberType: null == memberType
                ? _value.memberType
                : memberType // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HotelGuestResponseImplCopyWith<$Res>
    implements $HotelGuestResponseCopyWith<$Res> {
  factory _$$HotelGuestResponseImplCopyWith(
    _$HotelGuestResponseImpl value,
    $Res Function(_$HotelGuestResponseImpl) then,
  ) = __$$HotelGuestResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String fullName,
    String identityNumber,
    String dateOfBirth,
    String memberType,
  });
}

/// @nodoc
class __$$HotelGuestResponseImplCopyWithImpl<$Res>
    extends _$HotelGuestResponseCopyWithImpl<$Res, _$HotelGuestResponseImpl>
    implements _$$HotelGuestResponseImplCopyWith<$Res> {
  __$$HotelGuestResponseImplCopyWithImpl(
    _$HotelGuestResponseImpl _value,
    $Res Function(_$HotelGuestResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HotelGuestResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? identityNumber = null,
    Object? dateOfBirth = null,
    Object? memberType = null,
  }) {
    return _then(
      _$HotelGuestResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        fullName: null == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String,
        identityNumber: null == identityNumber
            ? _value.identityNumber
            : identityNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        dateOfBirth: null == dateOfBirth
            ? _value.dateOfBirth
            : dateOfBirth // ignore: cast_nullable_to_non_nullable
                  as String,
        memberType: null == memberType
            ? _value.memberType
            : memberType // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HotelGuestResponseImpl implements _HotelGuestResponse {
  const _$HotelGuestResponseImpl({
    required this.id,
    required this.fullName,
    required this.identityNumber,
    required this.dateOfBirth,
    required this.memberType,
  });

  factory _$HotelGuestResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$HotelGuestResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String fullName;
  @override
  final String identityNumber;
  @override
  final String dateOfBirth;
  @override
  final String memberType;

  @override
  String toString() {
    return 'HotelGuestResponse(id: $id, fullName: $fullName, identityNumber: $identityNumber, dateOfBirth: $dateOfBirth, memberType: $memberType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HotelGuestResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.identityNumber, identityNumber) ||
                other.identityNumber == identityNumber) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.memberType, memberType) ||
                other.memberType == memberType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    fullName,
    identityNumber,
    dateOfBirth,
    memberType,
  );

  /// Create a copy of HotelGuestResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HotelGuestResponseImplCopyWith<_$HotelGuestResponseImpl> get copyWith =>
      __$$HotelGuestResponseImplCopyWithImpl<_$HotelGuestResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$HotelGuestResponseImplToJson(this);
  }
}

abstract class _HotelGuestResponse implements HotelGuestResponse {
  const factory _HotelGuestResponse({
    required final String id,
    required final String fullName,
    required final String identityNumber,
    required final String dateOfBirth,
    required final String memberType,
  }) = _$HotelGuestResponseImpl;

  factory _HotelGuestResponse.fromJson(Map<String, dynamic> json) =
      _$HotelGuestResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get fullName;
  @override
  String get identityNumber;
  @override
  String get dateOfBirth;
  @override
  String get memberType;

  /// Create a copy of HotelGuestResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HotelGuestResponseImplCopyWith<_$HotelGuestResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RoomAllocationResponse _$RoomAllocationResponseFromJson(
  Map<String, dynamic> json,
) {
  return _RoomAllocationResponse.fromJson(json);
}

/// @nodoc
mixin _$RoomAllocationResponse {
  String get roomTypeId => throw _privateConstructorUsedError;
  String get roomTypeName => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  List<String> get assignedRoomNumbers => throw _privateConstructorUsedError;

  /// Serializes this RoomAllocationResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RoomAllocationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RoomAllocationResponseCopyWith<RoomAllocationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomAllocationResponseCopyWith<$Res> {
  factory $RoomAllocationResponseCopyWith(
    RoomAllocationResponse value,
    $Res Function(RoomAllocationResponse) then,
  ) = _$RoomAllocationResponseCopyWithImpl<$Res, RoomAllocationResponse>;
  @useResult
  $Res call({
    String roomTypeId,
    String roomTypeName,
    int quantity,
    List<String> assignedRoomNumbers,
  });
}

/// @nodoc
class _$RoomAllocationResponseCopyWithImpl<
  $Res,
  $Val extends RoomAllocationResponse
>
    implements $RoomAllocationResponseCopyWith<$Res> {
  _$RoomAllocationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RoomAllocationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomTypeId = null,
    Object? roomTypeName = null,
    Object? quantity = null,
    Object? assignedRoomNumbers = null,
  }) {
    return _then(
      _value.copyWith(
            roomTypeId: null == roomTypeId
                ? _value.roomTypeId
                : roomTypeId // ignore: cast_nullable_to_non_nullable
                      as String,
            roomTypeName: null == roomTypeName
                ? _value.roomTypeName
                : roomTypeName // ignore: cast_nullable_to_non_nullable
                      as String,
            quantity: null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as int,
            assignedRoomNumbers: null == assignedRoomNumbers
                ? _value.assignedRoomNumbers
                : assignedRoomNumbers // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RoomAllocationResponseImplCopyWith<$Res>
    implements $RoomAllocationResponseCopyWith<$Res> {
  factory _$$RoomAllocationResponseImplCopyWith(
    _$RoomAllocationResponseImpl value,
    $Res Function(_$RoomAllocationResponseImpl) then,
  ) = __$$RoomAllocationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String roomTypeId,
    String roomTypeName,
    int quantity,
    List<String> assignedRoomNumbers,
  });
}

/// @nodoc
class __$$RoomAllocationResponseImplCopyWithImpl<$Res>
    extends
        _$RoomAllocationResponseCopyWithImpl<$Res, _$RoomAllocationResponseImpl>
    implements _$$RoomAllocationResponseImplCopyWith<$Res> {
  __$$RoomAllocationResponseImplCopyWithImpl(
    _$RoomAllocationResponseImpl _value,
    $Res Function(_$RoomAllocationResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RoomAllocationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomTypeId = null,
    Object? roomTypeName = null,
    Object? quantity = null,
    Object? assignedRoomNumbers = null,
  }) {
    return _then(
      _$RoomAllocationResponseImpl(
        roomTypeId: null == roomTypeId
            ? _value.roomTypeId
            : roomTypeId // ignore: cast_nullable_to_non_nullable
                  as String,
        roomTypeName: null == roomTypeName
            ? _value.roomTypeName
            : roomTypeName // ignore: cast_nullable_to_non_nullable
                  as String,
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as int,
        assignedRoomNumbers: null == assignedRoomNumbers
            ? _value._assignedRoomNumbers
            : assignedRoomNumbers // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RoomAllocationResponseImpl implements _RoomAllocationResponse {
  const _$RoomAllocationResponseImpl({
    required this.roomTypeId,
    required this.roomTypeName,
    required this.quantity,
    required final List<String> assignedRoomNumbers,
  }) : _assignedRoomNumbers = assignedRoomNumbers;

  factory _$RoomAllocationResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomAllocationResponseImplFromJson(json);

  @override
  final String roomTypeId;
  @override
  final String roomTypeName;
  @override
  final int quantity;
  final List<String> _assignedRoomNumbers;
  @override
  List<String> get assignedRoomNumbers {
    if (_assignedRoomNumbers is EqualUnmodifiableListView)
      return _assignedRoomNumbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assignedRoomNumbers);
  }

  @override
  String toString() {
    return 'RoomAllocationResponse(roomTypeId: $roomTypeId, roomTypeName: $roomTypeName, quantity: $quantity, assignedRoomNumbers: $assignedRoomNumbers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomAllocationResponseImpl &&
            (identical(other.roomTypeId, roomTypeId) ||
                other.roomTypeId == roomTypeId) &&
            (identical(other.roomTypeName, roomTypeName) ||
                other.roomTypeName == roomTypeName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            const DeepCollectionEquality().equals(
              other._assignedRoomNumbers,
              _assignedRoomNumbers,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    roomTypeId,
    roomTypeName,
    quantity,
    const DeepCollectionEquality().hash(_assignedRoomNumbers),
  );

  /// Create a copy of RoomAllocationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomAllocationResponseImplCopyWith<_$RoomAllocationResponseImpl>
  get copyWith =>
      __$$RoomAllocationResponseImplCopyWithImpl<_$RoomAllocationResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomAllocationResponseImplToJson(this);
  }
}

abstract class _RoomAllocationResponse implements RoomAllocationResponse {
  const factory _RoomAllocationResponse({
    required final String roomTypeId,
    required final String roomTypeName,
    required final int quantity,
    required final List<String> assignedRoomNumbers,
  }) = _$RoomAllocationResponseImpl;

  factory _RoomAllocationResponse.fromJson(Map<String, dynamic> json) =
      _$RoomAllocationResponseImpl.fromJson;

  @override
  String get roomTypeId;
  @override
  String get roomTypeName;
  @override
  int get quantity;
  @override
  List<String> get assignedRoomNumbers;

  /// Create a copy of RoomAllocationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoomAllocationResponseImplCopyWith<_$RoomAllocationResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
