import 'package:travery_frontend/data/seed_models/room/room.dart';

class BusinessHotel {
  const BusinessHotel({
    required this.id,
    required this.name,
    required this.address,
    required this.cityProvince,
    this.starRating,
    this.occupancyRate,
    this.roomCount,
    this.imageUrl,
    this.rooms = const [],
    this.images = const [],
  });

  final String id;
  final String name;
  final String address;
  final String cityProvince;
  final double? starRating;
  final double? occupancyRate;
  final int? roomCount;
  final String? imageUrl;
  final List<Room> rooms;
  final List<dynamic> images;
}
