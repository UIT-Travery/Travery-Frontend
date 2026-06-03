class TripSeatData {
  const TripSeatData({
    required this.tripId,
    required this.coachType,
    required this.totalSeats,
    required this.availableSeats,
    required this.seats,
  });

  final String tripId;
  final String coachType;
  final int totalSeats;
  final int availableSeats;
  final List<SeatItem> seats;

  factory TripSeatData.fromJson(Map<String, dynamic> json) {
    return TripSeatData(
      tripId: json['tripId'] as String? ?? '',
      coachType: json['coachType'] as String? ?? 'SEAT',
      totalSeats: json['totalSeats'] as int? ?? 0,
      availableSeats: json['availableSeats'] as int? ?? 0,
      seats:
          (json['seats'] as List<dynamic>?)
              ?.map((e) => SeatItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  bool get isDoubleDecker => coachType == 'BED';
}

class SeatItem {
  const SeatItem({
    required this.seatLayoutItemId,
    required this.seatName,
    required this.tier,
    required this.position,
    required this.rowNumber,
    required this.columnNumber,
    required this.status,
  });

  final String seatLayoutItemId;
  final String seatName;
  final String tier;
  final String position;
  final int rowNumber;
  final int columnNumber;
  final String status;

  factory SeatItem.fromJson(Map<String, dynamic> json) {
    return SeatItem(
      seatLayoutItemId: json['seatLayoutItemId'] as String? ?? '',
      seatName: json['seatName'] as String? ?? '',
      tier: json['tier'] as String? ?? 'MAIN',
      position: json['position'] as String? ?? 'MIDDLE',
      rowNumber: json['rowNumber'] as int? ?? 0,
      columnNumber: json['columnNumber'] as int? ?? 0,
      status: json['status'] as String? ?? 'AVAILABLE',
    );
  }

  bool get isAvailable => status == 'AVAILABLE';
  bool get isUpperTier => tier == 'UPPER';
}

enum SeatTier {
  main('MAIN', 'Tầng dưới'),
  upper('UPPER', 'Tầng trên');

  const SeatTier(this.value, this.label);
  final String value;
  final String label;
}

enum SeatStatus {
  available('AVAILABLE', 'Còn trống'),
  booked('BOOKED', 'Đã đặt'),
  selected('SELECTED', 'Đã chọn');

  const SeatStatus(this.value, this.label);
  final String value;
  final String label;
}
