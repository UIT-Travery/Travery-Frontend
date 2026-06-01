import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_response.freezed.dart';
part 'image_response.g.dart';

@freezed
class ImageResponse with _$ImageResponse {
  const factory ImageResponse({
    required String url,
    @Default(false) bool isThumbnail,
  }) = _ImageResponse;

  factory ImageResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageResponseFromJson(json);
}
