/// AmenityType enum matching backend HOTEL_AMENITY | ROOM_AMENITY.
enum AmenityType { hotelAmenity, roomAmenity }

extension AmenityTypeX on AmenityType {
  String get apiValue {
    switch (this) {
      case AmenityType.hotelAmenity:
        return 'HOTEL_AMENITY';
      case AmenityType.roomAmenity:
        return 'ROOM_AMENITY';
    }
  }

  String get displayName {
    switch (this) {
      case AmenityType.hotelAmenity:
        return 'Khách sạn';
      case AmenityType.roomAmenity:
        return 'Phòng';
    }
  }

  static AmenityType fromApi(String? value) {
    switch (value) {
      case 'HOTEL_AMENITY':
        return AmenityType.hotelAmenity;
      case 'ROOM_AMENITY':
        return AmenityType.roomAmenity;
      default:
        return AmenityType.hotelAmenity;
    }
  }
}

/// CreateAmenityRequest — multipart/form-data body for POST /api/v1/admin/amenities.
/// [iconImagePath] is the local file path to upload; null means no icon.
class CreateAmenityRequest {
  final String name;
  final AmenityType type;
  final String? iconImagePath;

  const CreateAmenityRequest({
    required this.name,
    required this.type,
    this.iconImagePath,
  });
}
