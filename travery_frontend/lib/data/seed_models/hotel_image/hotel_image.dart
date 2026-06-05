import 'package:freezed_annotation/freezed_annotation.dart';

part 'hotel_image.freezed.dart';
part 'hotel_image.g.dart';

@freezed
abstract class HotelImage with _$HotelImage {
  const factory HotelImage({
    String? id,

    @JsonKey(name: 'hotel_id') required String hotelId,

    @JsonKey(name: 'image_url') required String imageUrl,

    @JsonKey(name: 'display_order') required int displayOrder,

    @JsonKey(name: 'created_at') DateTime? createdAt,

    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _HotelImage;

  factory HotelImage.fromJson(Map<String, dynamic> json) =>
      _$HotelImageFromJson(json);
}
