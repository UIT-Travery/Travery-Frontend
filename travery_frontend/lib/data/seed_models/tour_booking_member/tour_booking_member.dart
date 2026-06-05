import 'package:freezed_annotation/freezed_annotation.dart';

part 'tour_booking_member.freezed.dart';
part 'tour_booking_member.g.dart';

@freezed
abstract class TourBookingMember with _$TourBookingMember {
  const factory TourBookingMember({
    String? id,

    @JsonKey(name: 'tour_booking_id') required String tourBookingId,

    @JsonKey(name: 'full_name') required String fullName,

    @JsonKey(name: 'identity_number') String? identityNumber,

    @JsonKey(name: 'identity_type') IdentityType? identityType,

    @JsonKey(name: 'is_child') required bool isChild,

    required BookingMemberStatus status,

    @JsonKey(name: 'cancelled_at') DateTime? cancelledAt,

    @JsonKey(name: 'created_at') DateTime? createdAt,

    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _TourBookingMember;

  factory TourBookingMember.fromJson(Map<String, dynamic> json) =>
      _$TourBookingMemberFromJson(json);
}

@JsonEnum()
enum BookingMemberStatus { active, cancelled }

@JsonEnum()
enum IdentityType { cccd, passport, birthCertificate }
