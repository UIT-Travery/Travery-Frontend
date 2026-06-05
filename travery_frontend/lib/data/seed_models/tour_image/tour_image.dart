import 'package:freezed_annotation/freezed_annotation.dart';
part 'tour_image.freezed.dart';
part 'tour_image.g.dart';

@freezed
abstract class TourImage with _$TourImage {
  const factory TourImage({
    String? id,

    @JsonKey(name: 'url') required String imageUrl,

    @JsonKey(name: 'isThumnail') @Default(false) bool isThumbnail,

    @Default(0) int displayOrder,
  }) = _TourImage;

  factory TourImage.fromJson(Map<String, dynamic> json) =>
      _$TourImageFromJson(json);
}
