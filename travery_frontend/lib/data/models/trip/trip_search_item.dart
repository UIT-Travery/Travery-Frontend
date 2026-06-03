import 'package:travery_frontend/data/services/api/model/trip/search_trip_request/search_trip_request.dart';
import 'package:travery_frontend/data/models/trip/destination_data.dart';

class TripSearchItem {
  const TripSearchItem({
    required this.id,
    required this.departureTime,
    required this.arrivalTime,
    required this.coachType,
    required this.totalSeats,
    required this.availableSeats,
    required this.basePrice,
    required this.originDestination,
    required this.destinationDestination,
    required this.status,
  });

  final String id;
  final DateTime departureTime;
  final DateTime arrivalTime;
  final String coachType;
  final int totalSeats;
  final int availableSeats;
  final double basePrice;
  final DestinationData originDestination;
  final DestinationData destinationDestination;
  final String status;

  factory TripSearchItem.fromJson(Map<String, dynamic> json) {
    return TripSearchItem(
      id: json['id'] as String? ?? '',
      departureTime:
          DateTime.tryParse(json['departureTime'] as String? ?? '') ??
          DateTime.now(),
      arrivalTime:
          DateTime.tryParse(json['arrivalTime'] as String? ?? '') ??
          DateTime.now(),
      coachType: json['coachType'] as String? ?? 'SEAT',
      totalSeats: json['totalSeats'] as int? ?? 0,
      availableSeats: json['availableSeats'] as int? ?? 0,
      basePrice: (json['basePrice'] as num?)?.toDouble() ?? 0.0,
      originDestination: json['originDestination'] == null
          ? const DestinationData(id: '', name: '', code: '', stations: [])
          : DestinationData.fromJson(
              json['originDestination'] as Map<String, dynamic>,
            ),
      destinationDestination: json['destinationDestination'] == null
          ? const DestinationData(id: '', name: '', code: '', stations: [])
          : DestinationData.fromJson(
              json['destinationDestination'] as Map<String, dynamic>,
            ),
      status: json['status'] as String? ?? 'OPEN',
    );
  }
}

enum CoachType {
  seat('SEAT', 'Ghế ngồi'),
  bed('BED', 'Giường nằm'),
  limousine('LIMOUSINE', 'Limousine');

  const CoachType(this.value, this.label);
  final String value;
  final String label;
}

enum TimeSlot {
  earlyMorning('EARLY_MORNING', 'Rạng sáng (00:00 - 06:00)'),
  morning('MORNING', 'Sáng (06:00 - 12:00)'),
  afternoon('AFTERNOON', 'Chiều (12:00 - 18:00)'),
  evening('EVENING', 'Tối (18:00 - 24:00)');

  const TimeSlot(this.value, this.label);
  final String value;
  final String label;
}

SearchTripRequest buildSearchRequest({
  required String originId,
  required String destinationId,
  required DateTime departureDate,
  CoachType? coachType,
  TimeSlot? timeSlot,
  bool sortByPriceAsc = false,
}) {
  return SearchTripRequest(
    originId: originId,
    destinationId: destinationId,
    departureDate: departureDate.toIso8601String().split('T').first,
    coachType: coachType?.value,
    departureTimeSlot: timeSlot?.value,
    sortByPriceAsc: sortByPriceAsc ? true : null,
  );
}
