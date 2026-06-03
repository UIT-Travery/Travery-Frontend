import 'package:travery_frontend/data/services/api/model/hotel/room_type_response.dart';

/// CreateRoomTypeRequest — body for POST /api/v1/admin/hotels/{hotelId}/room-types.
class CreateRoomTypeRequest {
  final String name;
  final String? description;
  final int? capacityAdults;
  final int? capacityChildren;
  final double basePrice;
  final RoomBedType bedType;
  final int? area;

  const CreateRoomTypeRequest({
    required this.name,
    this.description,
    this.capacityAdults,
    this.capacityChildren,
    required this.basePrice,
    required this.bedType,
    this.area,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        if (description != null) 'description': description,
        if (capacityAdults != null) 'capacityAdults': capacityAdults,
        if (capacityChildren != null) 'capacityChildren': capacityChildren,
        'basePrice': basePrice,
        'bedType': bedType.apiValue,
        if (area != null) 'area': area,
      };
}
