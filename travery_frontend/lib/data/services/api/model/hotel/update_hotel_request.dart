/// UpdateHotelRequest — body for PATCH /api/v1/admin/hotels/{hotelId}.
/// All fields are optional (partial update).
class UpdateHotelRequest {
  final String? name;
  final String? description;
  final String? address;
  final String? cityProvince;
  final String? checkInTime;
  final String? checkOutTime;
  final List<String>? amenityIds;
  final String? refundPolicyId;

  const UpdateHotelRequest({
    this.name,
    this.description,
    this.address,
    this.cityProvince,
    this.checkInTime,
    this.checkOutTime,
    this.amenityIds,
    this.refundPolicyId,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (name != null) map['name'] = name;
    if (description != null) map['description'] = description;
    if (address != null) map['address'] = address;
    if (cityProvince != null) map['cityProvince'] = cityProvince;
    if (checkInTime != null) map['checkInTime'] = checkInTime;
    if (checkOutTime != null) map['checkOutTime'] = checkOutTime;
    if (amenityIds != null) map['amenityIds'] = amenityIds;
    if (refundPolicyId != null) map['refundPolicyId'] = refundPolicyId;
    return map;
  }
}
