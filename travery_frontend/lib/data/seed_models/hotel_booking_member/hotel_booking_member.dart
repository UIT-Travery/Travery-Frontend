import 'package:freezed_annotation/freezed_annotation.dart';

part 'hotel_booking_member.freezed.dart';
part 'hotel_booking_member.g.dart';

@freezed
abstract class HotelBookingMember with _$HotelBookingMember {
  const factory HotelBookingMember({
    String? id,

    @JsonKey(name: 'hotel_booking_id') required String hotelBookingId,

    @JsonKey(name: 'full_name') required String fullName,

    required String cccd,

    @JsonKey(name: 'created_at') DateTime? createdAt,

    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _HotelBookingMember;

  factory HotelBookingMember.fromJson(Map<String, dynamic> json) =>
      _$HotelBookingMemberFromJson(json);
}
