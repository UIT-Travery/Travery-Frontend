import 'package:travery_frontend/data/services/api/model/hotel/amenity_response.dart';
import 'package:travery_frontend/data/services/api/model/hotel/hotel_image_response.dart';

/// Bed type enum matching backend SINGLE | DOUBLE | TWIN.
enum RoomBedType { single, double_, twin }

extension RoomBedTypeX on RoomBedType {
  String get apiValue {
    switch (this) {
      case RoomBedType.single:
        return 'SINGLE';
      case RoomBedType.double_:
        return 'DOUBLE';
      case RoomBedType.twin:
        return 'TWIN';
    }
  }

  String get displayName {
    switch (this) {
      case RoomBedType.single:
        return '1 Giường Single';
      case RoomBedType.double_:
        return '1 Giường Double';
      case RoomBedType.twin:
        return '2 Giường Twin';
    }
  }

  static RoomBedType fromApi(String? value) {
    switch (value) {
      case 'SINGLE':
        return RoomBedType.single;
      case 'DOUBLE':
        return RoomBedType.double_;
      case 'TWIN':
        return RoomBedType.twin;
      default:
        return RoomBedType.single;
    }
  }
}

/// RoomTypeResponse — returned by getRoomTypes and createRoomType.
class RoomTypeResponse {
  final String id;
  final String name;
  final String? description;
  final double basePrice;
  final int? capacityAdults;
  final int? capacityChildren;
  final RoomBedType bedType;
  final List<AmenityResponse> amenities;
  final List<HotelImageResponse> images;

  const RoomTypeResponse({
    required this.id,
    required this.name,
    this.description,
    required this.basePrice,
    this.capacityAdults,
    this.capacityChildren,
    required this.bedType,
    this.amenities = const [],
    this.images = const [],
  });

  factory RoomTypeResponse.fromJson(Map<String, dynamic> json) {
    final amenitiesJson = json['amenities'] as List<dynamic>? ?? [];
    final imagesJson = json['images'] as List<dynamic>? ?? [];
    return RoomTypeResponse(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String?,
      basePrice: (json['basePrice'] as num?)?.toDouble() ?? 0.0,
      capacityAdults: json['capacityAdults'] as int?,
      capacityChildren: json['capacityChildren'] as int?,
      bedType: RoomBedTypeX.fromApi(json['bedType'] as String?),
      amenities: amenitiesJson
          .map((e) => AmenityResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: imagesJson
          .map((e) => HotelImageResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'basePrice': basePrice,
        'capacityAdults': capacityAdults,
        'capacityChildren': capacityChildren,
        'bedType': bedType.apiValue,
        'amenities': amenities.map((a) => a.toJson()).toList(),
        'images': images.map((i) => i.toJson()).toList(),
      };
}
