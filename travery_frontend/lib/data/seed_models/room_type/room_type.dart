import 'package:freezed_annotation/freezed_annotation.dart';

import '../room/room.dart';
import '../room_type_image/room_type_image.dart';

part 'room_type.freezed.dart';
part 'room_type.g.dart';

@freezed
abstract class RoomType with _$RoomType {
  const factory RoomType({
    String? id,

    @JsonKey(name: 'hotel_id') required String hotelId,

    required String name,

    String? description,

    @JsonKey(name: 'price_per_night') required double pricePerNight,

    @JsonKey(name: 'max_occupancy') required int maxOccupancy,

    @JsonKey(name: 'bed_count') required int bedCount,

    required BedType bedType,

    @JsonKey(name: 'created_at') DateTime? createdAt,

    @JsonKey(name: 'updated_at') DateTime? updatedAt,

    @JsonKey(name: 'deleted_at') DateTime? deletedAt,

    /// RELATIONS
    List<RoomTypeImage>? images,
    List<Room>? rooms,
  }) = _RoomType;

  factory RoomType.fromJson(Map<String, dynamic> json) =>
      _$RoomTypeFromJson(json);
}

@JsonEnum()
enum BedType { single, double, twin }
