import 'package:travery_frontend/data/services/api/model/hotel/hotel_service_response.dart';

/// CreateHotelServiceRequest — body for POST /api/v1/admin/hotels/{hotelId}/services.
class CreateHotelServiceRequest {
  final String name;
  final HotelServiceCategory category;
  final double price;
  final String unit;
  final String? description;

  const CreateHotelServiceRequest({
    required this.name,
    required this.category,
    required this.price,
    required this.unit,
    this.description,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'category': category.apiValue,
        'price': price,
        'unit': unit,
        if (description != null) 'description': description,
      };
}
