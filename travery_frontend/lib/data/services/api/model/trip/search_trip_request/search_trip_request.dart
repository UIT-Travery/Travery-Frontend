class SearchTripRequest {
  const SearchTripRequest({
    required this.originId,
    required this.destinationId,
    required this.departureDate,
    this.coachType,
    this.departureTimeSlot,
    this.sortByPriceAsc,
  });

  final String originId;
  final String destinationId;
  final String departureDate;
  final String? coachType;
  final String? departureTimeSlot;
  final bool? sortByPriceAsc;

  Map<String, dynamic> toJson() {
    return {
      'originId': originId,
      'destinationId': destinationId,
      'departureDate': departureDate,
      if (coachType != null) 'coachType': coachType,
      if (departureTimeSlot != null) 'departureTimeSlot': departureTimeSlot,
      if (sortByPriceAsc != null) 'sortByPriceAsc': sortByPriceAsc,
    };
  }
}
