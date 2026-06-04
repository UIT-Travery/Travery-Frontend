import 'package:travery_frontend/data/services/api/model/hotel/amenity_response.dart';

/// HotelBasicResponse — returned by createHotel and updateHotel.
class HotelBasicResponse {
  final String id;
  final String name;
  final String? description;
  final String address;
  final String cityProvince;
  final String? checkInTime;
  final String? checkOutTime;
  final List<AmenityResponse> amenities;
  final int? averageRating;

  const HotelBasicResponse({
    required this.id,
    required this.name,
    this.description,
    required this.address,
    required this.cityProvince,
    this.checkInTime,
    this.checkOutTime,
    this.amenities = const [],
    this.averageRating,
  });

  factory HotelBasicResponse.fromJson(Map<String, dynamic> json) {
    final amenitiesJson = json['amenities'] as List<dynamic>? ?? [];
    return HotelBasicResponse(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String?,
      address: json['address'] as String? ?? '',
      cityProvince: json['cityProvince'] as String? ?? '',
      checkInTime: _parseLocalTime(json['checkInTime']),
      checkOutTime: _parseLocalTime(json['checkOutTime']),
      amenities: amenitiesJson
          .map((e) => AmenityResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      averageRating: json['averageRating'] as int?,
    );
  }

  /// LocalTime from backend is either a String "HH:mm:ss" or a list [H, m, s].
  static String? _parseLocalTime(dynamic value) {
    if (value == null) return null;
    if (value is String) return value;
    if (value is List) {
      // [hour, minute] or [hour, minute, second]
      final h = value[0].toString().padLeft(2, '0');
      final m = (value.length > 1 ? value[1] : 0).toString().padLeft(2, '0');
      return '$h:$m';
    }
    return value.toString();
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'address': address,
    'cityProvince': cityProvince,
    'checkInTime': checkInTime,
    'checkOutTime': checkOutTime,
    'amenities': amenities.map((a) => a.toJson()).toList(),
    'averageRating': averageRating,
  };
}

/// HotelPage — the `data` field of SingleResponsePageHotelResponse.
class HotelPage {
  final List<HotelBasicResponse> content;
  final int totalElements;
  final int totalPages;
  final int number; // current page (0-indexed)
  final bool last;

  const HotelPage({
    required this.content,
    required this.totalElements,
    required this.totalPages,
    required this.number,
    required this.last,
  });

  factory HotelPage.fromJson(Map<String, dynamic> json) {
    final contentJson = json['content'] as List<dynamic>? ?? [];
    return HotelPage(
      content: contentJson
          .map((e) => HotelBasicResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalElements: json['totalElements'] as int? ?? 0,
      totalPages: json['totalPages'] as int? ?? 0,
      number: json['number'] as int? ?? 0,
      last: json['last'] as bool? ?? true,
    );
  }
}
