import 'package:travery_frontend/data/services/api/model/amenity/create_amenity_request.dart';

/// UpdateAmenityRequest — multipart/form-data body for PATCH /api/v1/admin/amenities/{amenityId}.
/// All fields optional.
class UpdateAmenityRequest {
  final String? name;
  final AmenityType? type;
  final String? iconImagePath;

  const UpdateAmenityRequest({
    this.name,
    this.type,
    this.iconImagePath,
  });
}
