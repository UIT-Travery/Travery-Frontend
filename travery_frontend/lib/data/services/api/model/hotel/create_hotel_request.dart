/// CreateHotelRequest — body for POST /api/v1/admin/hotels.
class CreateHotelRequest {
  final String name;
  final String? description;
  final String address;
  final String cityProvince;
  final String checkInTime;  // "HH:mm"
  final String checkOutTime; // "HH:mm"
  final List<String> amenityIds;
  final String refundPolicyId;

  const CreateHotelRequest({
    required this.name,
    this.description,
    required this.address,
    required this.cityProvince,
    required this.checkInTime,
    required this.checkOutTime,
    this.amenityIds = const [],
    required this.refundPolicyId,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        if (description != null) 'description': description,
        'address': address,
        'cityProvince': cityProvince,
        'checkInTime': checkInTime,
        'checkOutTime': checkOutTime,
        'amenityIds': amenityIds,
        'refundPolicyId': refundPolicyId,
      };
}
