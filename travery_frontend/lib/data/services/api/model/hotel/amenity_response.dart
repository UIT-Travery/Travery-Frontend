/// AmenityResponse — shared by both hotel and amenity controllers.
class AmenityResponse {
  final String id;
  final String name;
  final String? iconUrl;
  final String type; // "HOTEL_AMENITY" | "ROOM_AMENITY"

  const AmenityResponse({
    required this.id,
    required this.name,
    this.iconUrl,
    required this.type,
  });

  factory AmenityResponse.fromJson(Map<String, dynamic> json) {
    return AmenityResponse(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      iconUrl: json['iconUrl'] as String?,
      type: json['type'] as String? ?? 'HOTEL_AMENITY',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'iconUrl': iconUrl,
        'type': type,
      };
}
