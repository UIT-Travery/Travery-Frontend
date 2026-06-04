/// Service category enum matching backend FOOD | SPA | LAUNDRY | OTHER.
enum HotelServiceCategory { food, spa, laundry, other }

extension HotelServiceCategoryX on HotelServiceCategory {
  String get apiValue {
    switch (this) {
      case HotelServiceCategory.food:
        return 'FOOD';
      case HotelServiceCategory.spa:
        return 'SPA';
      case HotelServiceCategory.laundry:
        return 'LAUNDRY';
      case HotelServiceCategory.other:
        return 'OTHER';
    }
  }

  String get displayName {
    switch (this) {
      case HotelServiceCategory.food:
        return 'Ăn uống';
      case HotelServiceCategory.spa:
        return 'Spa';
      case HotelServiceCategory.laundry:
        return 'Giặt ủi';
      case HotelServiceCategory.other:
        return 'Khác';
    }
  }

  static HotelServiceCategory fromApi(String? value) {
    switch (value) {
      case 'FOOD':
        return HotelServiceCategory.food;
      case 'SPA':
        return HotelServiceCategory.spa;
      case 'LAUNDRY':
        return HotelServiceCategory.laundry;
      default:
        return HotelServiceCategory.other;
    }
  }
}

/// HotelServiceResponse — returned by getServices and createService.
class HotelServiceResponse {
  final String id;
  final String name;
  final HotelServiceCategory category;
  final double price;
  final String unit;
  final String? description;
  final bool active;

  const HotelServiceResponse({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.unit,
    this.description,
    required this.active,
  });

  factory HotelServiceResponse.fromJson(Map<String, dynamic> json) {
    return HotelServiceResponse(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      category: HotelServiceCategoryX.fromApi(json['category'] as String?),
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      unit: json['unit'] as String? ?? '',
      description: json['description'] as String?,
      active: json['active'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category': category.apiValue,
        'price': price,
        'unit': unit,
        'description': description,
        'active': active,
      };
}
