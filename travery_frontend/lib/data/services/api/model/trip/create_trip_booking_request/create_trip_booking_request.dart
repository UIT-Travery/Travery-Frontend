class CreateTripBookingRequest {
  const CreateTripBookingRequest({
    required this.tripId,
    required this.seatLayoutItemIds,
    required this.contactName,
    required this.contactPhone,
  });

  final String tripId;
  final List<String> seatLayoutItemIds;
  final String contactName;
  final String contactPhone;

  Map<String, dynamic> toJson() {
    return {
      'tripId': tripId,
      'seatLayoutItemIds': seatLayoutItemIds,
      'contactName': contactName,
      'contactPhone': contactPhone,
    };
  }
}
