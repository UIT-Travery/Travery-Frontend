/// HotelImageResponse — returned by uploadHotelImages, deleteHotelImage, setHotelThumbnail.
class HotelImageResponse {
  final String id;
  final String url;
  final bool thumbnail;

  const HotelImageResponse({
    required this.id,
    required this.url,
    required this.thumbnail,
  });

  factory HotelImageResponse.fromJson(Map<String, dynamic> json) {
    return HotelImageResponse(
      id: json['id'] as String? ?? '',
      url: json['url'] as String? ?? '',
      thumbnail: json['thumbnail'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'url': url,
        'thumbnail': thumbnail,
      };
}
