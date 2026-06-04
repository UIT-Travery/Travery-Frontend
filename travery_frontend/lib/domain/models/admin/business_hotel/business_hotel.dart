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
    this.description,
    this.checkInTime,
    this.checkOutTime,
    this.refundPolicy,
    this.amenities = const [],
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
  final String? description;
  final String? checkInTime;
  final String? checkOutTime;
  final Map<String, dynamic>? refundPolicy;
  final List<dynamic> amenities;
}
