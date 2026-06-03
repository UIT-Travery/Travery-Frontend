enum BusinessAmenityType { hotel, room }

class BusinessAmenity {
  final String name;
  final String icon;
  final BusinessAmenityType type;

  BusinessAmenity({required this.name, required this.icon, required this.type});
}
