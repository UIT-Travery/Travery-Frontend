enum BusinessHotelServiceType { spa, laundry, restaurant }

enum BusinessHotelServiceUnit { item, kg, person }

class BusinessHotelService {
  final String name;
  final double price;
  final BusinessHotelServiceType type;
  final BusinessHotelServiceUnit unit;

  BusinessHotelService({
    required this.name,
    required this.price,
    required this.type,
    required this.unit,
  });
}
