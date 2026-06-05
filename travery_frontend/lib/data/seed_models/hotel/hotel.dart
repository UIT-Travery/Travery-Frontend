import 'package:freezed_annotation/freezed_annotation.dart';

import '../hotel_image/hotel_image.dart';
import '../room_type/room_type.dart';

part 'hotel.freezed.dart';
part 'hotel.g.dart';

@freezed
abstract class Hotel with _$Hotel {
  const factory Hotel({
    String? id,

    required String name,

    String? description,

    String? address,

    String? city,

    @JsonKey(name: 'location_code') String? locationCode,

    Map<String, dynamic>? amenities,

    @JsonKey(name: 'created_at') DateTime? createdAt,

    @JsonKey(name: 'updated_at') DateTime? updatedAt,

    @JsonKey(name: 'deleted_at') DateTime? deletedAt,

    /// RELATIONS
    List<HotelImage>? images,
    List<RoomType>? roomTypes,
  }) = _Hotel;

  factory Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);
}
