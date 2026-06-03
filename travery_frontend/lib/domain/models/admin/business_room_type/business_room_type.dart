enum BedType { single, double, twin }

class BusinessRoomType {
  final String name;
  final double pricePerNight;
  final int aldultCapacity;
  final int childCapacity;
  final BedType bedType;

  BusinessRoomType({
    required this.name,
    required this.pricePerNight,
    required this.aldultCapacity,
    required this.childCapacity,
    required this.bedType,
  });
}
