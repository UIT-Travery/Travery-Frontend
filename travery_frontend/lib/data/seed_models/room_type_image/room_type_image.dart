import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_type_image.freezed.dart';
part 'room_type_image.g.dart';

@freezed
abstract class RoomTypeImage with _$RoomTypeImage {
  const factory RoomTypeImage({
    String? id,

    @JsonKey(name: 'room_type_id') required String roomTypeId,

    @JsonKey(name: 'image_url') required String imageUrl,

    @JsonKey(name: 'display_order') required int displayOrder,

    @JsonKey(name: 'created_at') DateTime? createdAt,

    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _RoomTypeImage;

  factory RoomTypeImage.fromJson(Map<String, dynamic> json) =>
      _$RoomTypeImageFromJson(json);
}
